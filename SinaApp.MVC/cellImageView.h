//
//  cellImageView.h
//  SinaApp.MVC
//
//  Created by mac on 16/5/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"
@class MyPhtotoBower;
@interface cellImageView : UIView<UIScrollViewDelegate>
{
    CGPoint _center;
}
@property (nonatomic ,strong) SinaStatuses *status;
//
@property (nonatomic,strong) NSArray * urlArray;
@property (nonatomic,strong)MyPhtotoBower * myPhoto;

@end
