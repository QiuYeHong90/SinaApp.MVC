//
//  SinaAnnotations.m
//
//  Created by mac  on 16/5/18
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SinaAnnotations.h"


NSString *const kSinaAnnotationsClientMblogid = @"client_mblogid";
NSString *const kSinaAnnotationsShooting = @"shooting";
NSString *const kSinaAnnotationsMapiRequest = @"mapi_request";


@interface SinaAnnotations ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SinaAnnotations

@synthesize clientMblogid = _clientMblogid;
@synthesize shooting = _shooting;
@synthesize mapiRequest = _mapiRequest;


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
            self.clientMblogid = [self objectOrNilForKey:kSinaAnnotationsClientMblogid fromDictionary:dict];
            self.shooting = [[self objectOrNilForKey:kSinaAnnotationsShooting fromDictionary:dict] doubleValue];
            self.mapiRequest = [[self objectOrNilForKey:kSinaAnnotationsMapiRequest fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.clientMblogid forKey:kSinaAnnotationsClientMblogid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shooting] forKey:kSinaAnnotationsShooting];
    [mutableDict setValue:[NSNumber numberWithBool:self.mapiRequest] forKey:kSinaAnnotationsMapiRequest];

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

    self.clientMblogid = [aDecoder decodeObjectForKey:kSinaAnnotationsClientMblogid];
    self.shooting = [aDecoder decodeDoubleForKey:kSinaAnnotationsShooting];
    self.mapiRequest = [aDecoder decodeBoolForKey:kSinaAnnotationsMapiRequest];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_clientMblogid forKey:kSinaAnnotationsClientMblogid];
    [aCoder encodeDouble:_shooting forKey:kSinaAnnotationsShooting];
    [aCoder encodeBool:_mapiRequest forKey:kSinaAnnotationsMapiRequest];
}

- (id)copyWithZone:(NSZone *)zone
{
    SinaAnnotations *copy = [[SinaAnnotations alloc] init];
    
    if (copy) {

        copy.clientMblogid = [self.clientMblogid copyWithZone:zone];
        copy.shooting = self.shooting;
        copy.mapiRequest = self.mapiRequest;
    }
    
    return copy;
}


@end
