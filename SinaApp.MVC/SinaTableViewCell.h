//
//  SinaTableViewCell.h
//  SinaApp.MVC
//
//  Created by mac on 16/5/18.
//  Copyright © 2016年 mac. All rights reserved.
//
#import "DataModels.h"
#import <UIKit/UIKit.h>
#import "TTTAttributedLabel.h"
@class cellImageView,RetweetedView;
@interface SinaTableViewCell : UITableViewCell
@property (nonatomic,strong) cellImageView * pictureView;
@property (nonatomic,strong) RetweetedView * retweetedView;
@property (nonatomic,strong) SinaStatuses * status;
@property (weak, nonatomic) IBOutlet TTTAttributedLabel *content;
@property (weak, nonatomic) IBOutlet UIButton *screenName;
@property (weak, nonatomic) IBOutlet UIButton *source;

@property (weak, nonatomic) IBOutlet UIButton *profile;
@property (nonatomic,strong) NSMutableArray * imagMuArray;
@end
