//
//  MyPhtotoBower.h
//  SinaApp.MVC
//
//  Created by mac on 16/5/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"
@interface MyPhtotoBower : UIView<UIScrollViewDelegate>
{
    BOOL boolArray[9];
    CGPoint pointScr;
}
@property (nonatomic,strong) UIScrollView * scroll;
@property (nonatomic,strong) SinaStatuses *stats;
@property (nonatomic) int currentImageIndex;
@property (nonatomic,copy) void (^block)();
@property (nonatomic,strong) NSMutableArray *urlString;
-(void)show;
-(void)remove;
@end
