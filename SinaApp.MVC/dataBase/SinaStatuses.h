//
//  SinaStatuses.h
//
//  Created by mac  on 16/5/18
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class SinaRetweetedStatus, SinaUser, SinaVisible;

@interface SinaStatuses : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL favorited;
@property (nonatomic, assign) BOOL truncated;
@property (nonatomic, assign) double statusesIdentifier;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *inReplyToScreenName;
@property (nonatomic, assign) BOOL isLongText;
@property (nonatomic, strong) NSArray *picUrls;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) NSString *idstr;
@property (nonatomic, assign) double textLength;
@property (nonatomic, assign) double sourceType;
@property (nonatomic, strong) NSArray *hotWeiboTags;
@property (nonatomic, strong) SinaRetweetedStatus *retweetedStatus;
@property (nonatomic, assign) id geo;
@property (nonatomic, assign) double pageType;
@property (nonatomic, strong) SinaUser *user;
@property (nonatomic, strong) NSArray *textTagTips;
@property (nonatomic, assign) double commentsCount;
@property (nonatomic, strong) NSString *thumbnailPic;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, assign) double sourceAllowclick;
@property (nonatomic, assign) double bizFeature;
@property (nonatomic, strong) NSArray *annotations;
@property (nonatomic, strong) NSString *bmiddlePic;
@property (nonatomic, strong) SinaVisible *visible;
@property (nonatomic, strong) NSArray *bizIds;
@property (nonatomic, strong) NSString *inReplyToStatusId;
@property (nonatomic, strong) NSString *mid;
@property (nonatomic, strong) NSString *cardid;
@property (nonatomic, assign) double repostsCount;
@property (nonatomic, assign) double userType;
@property (nonatomic, assign) double attitudesCount;
@property (nonatomic, strong) NSArray *darwinTags;
@property (nonatomic, assign) double mlevel;
@property (nonatomic, strong) NSString *rid;
@property (nonatomic, strong) NSString *inReplyToUserId;
@property (nonatomic, strong) NSString *originalPic;

// 高度 文本的高度
@property (nonatomic) CGFloat cellTextHeight;
// 图片所占山视图的高度
@property (nonatomic) CGFloat cellViewHeight;
//转发文本高度
@property (nonatomic) CGFloat cellRetweetTextHeith;
//转发图片高度
@property (nonatomic) CGFloat cellRetweetedPicuterHeight;
+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
