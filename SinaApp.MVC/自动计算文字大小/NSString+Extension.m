//
//  NSString+Extension.m
//  demo
//
//  Created by mac on 16/5/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
//返回字符串所占用的尺寸.
-(CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
   
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

-(NSArray*)matchStringWithPattern:(NSString *)pattern
{
    //正则表达式的对象
    NSError * error = nil;
    //根据正则表达式的样式创建
    NSRegularExpression * regularExpression = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    if (regularExpression) {
        //根据正则检索字符串
        NSArray<NSTextCheckingResult*>* array=
        [regularExpression matchesInString:self options:NSMatchingReportProgress range:NSMakeRange(0, self.length)];
        
        return array;
    }
    return nil;
}


-(NSMutableAttributedString*)sinaString
{
    NSMutableAttributedString * attributString= [[NSMutableAttributedString alloc]initWithString:self attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}];
    NSString * pattern = @"(@\\w+)|(#\\w+#)|(http(s)?://([A-Za-z0-9._-]+(/)?)*)";
    [[self matchStringWithPattern:pattern] enumerateObjectsUsingBlock:^(NSTextCheckingResult * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSRange resRange = obj.range;
        [attributString addAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} range:resRange];
        
    }];
    return attributString;
    
}



@end
