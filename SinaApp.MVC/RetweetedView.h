//
//  RetweetedView.h
//  SinaApp.MVC
//
//  Created by mac on 16/5/20.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"
@class cellImageView,TTTAttributedLabel;
@interface RetweetedView : UIView
@property (nonatomic,strong) TTTAttributedLabel * textLab;
@property (nonatomic,strong) cellImageView * pictuerView;
@property (nonatomic,strong) SinaStatuses * stats;
@property (nonatomic,strong) SinaRetweetedStatus * retweet;
@end
