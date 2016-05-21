//
//  LogView.h
//  SinaApp.MVC
//
//  Created by mac on 16/5/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LogView;
@protocol LogViewDelegate <NSObject>//遵循NSObject协议 可以调用respondsToSelector:

@required//必须的
//获取codeString
-(void)loginView:(LogView*)log didGetCodeString:(NSString*)codeString;
@optional//可选的

//获得请求ERROR
-(void)loginView:(LogView*)log didFailWithError:(NSError*)error;
@end
@interface LogView : UIView<UIWebViewDelegate>
-(void)startOauthRequest:(NSURLRequest*)request;
@property (nonatomic,strong)UIWebView *webView;
@property (nonatomic,assign) id delegate;
@end
