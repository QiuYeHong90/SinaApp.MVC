//
//  NSString+Extension.h
//  demo
//
//  Created by mac on 16/5/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSString_Extension1.h"
#import "TTTAttributedLabel.h"
@interface NSString (Extension)
-(CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
-(NSArray<NSTextCheckingResult*>*)matchStringWithPattern:(NSString *)pattern;
//-(NSMutableAttributedString*)sinaString;
-(void)sinaString:(TTTAttributedLabel*)attributedLabel;
-(void)stringWihtAttributedLabel:(TTTAttributedLabel*)attributedLabel;
@end
