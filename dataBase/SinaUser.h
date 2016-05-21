//
//  SinaUser.h
//
//  Created by mac  on 16/5/18
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SinaUser : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *coverImagePhone;
@property (nonatomic, assign) double userIdentifier;
@property (nonatomic, assign) double biFollowersCount;
@property (nonatomic, assign) double urank;
@property (nonatomic, strong) NSString *profileImageUrl;
@property (nonatomic, assign) double classProperty;
@property (nonatomic, strong) NSString *verifiedContactEmail;
@property (nonatomic, strong) NSString *province;
@property (nonatomic, strong) NSString *abilityTags;
@property (nonatomic, assign) BOOL verified;
@property (nonatomic, assign) BOOL geoEnabled;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) BOOL followMe;
@property (nonatomic, assign) double statusesCount;
@property (nonatomic, strong) NSString *userDescription;
@property (nonatomic, assign) double followersCount;
@property (nonatomic, strong) NSString *verifiedContactMobile;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, assign) double mbrank;
@property (nonatomic, strong) NSString *avatarLarge;
@property (nonatomic, assign) double star;
@property (nonatomic, strong) NSString *verifiedTrade;
@property (nonatomic, strong) NSString *weihao;
@property (nonatomic, strong) NSString *coverImage;
@property (nonatomic, assign) double onlineStatus;
@property (nonatomic, strong) NSString *profileUrl;
@property (nonatomic, strong) NSString *verifiedContactName;
@property (nonatomic, strong) NSString *verifiedSourceUrl;
@property (nonatomic, strong) NSString *screenName;
@property (nonatomic, assign) double pagefriendsCount;
@property (nonatomic, strong) NSString *verifiedReason;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double friendsCount;
@property (nonatomic, assign) double mbtype;
@property (nonatomic, assign) double blockApp;
@property (nonatomic, strong) NSString *avatarHd;
@property (nonatomic, assign) double creditScore;
@property (nonatomic, strong) NSString *remark;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) double blockWord;
@property (nonatomic, assign) BOOL allowAllActMsg;
@property (nonatomic, assign) double verifiedState;
@property (nonatomic, strong) NSString *dianping;
@property (nonatomic, strong) NSString *domain;
@property (nonatomic, strong) NSString *verifiedReasonModified;
@property (nonatomic, strong) NSString *unicomFreePc;
@property (nonatomic, strong) NSString *cardid;
@property (nonatomic, assign) BOOL allowAllComment;
@property (nonatomic, assign) double verifiedLevel;
@property (nonatomic, strong) NSString *verifiedReasonUrl;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, assign) double favouritesCount;
@property (nonatomic, strong) NSString *idstr;
@property (nonatomic, assign) double verifiedType;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *verifiedSource;
@property (nonatomic, assign) double userAbility;
@property (nonatomic, strong) NSString *lang;
@property (nonatomic, assign) double ptype;
@property (nonatomic, assign) BOOL following;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
