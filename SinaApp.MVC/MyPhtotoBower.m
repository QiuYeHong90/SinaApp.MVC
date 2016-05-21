//
//  MyPhtotoBower.m
//  SinaApp.MVC
//
//  Created by mac on 16/5/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "MyPhtotoBower.h"

@implementation MyPhtotoBower
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
       _scroll = [[UIScrollView alloc]initWithFrame:frame];
        _scroll.pagingEnabled = YES;
        _scroll.bounces = NO;
        [self addSubview:_scroll];
       
      UITapGestureRecognizer*  singletap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [singletap setNumberOfTapsRequired:1];
        [_scroll addGestureRecognizer:singletap];
        _scroll.delegate = self;
    }
    return self;
}



-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
  int indx  =  (int)(scrollView.contentOffset.x/scrollView.bounds.size.width);
   UIImageView* imageView  = (UIImageView*) scrollView.subviews[indx];
    CGSize size = scrollView.contentSize;
    if (CGRectGetHeight(imageView.frame)>CGRectGetHeight(scrollView.frame)) {
        
        size.height = CGRectGetHeight(imageView.frame);
        scrollView.contentSize = size;
    }
    else
    {
        size.height = CGRectGetHeight(scrollView.frame);
        scrollView.contentSize = size;
    }
}


-(void)handleSingleTap:(UIGestureRecognizer*)top
{
    [self removeFromSuperview];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self removeFromSuperview];
}

-(void)show
{
    self.block();
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.frame = window.bounds;
    self.backgroundColor = [UIColor blackColor];
    [window addObserver:self forKeyPath:@"frame" options:0 context:nil];
    [window addSubview:self];
}
-(void)remove
{
    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
