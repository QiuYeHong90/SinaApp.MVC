//
//  SinaBaseClass.m
//
//  Created by mac  on 16/5/18
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SinaBaseClass.h"
#import "SinaStatuses.h"


NSString *const kSinaBaseClassAd = @"ad";
NSString *const kSinaBaseClassHasvisible = @"hasvisible";
NSString *const kSinaBaseClassHasUnread = @"has_unread";
NSString *const kSinaBaseClassAdvertises = @"advertises";
NSString *const kSinaBaseClassPreviousCursor = @"previous_cursor";
NSString *const kSinaBaseClassUveBlank = @"uve_blank";
NSString *const kSinaBaseClassTotalNumber = @"total_number";
NSString *const kSinaBaseClassInterval = @"interval";
NSString *const kSinaBaseClassMaxId = @"max_id";
NSString *const kSinaBaseClassStatuses = @"statuses";
NSString *const kSinaBaseClassNextCursor = @"next_cursor";
NSString *const kSinaBaseClassSinceId = @"since_id";


@interface SinaBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SinaBaseClass

@synthesize ad = _ad;
@synthesize hasvisible = _hasvisible;
@synthesize hasUnread = _hasUnread;
@synthesize advertises = _advertises;
@synthesize previousCursor = _previousCursor;
@synthesize uveBlank = _uveBlank;
@synthesize totalNumber = _totalNumber;
@synthesize interval = _interval;
@synthesize maxId = _maxId;
@synthesize statuses = _statuses;
@synthesize nextCursor = _nextCursor;
@synthesize sinceId = _sinceId;


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
            self.ad = [self objectOrNilForKey:kSinaBaseClassAd fromDictionary:dict];
            self.hasvisible = [[self objectOrNilForKey:kSinaBaseClassHasvisible fromDictionary:dict] boolValue];
            self.hasUnread = [[self objectOrNilForKey:kSinaBaseClassHasUnread fromDictionary:dict] doubleValue];
            self.advertises = [self objectOrNilForKey:kSinaBaseClassAdvertises fromDictionary:dict];
            self.previousCursor = [[self objectOrNilForKey:kSinaBaseClassPreviousCursor fromDictionary:dict] doubleValue];
            self.uveBlank = [[self objectOrNilForKey:kSinaBaseClassUveBlank fromDictionary:dict] doubleValue];
            self.totalNumber = [[self objectOrNilForKey:kSinaBaseClassTotalNumber fromDictionary:dict] doubleValue];
            self.interval = [[self objectOrNilForKey:kSinaBaseClassInterval fromDictionary:dict] doubleValue];
            self.maxId = [[self objectOrNilForKey:kSinaBaseClassMaxId fromDictionary:dict] doubleValue];
    NSObject *receivedSinaStatuses = [dict objectForKey:kSinaBaseClassStatuses];
    NSMutableArray *parsedSinaStatuses = [NSMutableArray array];
    if ([receivedSinaStatuses isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSinaStatuses) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSinaStatuses addObject:[SinaStatuses modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSinaStatuses isKindOfClass:[NSDictionary class]]) {
       [parsedSinaStatuses addObject:[SinaStatuses modelObjectWithDictionary:(NSDictionary *)receivedSinaStatuses]];
    }

    self.statuses = [NSArray arrayWithArray:parsedSinaStatuses];
            self.nextCursor = [[self objectOrNilForKey:kSinaBaseClassNextCursor fromDictionary:dict] doubleValue];
            self.sinceId = [[self objectOrNilForKey:kSinaBaseClassSinceId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForAd = [NSMutableArray array];
    for (NSObject *subArrayObject in self.ad) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAd addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAd addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAd] forKey:kSinaBaseClassAd];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasvisible] forKey:kSinaBaseClassHasvisible];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasUnread] forKey:kSinaBaseClassHasUnread];
    NSMutableArray *tempArrayForAdvertises = [NSMutableArray array];
    for (NSObject *subArrayObject in self.advertises) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAdvertises addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAdvertises addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAdvertises] forKey:kSinaBaseClassAdvertises];
    [mutableDict setValue:[NSNumber numberWithDouble:self.previousCursor] forKey:kSinaBaseClassPreviousCursor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uveBlank] forKey:kSinaBaseClassUveBlank];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalNumber] forKey:kSinaBaseClassTotalNumber];
    [mutableDict setValue:[NSNumber numberWithDouble:self.interval] forKey:kSinaBaseClassInterval];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maxId] forKey:kSinaBaseClassMaxId];
    NSMutableArray *tempArrayForStatuses = [NSMutableArray array];
    for (NSObject *subArrayObject in self.statuses) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForStatuses addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForStatuses addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForStatuses] forKey:kSinaBaseClassStatuses];
    [mutableDict setValue:[NSNumber numberWithDouble:self.nextCursor] forKey:kSinaBaseClassNextCursor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sinceId] forKey:kSinaBaseClassSinceId];

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

    self.ad = [aDecoder decodeObjectForKey:kSinaBaseClassAd];
    self.hasvisible = [aDecoder decodeBoolForKey:kSinaBaseClassHasvisible];
    self.hasUnread = [aDecoder decodeDoubleForKey:kSinaBaseClassHasUnread];
    self.advertises = [aDecoder decodeObjectForKey:kSinaBaseClassAdvertises];
    self.previousCursor = [aDecoder decodeDoubleForKey:kSinaBaseClassPreviousCursor];
    self.uveBlank = [aDecoder decodeDoubleForKey:kSinaBaseClassUveBlank];
    self.totalNumber = [aDecoder decodeDoubleForKey:kSinaBaseClassTotalNumber];
    self.interval = [aDecoder decodeDoubleForKey:kSinaBaseClassInterval];
    self.maxId = [aDecoder decodeDoubleForKey:kSinaBaseClassMaxId];
    self.statuses = [aDecoder decodeObjectForKey:kSinaBaseClassStatuses];
    self.nextCursor = [aDecoder decodeDoubleForKey:kSinaBaseClassNextCursor];
    self.sinceId = [aDecoder decodeDoubleForKey:kSinaBaseClassSinceId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_ad forKey:kSinaBaseClassAd];
    [aCoder encodeBool:_hasvisible forKey:kSinaBaseClassHasvisible];
    [aCoder encodeDouble:_hasUnread forKey:kSinaBaseClassHasUnread];
    [aCoder encodeObject:_advertises forKey:kSinaBaseClassAdvertises];
    [aCoder encodeDouble:_previousCursor forKey:kSinaBaseClassPreviousCursor];
    [aCoder encodeDouble:_uveBlank forKey:kSinaBaseClassUveBlank];
    [aCoder encodeDouble:_totalNumber forKey:kSinaBaseClassTotalNumber];
    [aCoder encodeDouble:_interval forKey:kSinaBaseClassInterval];
    [aCoder encodeDouble:_maxId forKey:kSinaBaseClassMaxId];
    [aCoder encodeObject:_statuses forKey:kSinaBaseClassStatuses];
    [aCoder encodeDouble:_nextCursor forKey:kSinaBaseClassNextCursor];
    [aCoder encodeDouble:_sinceId forKey:kSinaBaseClassSinceId];
}

- (id)copyWithZone:(NSZone *)zone
{
    SinaBaseClass *copy = [[SinaBaseClass alloc] init];
    
    if (copy) {

        copy.ad = [self.ad copyWithZone:zone];
        copy.hasvisible = self.hasvisible;
        copy.hasUnread = self.hasUnread;
        copy.advertises = [self.advertises copyWithZone:zone];
        copy.previousCursor = self.previousCursor;
        copy.uveBlank = self.uveBlank;
        copy.totalNumber = self.totalNumber;
        copy.interval = self.interval;
        copy.maxId = self.maxId;
        copy.statuses = [self.statuses copyWithZone:zone];
        copy.nextCursor = self.nextCursor;
        copy.sinceId = self.sinceId;
    }
    
    return copy;
}


@end
