//
//  MessageCodeResult.m
//
//  Created by   on 2016/10/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MessageCodeResult.h"


NSString *const kMessageCodeResultRescode = @"rescode";
NSString *const kMessageCodeResultVerification = @"verification";
NSString *const kMessageCodeResultResdes = @"resdes";


@interface MessageCodeResult ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MessageCodeResult

@synthesize rescode = _rescode;
@synthesize verification = _verification;
@synthesize resdes = _resdes;


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
            self.rescode = [self objectOrNilForKey:kMessageCodeResultRescode fromDictionary:dict];
            self.verification = [self objectOrNilForKey:kMessageCodeResultVerification fromDictionary:dict];
            self.resdes = [self objectOrNilForKey:kMessageCodeResultResdes fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.rescode forKey:kMessageCodeResultRescode];
    [mutableDict setValue:self.verification forKey:kMessageCodeResultVerification];
    [mutableDict setValue:self.resdes forKey:kMessageCodeResultResdes];

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

    self.rescode = [aDecoder decodeObjectForKey:kMessageCodeResultRescode];
    self.verification = [aDecoder decodeObjectForKey:kMessageCodeResultVerification];
    self.resdes = [aDecoder decodeObjectForKey:kMessageCodeResultResdes];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_rescode forKey:kMessageCodeResultRescode];
    [aCoder encodeObject:_verification forKey:kMessageCodeResultVerification];
    [aCoder encodeObject:_resdes forKey:kMessageCodeResultResdes];
}

- (id)copyWithZone:(NSZone *)zone
{
    MessageCodeResult *copy = [[MessageCodeResult alloc] init];
    
    if (copy) {

        copy.rescode = [self.rescode copyWithZone:zone];
        copy.verification = [self.verification copyWithZone:zone];
        copy.resdes = [self.resdes copyWithZone:zone];
    }
    
    return copy;
}


@end
