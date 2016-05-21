//
//  SinaRetweetedStatus.m
//
//  Created by mac  on 16/5/18
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SinaRetweetedStatus.h"
#import "SinaPicUrls.h"
#import "SinaUser.h"
#import "SinaAnnotations.h"
#import "SinaVisible.h"


NSString *const kSinaRetweetedStatusFavorited = @"favorited";
NSString *const kSinaRetweetedStatusTruncated = @"truncated";
NSString *const kSinaRetweetedStatusId = @"id";
NSString *const kSinaRetweetedStatusCreatedAt = @"created_at";
NSString *const kSinaRetweetedStatusInReplyToScreenName = @"in_reply_to_screen_name";
NSString *const kSinaRetweetedStatusIsLongText = @"isLongText";
NSString *const kSinaRetweetedStatusPicUrls = @"pic_urls";
NSString *const kSinaRetweetedStatusText = @"text";
NSString *const kSinaRetweetedStatusIdstr = @"idstr";
NSString *const kSinaRetweetedStatusTextLength = @"textLength";
NSString *const kSinaRetweetedStatusSourceType = @"source_type";
NSString *const kSinaRetweetedStatusHotWeiboTags = @"hot_weibo_tags";
NSString *const kSinaRetweetedStatusGeo = @"geo";
NSString *const kSinaRetweetedStatusPageType = @"page_type";
NSString *const kSinaRetweetedStatusUser = @"user";
NSString *const kSinaRetweetedStatusTextTagTips = @"text_tag_tips";
NSString *const kSinaRetweetedStatusCommentsCount = @"comments_count";
NSString *const kSinaRetweetedStatusThumbnailPic = @"thumbnail_pic";
NSString *const kSinaRetweetedStatusSource = @"source";
NSString *const kSinaRetweetedStatusSourceAllowclick = @"source_allowclick";
NSString *const kSinaRetweetedStatusBizFeature = @"biz_feature";
NSString *const kSinaRetweetedStatusAnnotations = @"annotations";
NSString *const kSinaRetweetedStatusBmiddlePic = @"bmiddle_pic";
NSString *const kSinaRetweetedStatusVisible = @"visible";
NSString *const kSinaRetweetedStatusBizIds = @"biz_ids";
NSString *const kSinaRetweetedStatusInReplyToStatusId = @"in_reply_to_status_id";
NSString *const kSinaRetweetedStatusMid = @"mid";
NSString *const kSinaRetweetedStatusCardid = @"cardid";
NSString *const kSinaRetweetedStatusRepostsCount = @"reposts_count";
NSString *const kSinaRetweetedStatusUserType = @"userType";
NSString *const kSinaRetweetedStatusAttitudesCount = @"attitudes_count";
NSString *const kSinaRetweetedStatusDarwinTags = @"darwin_tags";
NSString *const kSinaRetweetedStatusMlevel = @"mlevel";
NSString *const kSinaRetweetedStatusInReplyToUserId = @"in_reply_to_user_id";
NSString *const kSinaRetweetedStatusOriginalPic = @"original_pic";


@interface SinaRetweetedStatus ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SinaRetweetedStatus

@synthesize favorited = _favorited;
@synthesize truncated = _truncated;
@synthesize retweetedStatusIdentifier = _retweetedStatusIdentifier;
@synthesize createdAt = _createdAt;
@synthesize inReplyToScreenName = _inReplyToScreenName;
@synthesize isLongText = _isLongText;
@synthesize picUrls = _picUrls;
@synthesize text = _text;
@synthesize idstr = _idstr;
@synthesize textLength = _textLength;
@synthesize sourceType = _sourceType;
@synthesize hotWeiboTags = _hotWeiboTags;
@synthesize geo = _geo;
@synthesize pageType = _pageType;
@synthesize user = _user;
@synthesize textTagTips = _textTagTips;
@synthesize commentsCount = _commentsCount;
@synthesize thumbnailPic = _thumbnailPic;
@synthesize source = _source;
@synthesize sourceAllowclick = _sourceAllowclick;
@synthesize bizFeature = _bizFeature;
@synthesize annotations = _annotations;
@synthesize bmiddlePic = _bmiddlePic;
@synthesize visible = _visible;
@synthesize bizIds = _bizIds;
@synthesize inReplyToStatusId = _inReplyToStatusId;
@synthesize mid = _mid;
@synthesize cardid = _cardid;
@synthesize repostsCount = _repostsCount;
@synthesize userType = _userType;
@synthesize attitudesCount = _attitudesCount;
@synthesize darwinTags = _darwinTags;
@synthesize mlevel = _mlevel;
@synthesize inReplyToUserId = _inReplyToUserId;
@synthesize originalPic = _originalPic;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.favorited = [[self objectOrNilForKey:kSinaRetweetedStatusFavorited fromDictionary:dict] boolValue];
            self.truncated = [[self objectOrNilForKey:kSinaRetweetedStatusTruncated fromDictionary:dict] boolValue];
            self.retweetedStatusIdentifier = [[self objectOrNilForKey:kSinaRetweetedStatusId fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kSinaRetweetedStatusCreatedAt fromDictionary:dict];
            self.inReplyToScreenName = [self objectOrNilForKey:kSinaRetweetedStatusInReplyToScreenName fromDictionary:dict];
            self.isLongText = [[self objectOrNilForKey:kSinaRetweetedStatusIsLongText fromDictionary:dict] boolValue];
    NSObject *receivedSinaPicUrls = [dict objectForKey:kSinaRetweetedStatusPicUrls];
    NSMutableArray *parsedSinaPicUrls = [NSMutableArray array];
    if ([receivedSinaPicUrls isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSinaPicUrls) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSinaPicUrls addObject:[SinaPicUrls modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSinaPicUrls isKindOfClass:[NSDictionary class]]) {
       [parsedSinaPicUrls addObject:[SinaPicUrls modelObjectWithDictionary:(NSDictionary *)receivedSinaPicUrls]];
    }

    self.picUrls = [NSArray arrayWithArray:parsedSinaPicUrls];
            self.text = [self objectOrNilForKey:kSinaRetweetedStatusText fromDictionary:dict];
            self.idstr = [self objectOrNilForKey:kSinaRetweetedStatusIdstr fromDictionary:dict];
            self.textLength = [[self objectOrNilForKey:kSinaRetweetedStatusTextLength fromDictionary:dict] doubleValue];
            self.sourceType = [[self objectOrNilForKey:kSinaRetweetedStatusSourceType fromDictionary:dict] doubleValue];
            self.hotWeiboTags = [self objectOrNilForKey:kSinaRetweetedStatusHotWeiboTags fromDictionary:dict];
            self.geo = [self objectOrNilForKey:kSinaRetweetedStatusGeo fromDictionary:dict];
            self.pageType = [[self objectOrNilForKey:kSinaRetweetedStatusPageType fromDictionary:dict] doubleValue];
            self.user = [SinaUser modelObjectWithDictionary:[dict objectForKey:kSinaRetweetedStatusUser]];
            self.textTagTips = [self objectOrNilForKey:kSinaRetweetedStatusTextTagTips fromDictionary:dict];
            self.commentsCount = [[self objectOrNilForKey:kSinaRetweetedStatusCommentsCount fromDictionary:dict] doubleValue];
            self.thumbnailPic = [self objectOrNilForKey:kSinaRetweetedStatusThumbnailPic fromDictionary:dict];
            self.source = [self objectOrNilForKey:kSinaRetweetedStatusSource fromDictionary:dict];
            self.sourceAllowclick = [[self objectOrNilForKey:kSinaRetweetedStatusSourceAllowclick fromDictionary:dict] doubleValue];
            self.bizFeature = [[self objectOrNilForKey:kSinaRetweetedStatusBizFeature fromDictionary:dict] doubleValue];
    NSObject *receivedSinaAnnotations = [dict objectForKey:kSinaRetweetedStatusAnnotations];
    NSMutableArray *parsedSinaAnnotations = [NSMutableArray array];
    if ([receivedSinaAnnotations isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSinaAnnotations) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSinaAnnotations addObject:[SinaAnnotations modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSinaAnnotations isKindOfClass:[NSDictionary class]]) {
       [parsedSinaAnnotations addObject:[SinaAnnotations modelObjectWithDictionary:(NSDictionary *)receivedSinaAnnotations]];
    }

    self.annotations = [NSArray arrayWithArray:parsedSinaAnnotations];
            self.bmiddlePic = [self objectOrNilForKey:kSinaRetweetedStatusBmiddlePic fromDictionary:dict];
            self.visible = [SinaVisible modelObjectWithDictionary:[dict objectForKey:kSinaRetweetedStatusVisible]];
            self.bizIds = [self objectOrNilForKey:kSinaRetweetedStatusBizIds fromDictionary:dict];
            self.inReplyToStatusId = [self objectOrNilForKey:kSinaRetweetedStatusInReplyToStatusId fromDictionary:dict];
            self.mid = [self objectOrNilForKey:kSinaRetweetedStatusMid fromDictionary:dict];
            self.cardid = [self objectOrNilForKey:kSinaRetweetedStatusCardid fromDictionary:dict];
            self.repostsCount = [[self objectOrNilForKey:kSinaRetweetedStatusRepostsCount fromDictionary:dict] doubleValue];
            self.userType = [[self objectOrNilForKey:kSinaRetweetedStatusUserType fromDictionary:dict] doubleValue];
            self.attitudesCount = [[self objectOrNilForKey:kSinaRetweetedStatusAttitudesCount fromDictionary:dict] doubleValue];
            self.darwinTags = [self objectOrNilForKey:kSinaRetweetedStatusDarwinTags fromDictionary:dict];
            self.mlevel = [[self objectOrNilForKey:kSinaRetweetedStatusMlevel fromDictionary:dict] doubleValue];
            self.inReplyToUserId = [self objectOrNilForKey:kSinaRetweetedStatusInReplyToUserId fromDictionary:dict];
            self.originalPic = [self objectOrNilForKey:kSinaRetweetedStatusOriginalPic fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.favorited] forKey:kSinaRetweetedStatusFavorited];
    [mutableDict setValue:[NSNumber numberWithBool:self.truncated] forKey:kSinaRetweetedStatusTruncated];
    [mutableDict setValue:[NSNumber numberWithDouble:self.retweetedStatusIdentifier] forKey:kSinaRetweetedStatusId];
    [mutableDict setValue:self.createdAt forKey:kSinaRetweetedStatusCreatedAt];
    [mutableDict setValue:self.inReplyToScreenName forKey:kSinaRetweetedStatusInReplyToScreenName];
    [mutableDict setValue:[NSNumber numberWithBool:self.isLongText] forKey:kSinaRetweetedStatusIsLongText];
    NSMutableArray *tempArrayForPicUrls = [NSMutableArray array];
    for (NSObject *subArrayObject in self.picUrls) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPicUrls addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPicUrls addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPicUrls] forKey:kSinaRetweetedStatusPicUrls];
    [mutableDict setValue:self.text forKey:kSinaRetweetedStatusText];
    [mutableDict setValue:self.idstr forKey:kSinaRetweetedStatusIdstr];
    [mutableDict setValue:[NSNumber numberWithDouble:self.textLength] forKey:kSinaRetweetedStatusTextLength];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sourceType] forKey:kSinaRetweetedStatusSourceType];
    NSMutableArray *tempArrayForHotWeiboTags = [NSMutableArray array];
    for (NSObject *subArrayObject in self.hotWeiboTags) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHotWeiboTags addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHotWeiboTags addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHotWeiboTags] forKey:kSinaRetweetedStatusHotWeiboTags];
    [mutableDict setValue:self.geo forKey:kSinaRetweetedStatusGeo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageType] forKey:kSinaRetweetedStatusPageType];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kSinaRetweetedStatusUser];
    NSMutableArray *tempArrayForTextTagTips = [NSMutableArray array];
    for (NSObject *subArrayObject in self.textTagTips) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTextTagTips addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTextTagTips addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTextTagTips] forKey:kSinaRetweetedStatusTextTagTips];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsCount] forKey:kSinaRetweetedStatusCommentsCount];
    [mutableDict setValue:self.thumbnailPic forKey:kSinaRetweetedStatusThumbnailPic];
    [mutableDict setValue:self.source forKey:kSinaRetweetedStatusSource];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sourceAllowclick] forKey:kSinaRetweetedStatusSourceAllowclick];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bizFeature] forKey:kSinaRetweetedStatusBizFeature];
    NSMutableArray *tempArrayForAnnotations = [NSMutableArray array];
    for (NSObject *subArrayObject in self.annotations) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAnnotations addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAnnotations addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAnnotations] forKey:kSinaRetweetedStatusAnnotations];
    [mutableDict setValue:self.bmiddlePic forKey:kSinaRetweetedStatusBmiddlePic];
    [mutableDict setValue:[self.visible dictionaryRepresentation] forKey:kSinaRetweetedStatusVisible];
    NSMutableArray *tempArrayForBizIds = [NSMutableArray array];
    for (NSObject *subArrayObject in self.bizIds) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForBizIds addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForBizIds addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBizIds] forKey:kSinaRetweetedStatusBizIds];
    [mutableDict setValue:self.inReplyToStatusId forKey:kSinaRetweetedStatusInReplyToStatusId];
    [mutableDict setValue:self.mid forKey:kSinaRetweetedStatusMid];
    [mutableDict setValue:self.cardid forKey:kSinaRetweetedStatusCardid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.repostsCount] forKey:kSinaRetweetedStatusRepostsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userType] forKey:kSinaRetweetedStatusUserType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.attitudesCount] forKey:kSinaRetweetedStatusAttitudesCount];
    NSMutableArray *tempArrayForDarwinTags = [NSMutableArray array];
    for (NSObject *subArrayObject in self.darwinTags) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDarwinTags addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDarwinTags addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDarwinTags] forKey:kSinaRetweetedStatusDarwinTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mlevel] forKey:kSinaRetweetedStatusMlevel];
    [mutableDict setValue:self.inReplyToUserId forKey:kSinaRetweetedStatusInReplyToUserId];
    [mutableDict setValue:self.originalPic forKey:kSinaRetweetedStatusOriginalPic];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.favorited = [aDecoder decodeBoolForKey:kSinaRetweetedStatusFavorited];
    self.truncated = [aDecoder decodeBoolForKey:kSinaRetweetedStatusTruncated];
    self.retweetedStatusIdentifier = [aDecoder decodeDoubleForKey:kSinaRetweetedStatusId];
    self.createdAt = [aDecoder decodeObjectForKey:kSinaRetweetedStatusCreatedAt];
    self.inReplyToScreenName = [aDecoder decodeObjectForKey:kSinaRetweetedStatusInReplyToScreenName];
    self.isLongText = [aDecoder decodeBoolForKey:kSinaRetweetedStatusIsLongText];
    self.picUrls = [aDecoder decodeObjectForKey:kSinaRetweetedStatusPicUrls];
    self.text = [aDecoder decodeObjectForKey:kSinaRetweetedStatusText];
    self.idstr = [aDecoder decodeObjectForKey:kSinaRetweetedStatusIdstr];
    self.textLength = [aDecoder decodeDoubleForKey:kSinaRetweetedStatusTextLength];
    self.sourceType = [aDecoder decodeDoubleForKey:kSinaRetweetedStatusSourceType];
    self.hotWeiboTags = [aDecoder decodeObjectForKey:kSinaRetweetedStatusHotWeiboTags];
    self.geo = [aDecoder decodeObjectForKey:kSinaRetweetedStatusGeo];
    self.pageType = [aDecoder decodeDoubleForKey:kSinaRetweetedStatusPageType];
    self.user = [aDecoder decodeObjectForKey:kSinaRetweetedStatusUser];
    self.textTagTips = [aDecoder decodeObjectForKey:kSinaRetweetedStatusTextTagTips];
    self.commentsCount = [aDecoder decodeDoubleForKey:kSinaRetweetedStatusCommentsCount];
    self.thumbnailPic = [aDecoder decodeObjectForKey:kSinaRetweetedStatusThumbnailPic];
    self.source = [aDecoder decodeObjectForKey:kSinaRetweetedStatusSource];
    self.sourceAllowclick = [aDecoder decodeDoubleForKey:kSinaRetweetedStatusSourceAllowclick];
    self.bizFeature = [aDecoder decodeDoubleForKey:kSinaRetweetedStatusBizFeature];
    self.annotations = [aDecoder decodeObjectForKey:kSinaRetweetedStatusAnnotations];
    self.bmiddlePic = [aDecoder decodeObjectForKey:kSinaRetweetedStatusBmiddlePic];
    self.visible = [aDecoder decodeObjectForKey:kSinaRetweetedStatusVisible];
    self.bizIds = [aDecoder decodeObjectForKey:kSinaRetweetedStatusBizIds];
    self.inReplyToStatusId = [aDecoder decodeObjectForKey:kSinaRetweetedStatusInReplyToStatusId];
    self.mid = [aDecoder decodeObjectForKey:kSinaRetweetedStatusMid];
    self.cardid = [aDecoder decodeObjectForKey:kSinaRetweetedStatusCardid];
    self.repostsCount = [aDecoder decodeDoubleForKey:kSinaRetweetedStatusRepostsCount];
    self.userType = [aDecoder decodeDoubleForKey:kSinaRetweetedStatusUserType];
    self.attitudesCount = [aDecoder decodeDoubleForKey:kSinaRetweetedStatusAttitudesCount];
    self.darwinTags = [aDecoder decodeObjectForKey:kSinaRetweetedStatusDarwinTags];
    self.mlevel = [aDecoder decodeDoubleForKey:kSinaRetweetedStatusMlevel];
    self.inReplyToUserId = [aDecoder decodeObjectForKey:kSinaRetweetedStatusInReplyToUserId];
    self.originalPic = [aDecoder decodeObjectForKey:kSinaRetweetedStatusOriginalPic];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_favorited forKey:kSinaRetweetedStatusFavorited];
    [aCoder encodeBool:_truncated forKey:kSinaRetweetedStatusTruncated];
    [aCoder encodeDouble:_retweetedStatusIdentifier forKey:kSinaRetweetedStatusId];
    [aCoder encodeObject:_createdAt forKey:kSinaRetweetedStatusCreatedAt];
    [aCoder encodeObject:_inReplyToScreenName forKey:kSinaRetweetedStatusInReplyToScreenName];
    [aCoder encodeBool:_isLongText forKey:kSinaRetweetedStatusIsLongText];
    [aCoder encodeObject:_picUrls forKey:kSinaRetweetedStatusPicUrls];
    [aCoder encodeObject:_text forKey:kSinaRetweetedStatusText];
    [aCoder encodeObject:_idstr forKey:kSinaRetweetedStatusIdstr];
    [aCoder encodeDouble:_textLength forKey:kSinaRetweetedStatusTextLength];
    [aCoder encodeDouble:_sourceType forKey:kSinaRetweetedStatusSourceType];
    [aCoder encodeObject:_hotWeiboTags forKey:kSinaRetweetedStatusHotWeiboTags];
    [aCoder encodeObject:_geo forKey:kSinaRetweetedStatusGeo];
    [aCoder encodeDouble:_pageType forKey:kSinaRetweetedStatusPageType];
    [aCoder encodeObject:_user forKey:kSinaRetweetedStatusUser];
    [aCoder encodeObject:_textTagTips forKey:kSinaRetweetedStatusTextTagTips];
    [aCoder encodeDouble:_commentsCount forKey:kSinaRetweetedStatusCommentsCount];
    [aCoder encodeObject:_thumbnailPic forKey:kSinaRetweetedStatusThumbnailPic];
    [aCoder encodeObject:_source forKey:kSinaRetweetedStatusSource];
    [aCoder encodeDouble:_sourceAllowclick forKey:kSinaRetweetedStatusSourceAllowclick];
    [aCoder encodeDouble:_bizFeature forKey:kSinaRetweetedStatusBizFeature];
    [aCoder encodeObject:_annotations forKey:kSinaRetweetedStatusAnnotations];
    [aCoder encodeObject:_bmiddlePic forKey:kSinaRetweetedStatusBmiddlePic];
    [aCoder encodeObject:_visible forKey:kSinaRetweetedStatusVisible];
    [aCoder encodeObject:_bizIds forKey:kSinaRetweetedStatusBizIds];
    [aCoder encodeObject:_inReplyToStatusId forKey:kSinaRetweetedStatusInReplyToStatusId];
    [aCoder encodeObject:_mid forKey:kSinaRetweetedStatusMid];
    [aCoder encodeObject:_cardid forKey:kSinaRetweetedStatusCardid];
    [aCoder encodeDouble:_repostsCount forKey:kSinaRetweetedStatusRepostsCount];
    [aCoder encodeDouble:_userType forKey:kSinaRetweetedStatusUserType];
    [aCoder encodeDouble:_attitudesCount forKey:kSinaRetweetedStatusAttitudesCount];
    [aCoder encodeObject:_darwinTags forKey:kSinaRetweetedStatusDarwinTags];
    [aCoder encodeDouble:_mlevel forKey:kSinaRetweetedStatusMlevel];
    [aCoder encodeObject:_inReplyToUserId forKey:kSinaRetweetedStatusInReplyToUserId];
    [aCoder encodeObject:_originalPic forKey:kSinaRetweetedStatusOriginalPic];
}

- (id)copyWithZone:(NSZone *)zone
{
    SinaRetweetedStatus *copy = [[SinaRetweetedStatus alloc] init];
    
    if (copy) {

        copy.favorited = self.favorited;
        copy.truncated = self.truncated;
        copy.retweetedStatusIdentifier = self.retweetedStatusIdentifier;
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.inReplyToScreenName = [self.inReplyToScreenName copyWithZone:zone];
        copy.isLongText = self.isLongText;
        copy.picUrls = [self.picUrls copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.idstr = [self.idstr copyWithZone:zone];
        copy.textLength = self.textLength;
        copy.sourceType = self.sourceType;
        copy.hotWeiboTags = [self.hotWeiboTags copyWithZone:zone];
        copy.geo = [self.geo copyWithZone:zone];
        copy.pageType = self.pageType;
        copy.user = [self.user copyWithZone:zone];
        copy.textTagTips = [self.textTagTips copyWithZone:zone];
        copy.commentsCount = self.commentsCount;
        copy.thumbnailPic = [self.thumbnailPic copyWithZone:zone];
        copy.source = [self.source copyWithZone:zone];
        copy.sourceAllowclick = self.sourceAllowclick;
        copy.bizFeature = self.bizFeature;
        copy.annotations = [self.annotations copyWithZone:zone];
        copy.bmiddlePic = [self.bmiddlePic copyWithZone:zone];
        copy.visible = [self.visible copyWithZone:zone];
        copy.bizIds = [self.bizIds copyWithZone:zone];
        copy.inReplyToStatusId = [self.inReplyToStatusId copyWithZone:zone];
        copy.mid = [self.mid copyWithZone:zone];
        copy.cardid = [self.cardid copyWithZone:zone];
        copy.repostsCount = self.repostsCount;
        copy.userType = self.userType;
        copy.attitudesCount = self.attitudesCount;
        copy.darwinTags = [self.darwinTags copyWithZone:zone];
        copy.mlevel = self.mlevel;
        copy.inReplyToUserId = [self.inReplyToUserId copyWithZone:zone];
        copy.originalPic = [self.originalPic copyWithZone:zone];
    }
    
    return copy;
}


@end
