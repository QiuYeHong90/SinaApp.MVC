//
//  cellImageView.m
//  SinaApp.MVC
//
//  Created by mac on 16/5/19.
//  Copyright © 2016年 mac. All rights reserved.
//
#import "MyPhtotoBower.h"
#import "cellImageView.h"
#import "UIImageView+WebCache.h"

@implementation cellImageView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//   
//}
-(void)layoutSubviews
{
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        float width =([UIScreen mainScreen].bounds.size.width-40)/3.0;
        obj.frame = CGRectMake((width+10.0)*(idx%3)+10, (width+10.0)*(idx/3)+10, width,width);
        UIImageView * imageView = (UIImageView*)obj;
        imageView.tag =100;
        if (self.urlArray.count!=0&&self.urlArray){
            
            

            NSString * picUrlStr;
            if ([self.urlArray[idx] isKindOfClass:[SinaPicUrls class]]) {
                SinaPicUrls * picUrls = (SinaPicUrls*)self.urlArray[idx];
                picUrlStr = picUrls.thumbnailPic;
            }else
            {
                picUrlStr = [self.urlArray[idx] objectForKey:@"thumbnail_pic"];
            }
            [imageView sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:picUrlStr] placeholderImage:nil options:SDWebImageProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                
            } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                
            }];
            imageView.tag = idx;
            
        }
        if (idx == self.urlArray.count-1 ) {
            *stop =YES;
        }
    }];

           [super layoutSubviews];
}
-(void)setFrame:(CGRect)frame
{
    
    
    [super setFrame:frame];
    
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        for (int i = 0; i<9; i++)
        {
            UIImageView* imageView = [[UIImageView alloc]init];
            [self addSubview:imageView];
            imageView.backgroundColor = [UIColor whiteColor];
            imageView.userInteractionEnabled = YES;
            [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewTouch:)]];
            
        }
        
    }
    return self;
}
-(void)imageViewTouch:(UITapGestureRecognizer*)tap
{
    UIImageView * topView= (UIImageView*)tap.view;
    UIImage * image =topView.image;
    CGSize selectImgSize;
    if (image) {
        selectImgSize =image.size;
    }else{
        selectImgSize = CGSizeZero;
    }
   
    int index = (int)tap.view.tag;
    
    __weak typeof(self) weakSelf = self;
    _myPhoto = [[MyPhtotoBower alloc]initWithFrame:[UIScreen mainScreen].bounds ];
    __weak MyPhtotoBower * weakMyphtoto = _myPhoto;
    _myPhoto.block  = ^() {
    UIScrollView * scroll = weakMyphtoto.scroll;
        scroll.hidden = YES;
        scroll.contentOffset = CGPointMake(CGRectGetWidth(scroll.frame)*index,0);
        //滑动视图需要判是否可以竖向滑动
    scroll.contentSize = CGSizeMake(CGRectGetWidth(scroll.frame)*weakSelf.urlArray.count, CGRectGetHeight(scroll.frame));
        
        
        
    [weakSelf.urlArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        //图片 的大小 imageView 的大小
        UIImageView * imageView = [[UIImageView alloc]init];
        imageView.center = CGPointMake(scroll.center.x+CGRectGetWidth(scroll.frame)*idx, scroll.center.y);
        imageView.bounds =CGRectMake(0,0, CGRectGetWidth(scroll.frame),CGRectGetWidth(scroll.frame)*selectImgSize.height/selectImgSize.width);
        
        
        NSString * picUrlStr;
        if ([weakSelf.urlArray[idx] isKindOfClass:[SinaPicUrls class]]) {
            SinaPicUrls * picUrls = (SinaPicUrls*)weakSelf.urlArray[idx];
            picUrlStr = picUrls.thumbnailPic;
        }else
        {
            picUrlStr = [self.urlArray[idx] objectForKey:@"thumbnail_pic"];
        }

        NSString * urlBitImgStr = [picUrlStr stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
        
        //bmiddle
        //从缓存里面寻找图片
        SDWebImageManager * manager = [SDWebImageManager sharedManager];
        NSString * key = [manager cacheKeyForURL:[NSURL URLWithString:picUrlStr]];
        
        UIImage *imgCache = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:key];
        
        [imageView sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:urlBitImgStr] placeholderImage:imgCache options:SDWebImageRetryFailed  progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//            NSLog(@"===%@",error);
        }];
        [scroll addSubview:imageView];
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:weakSelf action:@selector(toViewTouch:)]];
    }];
    };
    [_myPhoto show];
     [self imageViewAnimationWithImagView:(UIImageView*)tap.view];
}


-(void)imageViewAnimationWithImagView:(UIImageView*)topView
{
   
     CGSize selectImgSize = topView.image.size;
    float x = [UIScreen mainScreen].bounds.size.width/2 - selectImgSize.width/2;
    float y =  [UIScreen mainScreen].bounds.size.height/2 - selectImgSize.height/2;
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(x,y, selectImgSize.width, selectImgSize.height)];
    imageView.image = topView.image;
    imageView.backgroundColor = [UIColor redColor];
    [_myPhoto addSubview:imageView];
    [UIView animateWithDuration:2 animations:^{
        if (CGRectGetWidth(_myPhoto.scroll.frame)*(imageView.image.size.height/imageView.image.size.height)>CGRectGetHeight(_myPhoto.scroll.frame)) {
             imageView.frame = CGRectMake(0, 0,CGRectGetWidth( _myPhoto.frame), (selectImgSize.height/selectImgSize.width)*CGRectGetWidth(_myPhoto.frame));
        }else{
            imageView.center = _myPhoto.center;
            imageView.bounds = CGRectMake(0, 0,CGRectGetWidth( _myPhoto.frame), (selectImgSize.height/selectImgSize.width)*CGRectGetWidth(_myPhoto.frame));
        }
       
        
    } completion:^(BOOL finished) {
        
        
        CGSize size = _myPhoto.scroll.contentSize;
        if (CGRectGetHeight(imageView.frame)>CGRectGetHeight(_myPhoto.scroll.frame)) {
            
            size.height = CGRectGetHeight(imageView.frame);
            _myPhoto.scroll.contentOffset = CGPointMake(0,-CGRectGetHeight(imageView.frame)/2+CGRectGetHeight(_myPhoto.scroll.frame)/2);
            _myPhoto.scroll.contentSize = size;
            _myPhoto.scroll.pagingEnabled = NO;
        }
        else
        {
            size.height = CGRectGetHeight(_myPhoto.scroll.frame);
            _myPhoto.scroll.contentSize = size;
        }
        
        [imageView removeFromSuperview];
        _myPhoto.scroll.hidden = NO;
    }];
}


// 点击图片消失
-(void)toViewTouch:(UITapGestureRecognizer*)tap

{
    [_myPhoto removeFromSuperview];
}
@end
