//
//  SinaUser.m
//
//  Created by mac  on 16/5/18
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SinaUser.h"


NSString *const kSinaUserCoverImagePhone = @"cover_image_phone";
NSString *const kSinaUserId = @"id";
NSString *const kSinaUserBiFollowersCount = @"bi_followers_count";
NSString *const kSinaUserUrank = @"urank";
NSString *const kSinaUserProfileImageUrl = @"profile_image_url";
NSString *const kSinaUserClass = @"class";
NSString *const kSinaUserVerifiedContactEmail = @"verified_contact_email";
NSString *const kSinaUserProvince = @"province";
NSString *const kSinaUserAbilityTags = @"ability_tags";
NSString *const kSinaUserVerified = @"verified";
NSString *const kSinaUserGeoEnabled = @"geo_enabled";
NSString *const kSinaUserUrl = @"url";
NSString *const kSinaUserFollowMe = @"follow_me";
NSString *const kSinaUserStatusesCount = @"statuses_count";
NSString *const kSinaUserDescription = @"description";
NSString *const kSinaUserFollowersCount = @"followers_count";
NSString *const kSinaUserVerifiedContactMobile = @"verified_contact_mobile";
NSString *const kSinaUserLocation = @"location";
NSString *const kSinaUserMbrank = @"mbrank";
NSString *const kSinaUserAvatarLarge = @"avatar_large";
NSString *const kSinaUserStar = @"star";
NSString *const kSinaUserVerifiedTrade = @"verified_trade";
NSString *const kSinaUserWeihao = @"weihao";
NSString *const kSinaUserCoverImage = @"cover_image";
NSString *const kSinaUserOnlineStatus = @"online_status";
NSString *const kSinaUserProfileUrl = @"profile_url";
NSString *const kSinaUserVerifiedContactName = @"verified_contact_name";
NSString *const kSinaUserVerifiedSourceUrl = @"verified_source_url";
NSString *const kSinaUserScreenName = @"screen_name";
NSString *const kSinaUserPagefriendsCount = @"pagefriends_count";
NSString *const kSinaUserVerifiedReason = @"verified_reason";
NSString *const kSinaUserName = @"name";
NSString *const kSinaUserFriendsCount = @"friends_count";
NSString *const kSinaUserMbtype = @"mbtype";
NSString *const kSinaUserBlockApp = @"block_app";
NSString *const kSinaUserAvatarHd = @"avatar_hd";
NSString *const kSinaUserCreditScore = @"credit_score";
NSString *const kSinaUserRemark = @"remark";
NSString *const kSinaUserCreatedAt = @"created_at";
NSString *const kSinaUserBlockWord = @"block_word";
NSString *const kSinaUserAllowAllActMsg = @"allow_all_act_msg";
NSString *const kSinaUserVerifiedState = @"verified_state";
NSString *const kSinaUserDianping = @"dianping";
NSString *const kSinaUserDomain = @"domain";
NSString *const kSinaUserVerifiedReasonModified = @"verified_reason_modified";
NSString *const kSinaUserUnicomFreePc = @"unicom_free_pc";
NSString *const kSinaUserCardid = @"cardid";
NSString *const kSinaUserAllowAllComment = @"allow_all_comment";
NSString *const kSinaUserVerifiedLevel = @"verified_level";
NSString *const kSinaUserVerifiedReasonUrl = @"verified_reason_url";
NSString *const kSinaUserGender = @"gender";
NSString *const kSinaUserFavouritesCount = @"favourites_count";
NSString *const kSinaUserIdstr = @"idstr";
NSString *const kSinaUserVerifiedType = @"verified_type";
NSString *const kSinaUserCity = @"city";
NSString *const kSinaUserVerifiedSource = @"verified_source";
NSString *const kSinaUserUserAbility = @"user_ability";
NSString *const kSinaUserLang = @"lang";
NSString *const kSinaUserPtype = @"ptype";
NSString *const kSinaUserFollowing = @"following";


@interface SinaUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SinaUser

@synthesize coverImagePhone = _coverImagePhone;
@synthesize userIdentifier = _userIdentifier;
@synthesize biFollowersCount = _biFollowersCount;
@synthesize urank = _urank;
@synthesize profileImageUrl = _profileImageUrl;
@synthesize classProperty = _classProperty;
@synthesize verifiedContactEmail = _verifiedContactEmail;
@synthesize province = _province;
@synthesize abilityTags = _abilityTags;
@synthesize verified = _verified;
@synthesize geoEnabled = _geoEnabled;
@synthesize url = _url;
@synthesize followMe = _followMe;
@synthesize statusesCount = _statusesCount;
@synthesize userDescription = _userDescription;
@synthesize followersCount = _followersCount;
@synthesize verifiedContactMobile = _verifiedContactMobile;
@synthesize location = _location;
@synthesize mbrank = _mbrank;
@synthesize avatarLarge = _avatarLarge;
@synthesize star = _star;
@synthesize verifiedTrade = _verifiedTrade;
@synthesize weihao = _weihao;
@synthesize coverImage = _coverImage;
@synthesize onlineStatus = _onlineStatus;
@synthesize profileUrl = _profileUrl;
@synthesize verifiedContactName = _verifiedContactName;
@synthesize verifiedSourceUrl = _verifiedSourceUrl;
@synthesize screenName = _screenName;
@synthesize pagefriendsCount = _pagefriendsCount;
@synthesize verifiedReason = _verifiedReason;
@synthesize name = _name;
@synthesize friendsCount = _friendsCount;
@synthesize mbtype = _mbtype;
@synthesize blockApp = _blockApp;
@synthesize avatarHd = _avatarHd;
@synthesize creditScore = _creditScore;
@synthesize remark = _remark;
@synthesize createdAt = _createdAt;
@synthesize blockWord = _blockWord;
@synthesize allowAllActMsg = _allowAllActMsg;
@synthesize verifiedState = _verifiedState;
@synthesize dianping = _dianping;
@synthesize domain = _domain;
@synthesize verifiedReasonModified = _verifiedReasonModified;
@synthesize unicomFreePc = _unicomFreePc;
@synthesize cardid = _cardid;
@synthesize allowAllComment = _allowAllComment;
@synthesize verifiedLevel = _verifiedLevel;
@synthesize verifiedReasonUrl = _verifiedReasonUrl;
@synthesize gender = _gender;
@synthesize favouritesCount = _favouritesCount;
@synthesize idstr = _idstr;
@synthesize verifiedType = _verifiedType;
@synthesize city = _city;
@synthesize verifiedSource = _verifiedSource;
@synthesize userAbility = _userAbility;
@synthesize lang = _lang;
@synthesize ptype = _ptype;
@synthesize following = _following;


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
            self.coverImagePhone = [self objectOrNilForKey:kSinaUserCoverImagePhone fromDictionary:dict];
            self.userIdentifier = [[self objectOrNilForKey:kSinaUserId fromDictionary:dict] doubleValue];
            self.biFollowersCount = [[self objectOrNilForKey:kSinaUserBiFollowersCount fromDictionary:dict] doubleValue];
            self.urank = [[self objectOrNilForKey:kSinaUserUrank fromDictionary:dict] doubleValue];
            self.profileImageUrl = [self objectOrNilForKey:kSinaUserProfileImageUrl fromDictionary:dict];
            self.classProperty = [[self objectOrNilForKey:kSinaUserClass fromDictionary:dict] doubleValue];
            self.verifiedContactEmail = [self objectOrNilForKey:kSinaUserVerifiedContactEmail fromDictionary:dict];
            self.province = [self objectOrNilForKey:kSinaUserProvince fromDictionary:dict];
            self.abilityTags = [self objectOrNilForKey:kSinaUserAbilityTags fromDictionary:dict];
            self.verified = [[self objectOrNilForKey:kSinaUserVerified fromDictionary:dict] boolValue];
            self.geoEnabled = [[self objectOrNilForKey:kSinaUserGeoEnabled fromDictionary:dict] boolValue];
            self.url = [self objectOrNilForKey:kSinaUserUrl fromDictionary:dict];
            self.followMe = [[self objectOrNilForKey:kSinaUserFollowMe fromDictionary:dict] boolValue];
            self.statusesCount = [[self objectOrNilForKey:kSinaUserStatusesCount fromDictionary:dict] doubleValue];
            self.userDescription = [self objectOrNilForKey:kSinaUserDescription fromDictionary:dict];
            self.followersCount = [[self objectOrNilForKey:kSinaUserFollowersCount fromDictionary:dict] doubleValue];
            self.verifiedContactMobile = [self objectOrNilForKey:kSinaUserVerifiedContactMobile fromDictionary:dict];
            self.location = [self objectOrNilForKey:kSinaUserLocation fromDictionary:dict];
            self.mbrank = [[self objectOrNilForKey:kSinaUserMbrank fromDictionary:dict] doubleValue];
            self.avatarLarge = [self objectOrNilForKey:kSinaUserAvatarLarge fromDictionary:dict];
            self.star = [[self objectOrNilForKey:kSinaUserStar fromDictionary:dict] doubleValue];
            self.verifiedTrade = [self objectOrNilForKey:kSinaUserVerifiedTrade fromDictionary:dict];
            self.weihao = [self objectOrNilForKey:kSinaUserWeihao fromDictionary:dict];
            self.coverImage = [self objectOrNilForKey:kSinaUserCoverImage fromDictionary:dict];
            self.onlineStatus = [[self objectOrNilForKey:kSinaUserOnlineStatus fromDictionary:dict] doubleValue];
            self.profileUrl = [self objectOrNilForKey:kSinaUserProfileUrl fromDictionary:dict];
            self.verifiedContactName = [self objectOrNilForKey:kSinaUserVerifiedContactName fromDictionary:dict];
            self.verifiedSourceUrl = [self objectOrNilForKey:kSinaUserVerifiedSourceUrl fromDictionary:dict];
            self.screenName = [self objectOrNilForKey:kSinaUserScreenName fromDictionary:dict];
            self.pagefriendsCount = [[self objectOrNilForKey:kSinaUserPagefriendsCount fromDictionary:dict] doubleValue];
            self.verifiedReason = [self objectOrNilForKey:kSinaUserVerifiedReason fromDictionary:dict];
            self.name = [self objectOrNilForKey:kSinaUserName fromDictionary:dict];
            self.friendsCount = [[self objectOrNilForKey:kSinaUserFriendsCount fromDictionary:dict] doubleValue];
            self.mbtype = [[self objectOrNilForKey:kSinaUserMbtype fromDictionary:dict] doubleValue];
            self.blockApp = [[self objectOrNilForKey:kSinaUserBlockApp fromDictionary:dict] doubleValue];
            self.avatarHd = [self objectOrNilForKey:kSinaUserAvatarHd fromDictionary:dict];
            self.creditScore = [[self objectOrNilForKey:kSinaUserCreditScore fromDictionary:dict] doubleValue];
            self.remark = [self objectOrNilForKey:kSinaUserRemark fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kSinaUserCreatedAt fromDictionary:dict];
            self.blockWord = [[self objectOrNilForKey:kSinaUserBlockWord fromDictionary:dict] doubleValue];
            self.allowAllActMsg = [[self objectOrNilForKey:kSinaUserAllowAllActMsg fromDictionary:dict] boolValue];
            self.verifiedState = [[self objectOrNilForKey:kSinaUserVerifiedState fromDictionary:dict] doubleValue];
            self.dianping = [self objectOrNilForKey:kSinaUserDianping fromDictionary:dict];
            self.domain = [self objectOrNilForKey:kSinaUserDomain fromDictionary:dict];
            self.verifiedReasonModified = [self objectOrNilForKey:kSinaUserVerifiedReasonModified fromDictionary:dict];
            self.unicomFreePc = [self objectOrNilForKey:kSinaUserUnicomFreePc fromDictionary:dict];
            self.cardid = [self objectOrNilForKey:kSinaUserCardid fromDictionary:dict];
            self.allowAllComment = [[self objectOrNilForKey:kSinaUserAllowAllComment fromDictionary:dict] boolValue];
            self.verifiedLevel = [[self objectOrNilForKey:kSinaUserVerifiedLevel fromDictionary:dict] doubleValue];
            self.verifiedReasonUrl = [self objectOrNilForKey:kSinaUserVerifiedReasonUrl fromDictionary:dict];
            self.gender = [self objectOrNilForKey:kSinaUserGender fromDictionary:dict];
            self.favouritesCount = [[self objectOrNilForKey:kSinaUserFavouritesCount fromDictionary:dict] doubleValue];
            self.idstr = [self objectOrNilForKey:kSinaUserIdstr fromDictionary:dict];
            self.verifiedType = [[self objectOrNilForKey:kSinaUserVerifiedType fromDictionary:dict] doubleValue];
            self.city = [self objectOrNilForKey:kSinaUserCity fromDictionary:dict];
            self.verifiedSource = [self objectOrNilForKey:kSinaUserVerifiedSource fromDictionary:dict];
            self.userAbility = [[self objectOrNilForKey:kSinaUserUserAbility fromDictionary:dict] doubleValue];
            self.lang = [self objectOrNilForKey:kSinaUserLang fromDictionary:dict];
            self.ptype = [[self objectOrNilForKey:kSinaUserPtype fromDictionary:dict] doubleValue];
            self.following = [[self objectOrNilForKey:kSinaUserFollowing fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.coverImagePhone forKey:kSinaUserCoverImagePhone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userIdentifier] forKey:kSinaUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.biFollowersCount] forKey:kSinaUserBiFollowersCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.urank] forKey:kSinaUserUrank];
    [mutableDict setValue:self.profileImageUrl forKey:kSinaUserProfileImageUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.classProperty] forKey:kSinaUserClass];
    [mutableDict setValue:self.verifiedContactEmail forKey:kSinaUserVerifiedContactEmail];
    [mutableDict setValue:self.province forKey:kSinaUserProvince];
    [mutableDict setValue:self.abilityTags forKey:kSinaUserAbilityTags];
    [mutableDict setValue:[NSNumber numberWithBool:self.verified] forKey:kSinaUserVerified];
    [mutableDict setValue:[NSNumber numberWithBool:self.geoEnabled] forKey:kSinaUserGeoEnabled];
    [mutableDict setValue:self.url forKey:kSinaUserUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.followMe] forKey:kSinaUserFollowMe];
    [mutableDict setValue:[NSNumber numberWithDouble:self.statusesCount] forKey:kSinaUserStatusesCount];
    [mutableDict setValue:self.userDescription forKey:kSinaUserDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.followersCount] forKey:kSinaUserFollowersCount];
    [mutableDict setValue:self.verifiedContactMobile forKey:kSinaUserVerifiedContactMobile];
    [mutableDict setValue:self.location forKey:kSinaUserLocation];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mbrank] forKey:kSinaUserMbrank];
    [mutableDict setValue:self.avatarLarge forKey:kSinaUserAvatarLarge];
    [mutableDict setValue:[NSNumber numberWithDouble:self.star] forKey:kSinaUserStar];
    [mutableDict setValue:self.verifiedTrade forKey:kSinaUserVerifiedTrade];
    [mutableDict setValue:self.weihao forKey:kSinaUserWeihao];
    [mutableDict setValue:self.coverImage forKey:kSinaUserCoverImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.onlineStatus] forKey:kSinaUserOnlineStatus];
    [mutableDict setValue:self.profileUrl forKey:kSinaUserProfileUrl];
    [mutableDict setValue:self.verifiedContactName forKey:kSinaUserVerifiedContactName];
    [mutableDict setValue:self.verifiedSourceUrl forKey:kSinaUserVerifiedSourceUrl];
    [mutableDict setValue:self.screenName forKey:kSinaUserScreenName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pagefriendsCount] forKey:kSinaUserPagefriendsCount];
    [mutableDict setValue:self.verifiedReason forKey:kSinaUserVerifiedReason];
    [mutableDict setValue:self.name forKey:kSinaUserName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.friendsCount] forKey:kSinaUserFriendsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mbtype] forKey:kSinaUserMbtype];
    [mutableDict setValue:[NSNumber numberWithDouble:self.blockApp] forKey:kSinaUserBlockApp];
    [mutableDict setValue:self.avatarHd forKey:kSinaUserAvatarHd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.creditScore] forKey:kSinaUserCreditScore];
    [mutableDict setValue:self.remark forKey:kSinaUserRemark];
    [mutableDict setValue:self.createdAt forKey:kSinaUserCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.blockWord] forKey:kSinaUserBlockWord];
    [mutableDict setValue:[NSNumber numberWithBool:self.allowAllActMsg] forKey:kSinaUserAllowAllActMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.verifiedState] forKey:kSinaUserVerifiedState];
    [mutableDict setValue:self.dianping forKey:kSinaUserDianping];
    [mutableDict setValue:self.domain forKey:kSinaUserDomain];
    [mutableDict setValue:self.verifiedReasonModified forKey:kSinaUserVerifiedReasonModified];
    [mutableDict setValue:self.unicomFreePc forKey:kSinaUserUnicomFreePc];
    [mutableDict setValue:self.cardid forKey:kSinaUserCardid];
    [mutableDict setValue:[NSNumber numberWithBool:self.allowAllComment] forKey:kSinaUserAllowAllComment];
    [mutableDict setValue:[NSNumber numberWithDouble:self.verifiedLevel] forKey:kSinaUserVerifiedLevel];
    [mutableDict setValue:self.verifiedReasonUrl forKey:kSinaUserVerifiedReasonUrl];
    [mutableDict setValue:self.gender forKey:kSinaUserGender];
    [mutableDict setValue:[NSNumber numberWithDouble:self.favouritesCount] forKey:kSinaUserFavouritesCount];
    [mutableDict setValue:self.idstr forKey:kSinaUserIdstr];
    [mutableDict setValue:[NSNumber numberWithDouble:self.verifiedType] forKey:kSinaUserVerifiedType];
    [mutableDict setValue:self.city forKey:kSinaUserCity];
    [mutableDict setValue:self.verifiedSource forKey:kSinaUserVerifiedSource];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userAbility] forKey:kSinaUserUserAbility];
    [mutableDict setValue:self.lang forKey:kSinaUserLang];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ptype] forKey:kSinaUserPtype];
    [mutableDict setValue:[NSNumber numberWithBool:self.following] forKey:kSinaUserFollowing];

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

    self.coverImagePhone = [aDecoder decodeObjectForKey:kSinaUserCoverImagePhone];
    self.userIdentifier = [aDecoder decodeDoubleForKey:kSinaUserId];
    self.biFollowersCount = [aDecoder decodeDoubleForKey:kSinaUserBiFollowersCount];
    self.urank = [aDecoder decodeDoubleForKey:kSinaUserUrank];
    self.profileImageUrl = [aDecoder decodeObjectForKey:kSinaUserProfileImageUrl];
    self.classProperty = [aDecoder decodeDoubleForKey:kSinaUserClass];
    self.verifiedContactEmail = [aDecoder decodeObjectForKey:kSinaUserVerifiedContactEmail];
    self.province = [aDecoder decodeObjectForKey:kSinaUserProvince];
    self.abilityTags = [aDecoder decodeObjectForKey:kSinaUserAbilityTags];
    self.verified = [aDecoder decodeBoolForKey:kSinaUserVerified];
    self.geoEnabled = [aDecoder decodeBoolForKey:kSinaUserGeoEnabled];
    self.url = [aDecoder decodeObjectForKey:kSinaUserUrl];
    self.followMe = [aDecoder decodeBoolForKey:kSinaUserFollowMe];
    self.statusesCount = [aDecoder decodeDoubleForKey:kSinaUserStatusesCount];
    self.userDescription = [aDecoder decodeObjectForKey:kSinaUserDescription];
    self.followersCount = [aDecoder decodeDoubleForKey:kSinaUserFollowersCount];
    self.verifiedContactMobile = [aDecoder decodeObjectForKey:kSinaUserVerifiedContactMobile];
    self.location = [aDecoder decodeObjectForKey:kSinaUserLocation];
    self.mbrank = [aDecoder decodeDoubleForKey:kSinaUserMbrank];
    self.avatarLarge = [aDecoder decodeObjectForKey:kSinaUserAvatarLarge];
    self.star = [aDecoder decodeDoubleForKey:kSinaUserStar];
    self.verifiedTrade = [aDecoder decodeObjectForKey:kSinaUserVerifiedTrade];
    self.weihao = [aDecoder decodeObjectForKey:kSinaUserWeihao];
    self.coverImage = [aDecoder decodeObjectForKey:kSinaUserCoverImage];
    self.onlineStatus = [aDecoder decodeDoubleForKey:kSinaUserOnlineStatus];
    self.profileUrl = [aDecoder decodeObjectForKey:kSinaUserProfileUrl];
    self.verifiedContactName = [aDecoder decodeObjectForKey:kSinaUserVerifiedContactName];
    self.verifiedSourceUrl = [aDecoder decodeObjectForKey:kSinaUserVerifiedSourceUrl];
    self.screenName = [aDecoder decodeObjectForKey:kSinaUserScreenName];
    self.pagefriendsCount = [aDecoder decodeDoubleForKey:kSinaUserPagefriendsCount];
    self.verifiedReason = [aDecoder decodeObjectForKey:kSinaUserVerifiedReason];
    self.name = [aDecoder decodeObjectForKey:kSinaUserName];
    self.friendsCount = [aDecoder decodeDoubleForKey:kSinaUserFriendsCount];
    self.mbtype = [aDecoder decodeDoubleForKey:kSinaUserMbtype];
    self.blockApp = [aDecoder decodeDoubleForKey:kSinaUserBlockApp];
    self.avatarHd = [aDecoder decodeObjectForKey:kSinaUserAvatarHd];
    self.creditScore = [aDecoder decodeDoubleForKey:kSinaUserCreditScore];
    self.remark = [aDecoder decodeObjectForKey:kSinaUserRemark];
    self.createdAt = [aDecoder decodeObjectForKey:kSinaUserCreatedAt];
    self.blockWord = [aDecoder decodeDoubleForKey:kSinaUserBlockWord];
    self.allowAllActMsg = [aDecoder decodeBoolForKey:kSinaUserAllowAllActMsg];
    self.verifiedState = [aDecoder decodeDoubleForKey:kSinaUserVerifiedState];
    self.dianping = [aDecoder decodeObjectForKey:kSinaUserDianping];
    self.domain = [aDecoder decodeObjectForKey:kSinaUserDomain];
    self.verifiedReasonModified = [aDecoder decodeObjectForKey:kSinaUserVerifiedReasonModified];
    self.unicomFreePc = [aDecoder decodeObjectForKey:kSinaUserUnicomFreePc];
    self.cardid = [aDecoder decodeObjectForKey:kSinaUserCardid];
    self.allowAllComment = [aDecoder decodeBoolForKey:kSinaUserAllowAllComment];
    self.verifiedLevel = [aDecoder decodeDoubleForKey:kSinaUserVerifiedLevel];
    self.verifiedReasonUrl = [aDecoder decodeObjectForKey:kSinaUserVerifiedReasonUrl];
    self.gender = [aDecoder decodeObjectForKey:kSinaUserGender];
    self.favouritesCount = [aDecoder decodeDoubleForKey:kSinaUserFavouritesCount];
    self.idstr = [aDecoder decodeObjectForKey:kSinaUserIdstr];
    self.verifiedType = [aDecoder decodeDoubleForKey:kSinaUserVerifiedType];
    self.city = [aDecoder decodeObjectForKey:kSinaUserCity];
    self.verifiedSource = [aDecoder decodeObjectForKey:kSinaUserVerifiedSource];
    self.userAbility = [aDecoder decodeDoubleForKey:kSinaUserUserAbility];
    self.lang = [aDecoder decodeObjectForKey:kSinaUserLang];
    self.ptype = [aDecoder decodeDoubleForKey:kSinaUserPtype];
    self.following = [aDecoder decodeBoolForKey:kSinaUserFollowing];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_coverImagePhone forKey:kSinaUserCoverImagePhone];
    [aCoder encodeDouble:_userIdentifier forKey:kSinaUserId];
    [aCoder encodeDouble:_biFollowersCount forKey:kSinaUserBiFollowersCount];
    [aCoder encodeDouble:_urank forKey:kSinaUserUrank];
    [aCoder encodeObject:_profileImageUrl forKey:kSinaUserProfileImageUrl];
    [aCoder encodeDouble:_classProperty forKey:kSinaUserClass];
    [aCoder encodeObject:_verifiedContactEmail forKey:kSinaUserVerifiedContactEmail];
    [aCoder encodeObject:_province forKey:kSinaUserProvince];
    [aCoder encodeObject:_abilityTags forKey:kSinaUserAbilityTags];
    [aCoder encodeBool:_verified forKey:kSinaUserVerified];
    [aCoder encodeBool:_geoEnabled forKey:kSinaUserGeoEnabled];
    [aCoder encodeObject:_url forKey:kSinaUserUrl];
    [aCoder encodeBool:_followMe forKey:kSinaUserFollowMe];
    [aCoder encodeDouble:_statusesCount forKey:kSinaUserStatusesCount];
    [aCoder encodeObject:_userDescription forKey:kSinaUserDescription];
    [aCoder encodeDouble:_followersCount forKey:kSinaUserFollowersCount];
    [aCoder encodeObject:_verifiedContactMobile forKey:kSinaUserVerifiedContactMobile];
    [aCoder encodeObject:_location forKey:kSinaUserLocation];
    [aCoder encodeDouble:_mbrank forKey:kSinaUserMbrank];
    [aCoder encodeObject:_avatarLarge forKey:kSinaUserAvatarLarge];
    [aCoder encodeDouble:_star forKey:kSinaUserStar];
    [aCoder encodeObject:_verifiedTrade forKey:kSinaUserVerifiedTrade];
    [aCoder encodeObject:_weihao forKey:kSinaUserWeihao];
    [aCoder encodeObject:_coverImage forKey:kSinaUserCoverImage];
    [aCoder encodeDouble:_onlineStatus forKey:kSinaUserOnlineStatus];
    [aCoder encodeObject:_profileUrl forKey:kSinaUserProfileUrl];
    [aCoder encodeObject:_verifiedContactName forKey:kSinaUserVerifiedContactName];
    [aCoder encodeObject:_verifiedSourceUrl forKey:kSinaUserVerifiedSourceUrl];
    [aCoder encodeObject:_screenName forKey:kSinaUserScreenName];
    [aCoder encodeDouble:_pagefriendsCount forKey:kSinaUserPagefriendsCount];
    [aCoder encodeObject:_verifiedReason forKey:kSinaUserVerifiedReason];
    [aCoder encodeObject:_name forKey:kSinaUserName];
    [aCoder encodeDouble:_friendsCount forKey:kSinaUserFriendsCount];
    [aCoder encodeDouble:_mbtype forKey:kSinaUserMbtype];
    [aCoder encodeDouble:_blockApp forKey:kSinaUserBlockApp];
    [aCoder encodeObject:_avatarHd forKey:kSinaUserAvatarHd];
    [aCoder encodeDouble:_creditScore forKey:kSinaUserCreditScore];
    [aCoder encodeObject:_remark forKey:kSinaUserRemark];
    [aCoder encodeObject:_createdAt forKey:kSinaUserCreatedAt];
    [aCoder encodeDouble:_blockWord forKey:kSinaUserBlockWord];
    [aCoder encodeBool:_allowAllActMsg forKey:kSinaUserAllowAllActMsg];
    [aCoder encodeDouble:_verifiedState forKey:kSinaUserVerifiedState];
    [aCoder encodeObject:_dianping forKey:kSinaUserDianping];
    [aCoder encodeObject:_domain forKey:kSinaUserDomain];
    [aCoder encodeObject:_verifiedReasonModified forKey:kSinaUserVerifiedReasonModified];
    [aCoder encodeObject:_unicomFreePc forKey:kSinaUserUnicomFreePc];
    [aCoder encodeObject:_cardid forKey:kSinaUserCardid];
    [aCoder encodeBool:_allowAllComment forKey:kSinaUserAllowAllComment];
    [aCoder encodeDouble:_verifiedLevel forKey:kSinaUserVerifiedLevel];
    [aCoder encodeObject:_verifiedReasonUrl forKey:kSinaUserVerifiedReasonUrl];
    [aCoder encodeObject:_gender forKey:kSinaUserGender];
    [aCoder encodeDouble:_favouritesCount forKey:kSinaUserFavouritesCount];
    [aCoder encodeObject:_idstr forKey:kSinaUserIdstr];
    [aCoder encodeDouble:_verifiedType forKey:kSinaUserVerifiedType];
    [aCoder encodeObject:_city forKey:kSinaUserCity];
    [aCoder encodeObject:_verifiedSource forKey:kSinaUserVerifiedSource];
    [aCoder encodeDouble:_userAbility forKey:kSinaUserUserAbility];
    [aCoder encodeObject:_lang forKey:kSinaUserLang];
    [aCoder encodeDouble:_ptype forKey:kSinaUserPtype];
    [aCoder encodeBool:_following forKey:kSinaUserFollowing];
}

- (id)copyWithZone:(NSZone *)zone
{
    SinaUser *copy = [[SinaUser alloc] init];
    
    if (copy) {

        copy.coverImagePhone = [self.coverImagePhone copyWithZone:zone];
        copy.userIdentifier = self.userIdentifier;
        copy.biFollowersCount = self.biFollowersCount;
        copy.urank = self.urank;
        copy.profileImageUrl = [self.profileImageUrl copyWithZone:zone];
        copy.classProperty = self.classProperty;
        copy.verifiedContactEmail = [self.verifiedContactEmail copyWithZone:zone];
        copy.province = [self.province copyWithZone:zone];
        copy.abilityTags = [self.abilityTags copyWithZone:zone];
        copy.verified = self.verified;
        copy.geoEnabled = self.geoEnabled;
        copy.url = [self.url copyWithZone:zone];
        copy.followMe = self.followMe;
        copy.statusesCount = self.statusesCount;
        copy.userDescription = [self.userDescription copyWithZone:zone];
        copy.followersCount = self.followersCount;
        copy.verifiedContactMobile = [self.verifiedContactMobile copyWithZone:zone];
        copy.location = [self.location copyWithZone:zone];
        copy.mbrank = self.mbrank;
        copy.avatarLarge = [self.avatarLarge copyWithZone:zone];
        copy.star = self.star;
        copy.verifiedTrade = [self.verifiedTrade copyWithZone:zone];
        copy.weihao = [self.weihao copyWithZone:zone];
        copy.coverImage = [self.coverImage copyWithZone:zone];
        copy.onlineStatus = self.onlineStatus;
        copy.profileUrl = [self.profileUrl copyWithZone:zone];
        copy.verifiedContactName = [self.verifiedContactName copyWithZone:zone];
        copy.verifiedSourceUrl = [self.verifiedSourceUrl copyWithZone:zone];
        copy.screenName = [self.screenName copyWithZone:zone];
        copy.pagefriendsCount = self.pagefriendsCount;
        copy.verifiedReason = [self.verifiedReason copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.friendsCount = self.friendsCount;
        copy.mbtype = self.mbtype;
        copy.blockApp = self.blockApp;
        copy.avatarHd = [self.avatarHd copyWithZone:zone];
        copy.creditScore = self.creditScore;
        copy.remark = [self.remark copyWithZone:zone];
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.blockWord = self.blockWord;
        copy.allowAllActMsg = self.allowAllActMsg;
        copy.verifiedState = self.verifiedState;
        copy.dianping = [self.dianping copyWithZone:zone];
        copy.domain = [self.domain copyWithZone:zone];
        copy.verifiedReasonModified = [self.verifiedReasonModified copyWithZone:zone];
        copy.unicomFreePc = [self.unicomFreePc copyWithZone:zone];
        copy.cardid = [self.cardid copyWithZone:zone];
        copy.allowAllComment = self.allowAllComment;
        copy.verifiedLevel = self.verifiedLevel;
        copy.verifiedReasonUrl = [self.verifiedReasonUrl copyWithZone:zone];
        copy.gender = [self.gender copyWithZone:zone];
        copy.favouritesCount = self.favouritesCount;
        copy.idstr = [self.idstr copyWithZone:zone];
        copy.verifiedType = self.verifiedType;
        copy.city = [self.city copyWithZone:zone];
        copy.verifiedSource = [self.verifiedSource copyWithZone:zone];
        copy.userAbility = self.userAbility;
        copy.lang = [self.lang copyWithZone:zone];
        copy.ptype = self.ptype;
        copy.following = self.following;
    }
    
    return copy;
}


@end
