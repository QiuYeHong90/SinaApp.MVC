//
//  SinaTool.h
//  SinaApp.MVC
//
//  Created by mac on 16/5/18.
//  Copyright © 2016年 mac. All rights reserved.
//






#import <Foundation/Foundation.h>
@class SinaTool,SinaBaseClass;
@protocol SinaToolDelegate <NSObject>


-(void)sinaTool:(SinaTool*)sinaTool didGetToken:(NSString*)token;
-(void)sinaTool:(SinaTool*)sinaTool didFailedWithError:(NSError*)error;
-(void)sinaTool:(SinaTool *)sinaTool didGetDataWithSinaBase:(SinaBaseClass *)sinaBase;
@end
/*
     sinaTool所有的sina相关的业务封装
 1,获取授权
 2,判断Token是否过期
 3,是否登录
 4,跟新浪相关的额API请求:发微博,查homeline
     */

@interface SinaTool : NSObject
@property (nonatomic,assign) id delegate;
+ (instancetype)sharedInstance;
-(BOOL)islogin;
-(BOOL)isValid;
-(NSURLRequest*)oauthRequest;
//获取授权
-(void)getAccessTokenWithCode:(NSString*)code;
//获取首页
-(void)getDataHomeTimelineWithToken:(NSString*)token;
-(void)refeashDataWith:(UIViewController*)viewController;
-(void)LoadData;
//获取微博
//发布微博
@end
