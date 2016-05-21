//
//  LogView.m
//  SinaApp.MVC
//
//  Created by mac on 16/5/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "LogView.h"

@implementation LogView
//1,将授权web 页面显示
//2,


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
-(void)startOauthRequest:(NSURLRequest*)request
{
    //webView的初始化
    if (!_webView) {
        _webView= [[UIWebView alloc]initWithFrame:self.frame];
        
    }
    [_webView setDelegate:self];
    [_webView loadRequest:request];
    [self addSubview:_webView];
}
#pragma mark -- webViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //截取url中的code
    NSString * urlString = request.URL.absoluteString;
    NSRange codeRange = [urlString rangeOfString:@"code="];
    /*
     如果codeRange.location != NSNotFound 表示里面存在code
     也可以用 codeRange.length>0
     */
    if (codeRange.location != NSNotFound)
    {
        //如果有code进行截取
        NSArray * subStringsArry = [urlString componentsSeparatedByString:@"code="];
        //获得code
        NSString * codeString = [subStringsArry lastObject];
        
        
        
        //备注:因为loginView是view及时拿到code也不能在这里写逻辑代码,必须将codeString 传递出去
        /*
         开发过程中常用的传递数据的方式有
         1,Delegate(常用)
         2,Block(常用)
         3,Notfication
         4,KVO
         */
        
//        if ([_delegate respondsToSelector:@selector(loginView:didGetCodeString:)]) {
//            return NO;
//        }
        [_delegate loginView:self didGetCodeString:codeString];
        //将webView 移除
        [webView removeFromSuperview];
        return NO;
    }
    return 1;
}
//错误信息
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
    if ([_delegate respondsToSelector:@selector(loginView:didFailWithError:)]) {
        return;
    }
    [_delegate loginView:self didFailWithError:error];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
