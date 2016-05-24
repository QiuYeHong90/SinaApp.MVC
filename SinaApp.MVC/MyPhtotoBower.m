//
//  MyPhtotoBower.m
//  SinaApp.MVC
//
//  Created by mac on 16/5/19.
//  Copyright © 2016年 mac. All rights reserved.
//
#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"
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
        self.urlString = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
     pointScr = scrollView.contentOffset;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"----%ld",scrollView.subviews.count);
//    //加载图片
//    
//    int index = (int)(scrollView.contentOffset.x/CGRectGetWidth(scrollView.frame));
//    UIImageView* imageView  = (UIImageView*)[(UIScrollView*) scrollView.subviews[index] subviews][0];
//    if (scrollView.contentOffset.x >pointScr.x&&scrollView.contentOffset.x<scrollView.subviews.count*CGRectGetWidth(scrollView.frame)) {
//        
//        if (boolArray[index+1] == 0) {
//            boolArray[index+1] = 1 ;
//            if (self.urlString.count!=0) {
//                [imageView sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:self.urlString[index+1]] placeholderImage:imageView.image options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//                    
//                } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//                    
//                }];
//
//            }
//                   }
//    }else if (scrollView.contentOffset.x <pointScr.x&&scrollView.contentOffset.x>0){
//        if (boolArray[index-1]==0) {
//            boolArray[index -1] = 1;
//            
//        }
//    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
  int indx  =  (int)(scrollView.contentOffset.x/scrollView.bounds.size.width);
   
 
    
    //加载图片
    
    
    
//    
//    if (CGRectGetHeight(imageView.frame)>CGRectGetHeight(scrollView.frame)) {
//        
//        size.height = CGRectGetHeight(imageView.frame);
//        scrollView.contentSize = size;
//    }
//    else
//    {
//        size.height = CGRectGetHeight(scrollView.frame);
//        scrollView.contentSize = size;
//    }
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
//    self.backgroundColor = [UIColor blackColor];
    [window addObserver:self forKeyPath:@"frame" options:0 context:nil];
    [window addSubview:self];
}
-(void)remove
{
    
//    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
