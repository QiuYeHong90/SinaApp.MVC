//
//  SinaStatuses.m
//
//  Created by mac  on 16/5/18
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//
#import "NSString+Extension.h"
#import "SinaStatuses.h"
#import "SinaRetweetedStatus.h"
#import "SinaUser.h"
#import "SinaAnnotations.h"
#import "SinaVisible.h"


NSString *const kSinaStatusesFavorited = @"favorited";
NSString *const kSinaStatusesTruncated = @"truncated";
NSString *const kSinaStatusesId = @"id";
NSString *const kSinaStatusesCreatedAt = @"created_at";
NSString *const kSinaStatusesInReplyToScreenName = @"in_reply_to_screen_name";
NSString *const kSinaStatusesIsLongText = @"isLongText";
NSString *const kSinaStatusesPicUrls = @"pic_urls";
NSString *const kSinaStatusesText = @"text";
NSString *const kSinaStatusesIdstr = @"idstr";
NSString *const kSinaStatusesTextLength = @"textLength";
NSString *const kSinaStatusesSourceType = @"source_type";
NSString *const kSinaStatusesHotWeiboTags = @"hot_weibo_tags";
NSString *const kSinaStatusesRetweetedStatus = @"retweeted_status";
NSString *const kSinaStatusesGeo = @"geo";
NSString *const kSinaStatusesPageType = @"page_type";
NSString *const kSinaStatusesUser = @"user";
NSString *const kSinaStatusesTextTagTips = @"text_tag_tips";
NSString *const kSinaStatusesCommentsCount = @"comments_count";
NSString *const kSinaStatusesThumbnailPic = @"thumbnail_pic";
NSString *const kSinaStatusesSource = @"source";
NSString *const kSinaStatusesSourceAllowclick = @"source_allowclick";
NSString *const kSinaStatusesBizFeature = @"biz_feature";
NSString *const kSinaStatusesAnnotations = @"annotations";
NSString *const kSinaStatusesBmiddlePic = @"bmiddle_pic";
NSString *const kSinaStatusesVisible = @"visible";
NSString *const kSinaStatusesBizIds = @"biz_ids";
NSString *const kSinaStatusesInReplyToStatusId = @"in_reply_to_status_id";
NSString *const kSinaStatusesMid = @"mid";
NSString *const kSinaStatusesCardid = @"cardid";
NSString *const kSinaStatusesRepostsCount = @"reposts_count";
NSString *const kSinaStatusesUserType = @"userType";
NSString *const kSinaStatusesAttitudesCount = @"attitudes_count";
NSString *const kSinaStatusesDarwinTags = @"darwin_tags";
NSString *const kSinaStatusesMlevel = @"mlevel";
NSString *const kSinaStatusesRid = @"rid";
NSString *const kSinaStatusesInReplyToUserId = @"in_reply_to_user_id";
NSString *const kSinaStatusesOriginalPic = @"original_pic";


@interface SinaStatuses ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SinaStatuses

@synthesize favorited = _favorited;
@synthesize truncated = _truncated;
@synthesize statusesIdentifier = _statusesIdentifier;
@synthesize createdAt = _createdAt;
@synthesize inReplyToScreenName = _inReplyToScreenName;
@synthesize isLongText = _isLongText;
@synthesize picUrls = _picUrls;
@synthesize text = _text;
@synthesize idstr = _idstr;
@synthesize textLength = _textLength;
@synthesize sourceType = _sourceType;
@synthesize hotWeiboTags = _hotWeiboTags;
@synthesize retweetedStatus = _retweetedStatus;
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
@synthesize rid = _rid;
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
            self.favorited = [[self objectOrNilForKey:kSinaStatusesFavorited fromDictionary:dict] boolValue];
            self.truncated = [[self objectOrNilForKey:kSinaStatusesTruncated fromDictionary:dict] boolValue];
            self.statusesIdentifier = [[self objectOrNilForKey:kSinaStatusesId fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kSinaStatusesCreatedAt fromDictionary:dict];
            self.inReplyToScreenName = [self objectOrNilForKey:kSinaStatusesInReplyToScreenName fromDictionary:dict];
            self.isLongText = [[self objectOrNilForKey:kSinaStatusesIsLongText fromDictionary:dict] boolValue];
            self.picUrls = [self objectOrNilForKey:kSinaStatusesPicUrls fromDictionary:dict];
            self.text = [self objectOrNilForKey:kSinaStatusesText fromDictionary:dict];
            self.idstr = [self objectOrNilForKey:kSinaStatusesIdstr fromDictionary:dict];
            self.textLength = [[self objectOrNilForKey:kSinaStatusesTextLength fromDictionary:dict] doubleValue];
            self.sourceType = [[self objectOrNilForKey:kSinaStatusesSourceType fromDictionary:dict] doubleValue];
            self.hotWeiboTags = [self objectOrNilForKey:kSinaStatusesHotWeiboTags fromDictionary:dict];
        
            self.retweetedStatus = [SinaRetweetedStatus modelObjectWithDictionary:[dict objectForKey:kSinaStatusesRetweetedStatus]];
            self.geo = [self objectOrNilForKey:kSinaStatusesGeo fromDictionary:dict];
            self.pageType = [[self objectOrNilForKey:kSinaStatusesPageType fromDictionary:dict] doubleValue];
            self.user = [SinaUser modelObjectWithDictionary:[dict objectForKey:kSinaStatusesUser]];
            self.textTagTips = [self objectOrNilForKey:kSinaStatusesTextTagTips fromDictionary:dict];
            self.commentsCount = [[self objectOrNilForKey:kSinaStatusesCommentsCount fromDictionary:dict] doubleValue];
            self.thumbnailPic = [self objectOrNilForKey:kSinaStatusesThumbnailPic fromDictionary:dict];
            self.source = [self objectOrNilForKey:kSinaStatusesSource fromDictionary:dict];
            self.sourceAllowclick = [[self objectOrNilForKey:kSinaStatusesSourceAllowclick fromDictionary:dict] doubleValue];
            self.bizFeature = [[self objectOrNilForKey:kSinaStatusesBizFeature fromDictionary:dict] doubleValue];
    NSObject *receivedSinaAnnotations = [dict objectForKey:kSinaStatusesAnnotations];
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
            self.bmiddlePic = [self objectOrNilForKey:kSinaStatusesBmiddlePic fromDictionary:dict];
            self.visible = [SinaVisible modelObjectWithDictionary:[dict objectForKey:kSinaStatusesVisible]];
            self.bizIds = [self objectOrNilForKey:kSinaStatusesBizIds fromDictionary:dict];
            self.inReplyToStatusId = [self objectOrNilForKey:kSinaStatusesInReplyToStatusId fromDictionary:dict];
            self.mid = [self objectOrNilForKey:kSinaStatusesMid fromDictionary:dict];
            self.cardid = [self objectOrNilForKey:kSinaStatusesCardid fromDictionary:dict];
            self.repostsCount = [[self objectOrNilForKey:kSinaStatusesRepostsCount fromDictionary:dict] doubleValue];
            self.userType = [[self objectOrNilForKey:kSinaStatusesUserType fromDictionary:dict] doubleValue];
            self.attitudesCount = [[self objectOrNilForKey:kSinaStatusesAttitudesCount fromDictionary:dict] doubleValue];
            self.darwinTags = [self objectOrNilForKey:kSinaStatusesDarwinTags fromDictionary:dict];
            self.mlevel = [[self objectOrNilForKey:kSinaStatusesMlevel fromDictionary:dict] doubleValue];
            self.rid = [self objectOrNilForKey:kSinaStatusesRid fromDictionary:dict];
            self.inReplyToUserId = [self objectOrNilForKey:kSinaStatusesInReplyToUserId fromDictionary:dict];
            self.originalPic = [self objectOrNilForKey:kSinaStatusesOriginalPic fromDictionary:dict];
        
        self.cellTextHeight = [self.text sizeWithFont:[UIFont systemFontOfSize:20] maxSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, CGFLOAT_MAX)].height;
        self.cellViewHeight = [self calculateHeightWithCount:(int)self.picUrls.count];
        if (self.retweetedStatus) {
            if (self.retweetedStatus.text) {
                //计算文字高度
                self.cellRetweetTextHeith =[self.retweetedStatus.text sizeWithFont:[UIFont systemFontOfSize:17] maxSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, CGFLOAT_MAX)].height;
            }
            else
            {
                self.cellRetweetTextHeith = 0;
            }
            if (self.retweetedStatus.picUrls) {
                //计算图片的高度
                self.cellRetweetedPicuterHeight = [self calculateHeightWithCount:(int)self.retweetedStatus.picUrls.count];
            }
            else
            {
                self.cellRetweetedPicuterHeight = 0;
            }
            
            
                
        }
        
    }
    
    return self;
    
}

-(int)calculateHeightWithCount:(int)count
{
    switch (count)
    {
        case 0:
            return  0;
            break;
            
        default:
            return (([UIScreen mainScreen].bounds.size.width-40)/3.0+10)*((count-1)/3+1)+10;
            break;
    }
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.favorited] forKey:kSinaStatusesFavorited];
    [mutableDict setValue:[NSNumber numberWithBool:self.truncated] forKey:kSinaStatusesTruncated];
    [mutableDict setValue:[NSNumber numberWithDouble:self.statusesIdentifier] forKey:kSinaStatusesId];
    [mutableDict setValue:self.createdAt forKey:kSinaStatusesCreatedAt];
    [mutableDict setValue:self.inReplyToScreenName forKey:kSinaStatusesInReplyToScreenName];
    [mutableDict setValue:[NSNumber numberWithBool:self.isLongText] forKey:kSinaStatusesIsLongText];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPicUrls] forKey:kSinaStatusesPicUrls];
    [mutableDict setValue:self.text forKey:kSinaStatusesText];
    [mutableDict setValue:self.idstr forKey:kSinaStatusesIdstr];
    [mutableDict setValue:[NSNumber numberWithDouble:self.textLength] forKey:kSinaStatusesTextLength];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sourceType] forKey:kSinaStatusesSourceType];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHotWeiboTags] forKey:kSinaStatusesHotWeiboTags];
    [mutableDict setValue:[self.retweetedStatus dictionaryRepresentation] forKey:kSinaStatusesRetweetedStatus];
    [mutableDict setValue:self.geo forKey:kSinaStatusesGeo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageType] forKey:kSinaStatusesPageType];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kSinaStatusesUser];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTextTagTips] forKey:kSinaStatusesTextTagTips];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsCount] forKey:kSinaStatusesCommentsCount];
    [mutableDict setValue:self.thumbnailPic forKey:kSinaStatusesThumbnailPic];
    [mutableDict setValue:self.source forKey:kSinaStatusesSource];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sourceAllowclick] forKey:kSinaStatusesSourceAllowclick];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bizFeature] forKey:kSinaStatusesBizFeature];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAnnotations] forKey:kSinaStatusesAnnotations];
    [mutableDict setValue:self.bmiddlePic forKey:kSinaStatusesBmiddlePic];
    [mutableDict setValue:[self.visible dictionaryRepresentation] forKey:kSinaStatusesVisible];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBizIds] forKey:kSinaStatusesBizIds];
    [mutableDict setValue:self.inReplyToStatusId forKey:kSinaStatusesInReplyToStatusId];
    [mutableDict setValue:self.mid forKey:kSinaStatusesMid];
    [mutableDict setValue:self.cardid forKey:kSinaStatusesCardid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.repostsCount] forKey:kSinaStatusesRepostsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userType] forKey:kSinaStatusesUserType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.attitudesCount] forKey:kSinaStatusesAttitudesCount];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDarwinTags] forKey:kSinaStatusesDarwinTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mlevel] forKey:kSinaStatusesMlevel];
    [mutableDict setValue:self.rid forKey:kSinaStatusesRid];
    [mutableDict setValue:self.inReplyToUserId forKey:kSinaStatusesInReplyToUserId];
    [mutableDict setValue:self.originalPic forKey:kSinaStatusesOriginalPic];

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

    self.favorited = [aDecoder decodeBoolForKey:kSinaStatusesFavorited];
    self.truncated = [aDecoder decodeBoolForKey:kSinaStatusesTruncated];
    self.statusesIdentifier = [aDecoder decodeDoubleForKey:kSinaStatusesId];
    self.createdAt = [aDecoder decodeObjectForKey:kSinaStatusesCreatedAt];
    self.inReplyToScreenName = [aDecoder decodeObjectForKey:kSinaStatusesInReplyToScreenName];
    self.isLongText = [aDecoder decodeBoolForKey:kSinaStatusesIsLongText];
    self.picUrls = [aDecoder decodeObjectForKey:kSinaStatusesPicUrls];
    self.text = [aDecoder decodeObjectForKey:kSinaStatusesText];
    self.idstr = [aDecoder decodeObjectForKey:kSinaStatusesIdstr];
    self.textLength = [aDecoder decodeDoubleForKey:kSinaStatusesTextLength];
    self.sourceType = [aDecoder decodeDoubleForKey:kSinaStatusesSourceType];
    self.hotWeiboTags = [aDecoder decodeObjectForKey:kSinaStatusesHotWeiboTags];
    self.retweetedStatus = [aDecoder decodeObjectForKey:kSinaStatusesRetweetedStatus];
    self.geo = [aDecoder decodeObjectForKey:kSinaStatusesGeo];
    self.pageType = [aDecoder decodeDoubleForKey:kSinaStatusesPageType];
    self.user = [aDecoder decodeObjectForKey:kSinaStatusesUser];
    self.textTagTips = [aDecoder decodeObjectForKey:kSinaStatusesTextTagTips];
    self.commentsCount = [aDecoder decodeDoubleForKey:kSinaStatusesCommentsCount];
    self.thumbnailPic = [aDecoder decodeObjectForKey:kSinaStatusesThumbnailPic];
    self.source = [aDecoder decodeObjectForKey:kSinaStatusesSource];
    self.sourceAllowclick = [aDecoder decodeDoubleForKey:kSinaStatusesSourceAllowclick];
    self.bizFeature = [aDecoder decodeDoubleForKey:kSinaStatusesBizFeature];
    self.annotations = [aDecoder decodeObjectForKey:kSinaStatusesAnnotations];
    self.bmiddlePic = [aDecoder decodeObjectForKey:kSinaStatusesBmiddlePic];
    self.visible = [aDecoder decodeObjectForKey:kSinaStatusesVisible];
    self.bizIds = [aDecoder decodeObjectForKey:kSinaStatusesBizIds];
    self.inReplyToStatusId = [aDecoder decodeObjectForKey:kSinaStatusesInReplyToStatusId];
    self.mid = [aDecoder decodeObjectForKey:kSinaStatusesMid];
    self.cardid = [aDecoder decodeObjectForKey:kSinaStatusesCardid];
    self.repostsCount = [aDecoder decodeDoubleForKey:kSinaStatusesRepostsCount];
    self.userType = [aDecoder decodeDoubleForKey:kSinaStatusesUserType];
    self.attitudesCount = [aDecoder decodeDoubleForKey:kSinaStatusesAttitudesCount];
    self.darwinTags = [aDecoder decodeObjectForKey:kSinaStatusesDarwinTags];
    self.mlevel = [aDecoder decodeDoubleForKey:kSinaStatusesMlevel];
    self.rid = [aDecoder decodeObjectForKey:kSinaStatusesRid];
    self.inReplyToUserId = [aDecoder decodeObjectForKey:kSinaStatusesInReplyToUserId];
    self.originalPic = [aDecoder decodeObjectForKey:kSinaStatusesOriginalPic];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_favorited forKey:kSinaStatusesFavorited];
    [aCoder encodeBool:_truncated forKey:kSinaStatusesTruncated];
    [aCoder encodeDouble:_statusesIdentifier forKey:kSinaStatusesId];
    [aCoder encodeObject:_createdAt forKey:kSinaStatusesCreatedAt];
    [aCoder encodeObject:_inReplyToScreenName forKey:kSinaStatusesInReplyToScreenName];
    [aCoder encodeBool:_isLongText forKey:kSinaStatusesIsLongText];
    [aCoder encodeObject:_picUrls forKey:kSinaStatusesPicUrls];
    [aCoder encodeObject:_text forKey:kSinaStatusesText];
    [aCoder encodeObject:_idstr forKey:kSinaStatusesIdstr];
    [aCoder encodeDouble:_textLength forKey:kSinaStatusesTextLength];
    [aCoder encodeDouble:_sourceType forKey:kSinaStatusesSourceType];
    [aCoder encodeObject:_hotWeiboTags forKey:kSinaStatusesHotWeiboTags];
    [aCoder encodeObject:_retweetedStatus forKey:kSinaStatusesRetweetedStatus];
    [aCoder encodeObject:_geo forKey:kSinaStatusesGeo];
    [aCoder encodeDouble:_pageType forKey:kSinaStatusesPageType];
    [aCoder encodeObject:_user forKey:kSinaStatusesUser];
    [aCoder encodeObject:_textTagTips forKey:kSinaStatusesTextTagTips];
    [aCoder encodeDouble:_commentsCount forKey:kSinaStatusesCommentsCount];
    [aCoder encodeObject:_thumbnailPic forKey:kSinaStatusesThumbnailPic];
    [aCoder encodeObject:_source forKey:kSinaStatusesSource];
    [aCoder encodeDouble:_sourceAllowclick forKey:kSinaStatusesSourceAllowclick];
    [aCoder encodeDouble:_bizFeature forKey:kSinaStatusesBizFeature];
    [aCoder encodeObject:_annotations forKey:kSinaStatusesAnnotations];
    [aCoder encodeObject:_bmiddlePic forKey:kSinaStatusesBmiddlePic];
    [aCoder encodeObject:_visible forKey:kSinaStatusesVisible];
    [aCoder encodeObject:_bizIds forKey:kSinaStatusesBizIds];
    [aCoder encodeObject:_inReplyToStatusId forKey:kSinaStatusesInReplyToStatusId];
    [aCoder encodeObject:_mid forKey:kSinaStatusesMid];
    [aCoder encodeObject:_cardid forKey:kSinaStatusesCardid];
    [aCoder encodeDouble:_repostsCount forKey:kSinaStatusesRepostsCount];
    [aCoder encodeDouble:_userType forKey:kSinaStatusesUserType];
    [aCoder encodeDouble:_attitudesCount forKey:kSinaStatusesAttitudesCount];
    [aCoder encodeObject:_darwinTags forKey:kSinaStatusesDarwinTags];
    [aCoder encodeDouble:_mlevel forKey:kSinaStatusesMlevel];
    [aCoder encodeObject:_rid forKey:kSinaStatusesRid];
    [aCoder encodeObject:_inReplyToUserId forKey:kSinaStatusesInReplyToUserId];
    [aCoder encodeObject:_originalPic forKey:kSinaStatusesOriginalPic];
}

- (id)copyWithZone:(NSZone *)zone
{
    SinaStatuses *copy = [[SinaStatuses alloc] init];
    
    if (copy) {

        copy.favorited = self.favorited;
        copy.truncated = self.truncated;
        copy.statusesIdentifier = self.statusesIdentifier;
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.inReplyToScreenName = [self.inReplyToScreenName copyWithZone:zone];
        copy.isLongText = self.isLongText;
        copy.picUrls = [self.picUrls copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.idstr = [self.idstr copyWithZone:zone];
        copy.textLength = self.textLength;
        copy.sourceType = self.sourceType;
        copy.hotWeiboTags = [self.hotWeiboTags copyWithZone:zone];
        copy.retweetedStatus = [self.retweetedStatus copyWithZone:zone];
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
        copy.rid = [self.rid copyWithZone:zone];
        copy.inReplyToUserId = [self.inReplyToUserId copyWithZone:zone];
        copy.originalPic = [self.originalPic copyWithZone:zone];
    }
    
    return copy;
}


@end
