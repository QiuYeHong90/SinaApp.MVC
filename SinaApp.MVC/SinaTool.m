//
//  SinaTool.m
//  SinaApp.MVC
//
//  Created by mac on 16/5/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#define APP_KEY  @"1931149737"
#define APP_SECRET  @"3963d16e739f1597faa45ee4172d2f32"
#define REDIRECT_URL  @"https://api.weibo.com/oauth2/default.html"
#define ACCESS_TOKEN
#import "AFNetworking.h"
#import "SinaTool.h"
#import "DataModels.h"
@implementation SinaTool

+ (instancetype)sharedInstance{
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}


-(NSURLRequest*)oauthRequest
{
    NSString * urlString=[NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&&redirect_uri=%@",APP_KEY,REDIRECT_URL];
    NSURL * url = [NSURL URLWithString:urlString];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    return request;
}
-(void)refeashDataWith:(UIViewController*)viewController
{
    
    switch (viewController.tabBarItem.tag) {
        case 0:
            [self getDataHomeTimelineWithToken:[[NSUserDefaults standardUserDefaults] objectForKey:@"tokenString"]];
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        default:
            break;
    }
    
}
-(void)getDataHomeTimelineWithToken:(NSString*)token
{
    /*
     https://api.weibo.com/2/statuses/home_timeline.json
     支持格式
     JSON
     HTTP请求方式
     GET
     是否需要登录
     是
     关于登录授权，参见 如何登录授权
     访问授权限制
     访问级别：普通接口
     频次限制：是
     关于频次限制，参见 接口访问权限说明
     请求参数
     必选	类型及范围	说明
     access_token	true	string	采用OAuth授权方式为必填参数，OAuth授权后获得。
     since_id	false	int64	若指定此参数，则返回ID比since_id大的微博（即比since_id时间晚的微博），默认为0。
     max_id	false	int64	若指定此参数，则返回ID小于或等于max_id的微博，默认为0。
     count	false	int	单页返回的记录条数，最大不超过100，默认为20。
     page	false	int	返回结果的页码，默认为1。
     base_app	false	int	是否只获取当前应用的数据。0为否（所有数据），1为是（仅当前应用），默认为0。
     feature	false	int	过滤类型ID，0：全部、1：原创、2：图片、3：视频、4：音乐，默认为0。
     trim_user	false	int	返回值中user字段开关，0：返回完整user字段、1：user字段仅返回user_id，默认为0。

     */
    NSLog(@"%@",token);
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    [manager GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:@{@"access_token":token} progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        SinaBaseClass * sinaBase = [SinaBaseClass modelObjectWithDictionary:responseObject ];
        if ([_delegate respondsToSelector:@selector(sinaTool:didGetDataWithSinaBase:)]) {
            [_delegate sinaTool:self didGetDataWithSinaBase:sinaBase];
           
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if ([_delegate respondsToSelector:@selector(sinaTool:didFailedWithError:)]) {
            [_delegate sinaTool:self didFailedWithError:error];
        }
    }];
    
}

-(void)getAccessTokenWithCode:(NSString *)code
{
    /*
     oauth2/access_token
     OAuth2的access_token接口
     URL
     https://api.weibo.com/oauth2/access_token
     HTTP请求方式
     POST
     请求参数
     必选	类型及范围	说明
     client_id	true	string	申请应用时分配的AppKey。
     client_secret	true	string	申请应用时分配的AppSecret。
     grant_type	true	string	请求的类型，填写authorization_code
     
     grant_type为authorization_code时
     必选	类型及范围	说明
     code	true	string	调用authorize获得的code值。
     redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。

     */
    NSDictionary * parametersDic = @{@"client_id":APP_KEY,@"client_secret":APP_SECRET,@"grant_type":@"authorization_code",@"code":code,@"redirect_uri":REDIRECT_URL};
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes= [NSSet setWithObjects:@"text/plain", nil];
    [manager POST:@"https://api.weibo.com/oauth2/access_token" parameters:parametersDic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *tokenString =responseObject[@"access_token"];
        NSString *timeStirng = responseObject[@"expires_in"];
        if ([_delegate respondsToSelector:@selector(sinaTool:didGetToken:)]) {
            [_delegate sinaTool:self didGetToken:tokenString];
        }
        //将授权过期的token 和过期时间保存到本地
        NSDate * tokenDate = [NSDate dateWithTimeIntervalSinceNow:timeStirng.doubleValue];
        [[NSUserDefaults standardUserDefaults] setObject:tokenDate forKey:@"tokenDate"];
        [[NSUserDefaults standardUserDefaults] setObject:tokenString forKey:@"tokenString"];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if ([_delegate respondsToSelector:@selector(sinaTool:didFailedWithError:)]) {
            [_delegate sinaTool:self didFailedWithError:error];
        }
    }];
}
-(BOOL)islogin
{
    NSString * token =[[NSUserDefaults standardUserDefaults]objectForKey:@"tokenString"];
    if (!token) {
        return NO;
    }
    return YES;
}
-(BOOL)isValid
{
    NSDate *tokenDate = [[NSUserDefaults standardUserDefaults]objectForKey:@"tokenDate"];
    NSTimeInterval interval = [tokenDate timeIntervalSinceNow];
    if (interval<=0) {
        return NO;
    }
    return YES;
}

@end
