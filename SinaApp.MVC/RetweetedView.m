//
//  RetweetedView.m
//  SinaApp.MVC
//
//  Created by mac on 16/5/20.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "RetweetedView.h"
#import "cellImageView.h"
#import "TTTAttributedLabel.h"
@implementation RetweetedView



- (instancetype)init
{
    self = [super init];
    if (self) {
        self.textLab = [[TTTAttributedLabel alloc]initWithFrame:CGRectZero];
        self.textLab.backgroundColor = [UIColor yellowColor];
        self.textLab.numberOfLines = 0;
        [self addSubview:self.textLab];
        
        //图片
        self.pictuerView = [[cellImageView alloc]init];
        self.pictuerView.backgroundColor = [UIColor yellowColor];
        self.pictuerView.clipsToBounds = YES;
        [self addSubview:self.pictuerView];
        
    }
    return self;
}



-(void)layoutSubviews
{
    self.textLab.frame = CGRectMake(5, 5,CGRectGetWidth(self.frame)-10,self.stats.cellRetweetTextHeith+10);
    [self.pictuerView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.frame = CGRectZero;
    }];
    self.pictuerView.frame = CGRectMake(0, CGRectGetMaxY(self.textLab.frame)+10, CGRectGetWidth(self.frame), self.stats.cellRetweetedPicuterHeight);
}

@end
