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
#import "MBProgressHUD.h"
//#import "UIImageView_urlString.h"
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
            [imageView sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:picUrlStr] placeholderImage:[UIImage imageNamed:@"compose_toolbar_picture_highlighted"] options:SDWebImageProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                
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
        
        NSMutableArray *mutArray = [[NSMutableArray alloc]init];
        
    [weakSelf.urlArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //创建smallScroll
        
        UIScrollView *smallScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(CGRectGetWidth(scroll.frame)*idx,0,CGRectGetWidth(scroll.frame), CGRectGetHeight(scroll.frame))];
        smallScroll.backgroundColor = [UIColor yellowColor];
        [scroll addSubview:smallScroll];
        //图片 的大小 imageView 的大小
        UIImageView * imageView = [[UIImageView alloc]init];

        
        imageView.backgroundColor = [UIColor redColor];
        NSString * picUrlStr;
        if ([weakSelf.urlArray[idx] isKindOfClass:[SinaPicUrls class]]) {
            SinaPicUrls * picUrls = (SinaPicUrls*)weakSelf.urlArray[idx];
            picUrlStr = picUrls.thumbnailPic;
        }else
        {
            picUrlStr = [self.urlArray[idx] objectForKey:@"thumbnail_pic"];
        }
        
        NSString * urlBitImgStr = [picUrlStr stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"large"];
        [mutArray addObject:urlBitImgStr];
        [weakMyphtoto.urlString setArray:mutArray];
        /*
         <#注释内容#>
         */
        /*
         MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
         hud.mode = MBProgressHUDModeAnnularDeterminate;
         hud.labelText = @"Loading";
         [self doSomethingInBackgroundWithProgressCallback:^(float progress) {
         hud.progress = progress;
         } completionCallback:^{
         [hud hide:YES];
         }];
         */
        //bmiddle
        //TODO:进程条的添加
        //TODO:只有被点击的才被加载其他的都是默认的图片
        
        if (idx == index) {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:scroll animated:YES];
            hud.mode = MBProgressHUDModeDeterminate;
            //        hud.labelText = @"loading";
            [imageView sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:urlBitImgStr] placeholderImage:[(UIImageView*)weakSelf.subviews[idx] image] options:SDWebImageRetryFailed  progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                //在这里写进程
                hud.progress =receivedSize/(float)expectedSize;
                
            } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                //            NSLog(@"===%@",error);
                hud.labelText = @"完成";
                [hud hide:YES];
                
            }];

        }else{
           
            imageView.image = [(UIImageView*)weakSelf.subviews[idx] image];
        }
        
               [smallScroll addSubview:imageView];
        //
        //设置代理
        smallScroll.delegate = weakSelf;
         imageView.frame = CGRectMake(0, 0, imageView.image.size.width, imageView.image.size.height);
        smallScroll.contentSize = imageView.image.size;
        smallScroll.maximumZoomScale =CGFLOAT_MAX;
        smallScroll.minimumZoomScale = 0.2;
        smallScroll.zoomScale =CGRectGetWidth(scroll.frame)/imageView.image.size.width;
       
        imageView.tag = idx+100;
        smallScroll.userInteractionEnabled = YES;
        [smallScroll addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:weakSelf action:@selector(toViewTouch:)]];
    }];
    };
    [_myPhoto show];
     [self imageViewAnimationWithImagView:(UIImageView*)tap.view];
}


-(void)imageViewAnimationWithImagView:(UIImageView*)topView
{
   /*
    CGRect rectInTableView = [tableView rectForRowAtIndexPath:indexPath];
    
    //经典的语句
    CGRect rect = [tableView convertRect:rectInTableView toView:[tableView superview]];
*/
    
     CGSize selectImgSize = topView.image.size;
   CGPoint point =  [self convertPoint:topView.frame.origin toView:_myPhoto];
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(point.x,point.y, selectImgSize.width, selectImgSize.height)];
    imageView.image = topView.image;
    imageView.backgroundColor = [UIColor redColor];
    [_myPhoto addSubview:imageView];
    [UIView animateWithDuration:0.4 animations:^{
        if (CGRectGetWidth(_myPhoto.scroll.frame)*(imageView.image.size.height/imageView.image.size.height)>CGRectGetHeight(_myPhoto.scroll.frame)) {
             imageView.frame = CGRectMake(0, 0,CGRectGetWidth( _myPhoto.frame), (selectImgSize.height/selectImgSize.width)*CGRectGetWidth(_myPhoto.frame));
        }else{
            imageView.center = _myPhoto.center;
            imageView.bounds = CGRectMake(0, 0,CGRectGetWidth( _myPhoto.frame), (selectImgSize.height/selectImgSize.width)*CGRectGetWidth(_myPhoto.frame));
        }
       
        
    } completion:^(BOOL finished) {
        
        
        CGSize size = _myPhoto.scroll.contentSize;
        if (CGRectGetHeight(imageView.frame)>CGRectGetHeight(_myPhoto.scroll.frame)) {
            
//            size.height = CGRectGetHeight(imageView.frame);
//            _myPhoto.scroll.contentOffset = CGPointMake(0,-CGRectGetHeight(imageView.frame)/2+CGRectGetHeight(_myPhoto.scroll.frame)/2);
//            _myPhoto.scroll.contentSize = size;
//            _myPhoto.scroll.pagingEnabled = NO;
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
#pragma mark -- scroll的delegate
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view
{
    
    _center = view.center;
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale
{
    //    view.center = _center;
    [self positionWithScroll:scrollView];
}
-(void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    [self positionWithScroll:scrollView];
    
}



-(void)positionWithScroll:(UIScrollView*)scrollView
{
    UIImageView * imgView = (UIImageView*)scrollView.subviews[0];
    if (CGRectGetHeight(imgView.frame)>CGRectGetHeight(scrollView.frame)) {
        
        if (CGRectGetWidth(imgView.frame)<=CGRectGetWidth(scrollView.frame)) {
            //如果放大后的图片尺寸高度大于scroll的高度则让其偏移量为零,并且 是对称图形
            imgView.center =CGPointMake(CGRectGetWidth(scrollView.bounds)/2,CGRectGetHeight(scrollView.bounds)/2);
            CGRect rect = imgView.frame;
            rect.origin.y = 0;
            imgView.frame = rect;
            scrollView.contentOffset=CGPointMake(0, 0);
        }
            
    }else{
        //否则将是中心对称图形  如果是多个scrollView 的话就不是这样了
        
        imgView.center =CGPointMake(CGRectGetWidth(scrollView.bounds)/2,CGRectGetHeight(scrollView.bounds)/2);
        
    }
    
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
//返回需要zoom的view
{
    
    
    return scrollView.subviews[0];
    
}
-(void)dismissAnimationWithTapView:(UIView*)tapView
{
    UIImageView* tapImageView = (UIImageView*)tapView.subviews[0];
    int index = (int)(tapImageView.tag - 100);
     UIImageView *imageView = self.subviews[index];
    CGRect distanceRect = [self convertRect:imageView.frame toView:_myPhoto];
    
    UIImageView *moveImageView = [[UIImageView alloc]initWithFrame:tapImageView.frame];
    moveImageView.image = tapImageView.image;
    [_myPhoto addSubview:moveImageView];
     _myPhoto.scroll.hidden = YES;
    [UIView animateWithDuration:0.4 animations:^{
        moveImageView.frame = distanceRect;
    } completion:^(BOOL finished) {
         [_myPhoto removeFromSuperview];
    }];
}

// 点击图片消失
-(void)toViewTouch:(UITapGestureRecognizer*)tap

{
   
    [self dismissAnimationWithTapView:tap.view];
//
}
@end
