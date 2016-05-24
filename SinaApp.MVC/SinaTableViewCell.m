//
//  SinaTableViewCell.m
//  SinaApp.MVC
//
//  Created by mac on 16/5/18.
//  Copyright © 2016年 mac. All rights reserved.
//
#import "cellImageView.h"
#import "UIButton+WebCache.h"
#import "SinaTableViewCell.h"
#import "NSString+Extension.h"
#import "TTTAttributedLabel.h"
#import "RetweetedView.h"
@implementation SinaTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.profile.layer.cornerRadius = self.profile.frame.size.width/2;
    self.profile.clipsToBounds =YES;
    self.content.numberOfLines = 0;
    
    self.pictureView=[[cellImageView alloc]init];
    self.pictureView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.pictureView];
    self.pictureView.clipsToBounds = YES;
    self.selectedBackgroundView = [[UIView alloc]init];
    self.selectedBackgroundView.backgroundColor = [UIColor grayColor];
    
    self.retweetedView = [[RetweetedView alloc]init];
    self.retweetedView.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:self.retweetedView];
    
    
}
-(void)setStatus:(SinaStatuses *)status
{
    _status = status;
    _content.text = status.text;
    [_content.text sinaString:_content];
    
    
    //jiang fuwu fanghui de zifuchuan n
    NSDateFormatter * formater = [[NSDateFormatter alloc]init];
    [formater setDateFormat:@"eee MMM d HH:mm:ss Z yyyy"];
//    [formater setDateFormat:@"EEE MMM dd HH:mm:ss Z yyyy"];
    formater.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSDate * timeDate =[formater dateFromString:status.createdAt];
    //只有转换成Date对象,才可以和挡墙的时间进行对比
    //获取当前时间,
    NSDate * currentdate = [NSDate date];
    //已经发布多久了
    NSTimeInterval timeInterval = [currentdate timeIntervalSinceDate:timeDate];
    //将得到的秒数转换成
    //一小时之内
    NSString * timeStr ;
    if (timeInterval<60*60) {
       
        NSLog(@"==%@",@((int)timeInterval/60));
        timeStr = [NSString stringWithFormat:@"%@分钟之前",@((int)timeInterval/60)];
        if ([timeStr isEqualToString:@"0分钟之前"])
        {
            timeStr =@"刚刚";
        }
        
    }else{
        //超过一个小时使用, HH:mm:ss 格式
       [formater setDateFormat:@"HH:mm:ss"];
        timeStr  = [formater stringFromDate:timeDate];
    }
    
    
    
    [self.profile sd_setBackgroundImageWithURL:[NSURL URLWithString:status.user.profileImageUrl] forState:UIControlStateNormal];
    [self.screenName setTitle:status.user.screenName forState:UIControlStateNormal];
    self.screenName.contentHorizontalAlignment =UIControlContentHorizontalAlignmentLeft;
    self.screenName.titleEdgeInsets = UIEdgeInsetsMake(0,10, 0, 0);
    if (status.source&&![status.source isEqualToString:@""]) {
        NSString * source =[[status.source componentsSeparatedByString:@">"][1] componentsSeparatedByString:@"<"][0];
        NSString * str = [timeStr stringByAppendingString:source];
        [self.source setTitle:str forState:UIControlStateNormal];
        self.source.titleEdgeInsets = UIEdgeInsetsMake(0,10, 0, 0);
        self.source.contentHorizontalAlignment =UIControlContentHorizontalAlignmentLeft;
    }
    
//   CGRect rect = self.content.frame;
//    rect.size.height = status.cellTextHeight;
    CGFloat height = status.cellTextHeight+80;
//    self.pictureView.status = status;
    self.pictureView.urlArray = status.picUrls;
    if (status.cellViewHeight!=0)
    {
        
        self.pictureView.frame = CGRectMake(0,height,self.contentView.bounds.size.width, status.cellViewHeight);
       
        for (UIImageView* imageView in self.pictureView.subviews) {
            imageView.frame =CGRectZero;
        }
    }
    else
    {
        self.pictureView.frame = CGRectZero;
    }
     height += status.cellViewHeight;
    
    
    
    [self retweetedStatuWithStats:status withHeiht:height];

 
}
//下面是文字处理没距离的
//    NSArray * array = [status.text matchStringWithPattern:@"#[^#]+#"];
//    NSLog(@"==%@",array);
//特殊的点击功能@"(@\\w+)|(#\\w+#)|(http(s)?://([A-Za-z0-9._-]+(/)?)*)"

-(void)retweetedStatuWithStats:(SinaStatuses*)stats withHeiht:(CGFloat)height
{
    NSLog(@"stats.retweetedStatus--%@--%@===%ld",nil,stats.retweetedStatus.text,stats.retweetedStatus.picUrls.count);
    self.retweetedView.stats = stats;
    
    self.retweetedView.frame = CGRectZero;
    NSString* str =stats.retweetedStatus.text;
    if (str)
    {
        NSLog(@"===存在");
        //存在换发
        NSString * retweetName =stats.retweetedStatus.user.name;
        NSString * newRetweetName;
        NSString * textStr;
        NSLog(@"retweetName---%@",retweetName);
        if (retweetName) {
            newRetweetName = [NSString stringWithFormat:@"@%@:",retweetName];
            textStr = [newRetweetName stringByAppendingString:stats.retweetedStatus.text];
        }else{
            textStr = stats.retweetedStatus.text;
        }
        self.retweetedView.textLab.text = textStr;
      [self.retweetedView.textLab.text sinaString:self.retweetedView.textLab];
        
        self.retweetedView.frame = CGRectMake(0, height, self.contentView.bounds.size.width,stats.cellRetweetTextHeith+stats.cellRetweetedPicuterHeight+20);
        
        
        
        height += stats.cellRetweetTextHeith+stats.cellRetweetedPicuterHeight
        +20;
    }
    NSArray * picUrlArray = stats.retweetedStatus.picUrls;
    NSLog(@"---%@",picUrlArray);
    if (picUrlArray.count!=0) {
         NSLog(@"---%@",picUrlArray[0]);
    }
    //数组里面是键值对
    self.retweetedView.pictuerView.urlArray = picUrlArray;
   
}


-(void)setFrame:(CGRect)frame
{
    frame.origin.y += 10;
    frame.size.height-=10;
    [super setFrame:frame];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
