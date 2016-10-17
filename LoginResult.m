//
//  LoginResult.m
//
//  Created by   on 2016/10/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "LoginResult.h"


NSString *const kLoginResultUserid = @"userid";
NSString *const kLoginResultProvincecode = @"provincecode";
NSString *const kLoginResultResdes = @"resdes";
NSString *const kLoginResultCitycode = @"citycode";
NSString *const kLoginResultRescode = @"rescode";
NSString *const kLoginResultSsid = @"ssid";
NSString *const kLoginResultPoliceno = @"policeno";
NSString *const kLoginResultProvincetiny = @"provincetiny";
NSString *const kLoginResultUserType = @"userType";
NSString *const kLoginResultAccesstoken = @"accesstoken";
NSString *const kLoginResultSsidcode = @"ssidcode";


@interface LoginResult ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LoginResult

@synthesize userid = _userid;
@synthesize provincecode = _provincecode;
@synthesize resdes = _resdes;
@synthesize citycode = _citycode;
@synthesize rescode = _rescode;
@synthesize ssid = _ssid;
@synthesize policeno = _policeno;
@synthesize provincetiny = _provincetiny;
@synthesize userType = _userType;
@synthesize accesstoken = _accesstoken;
@synthesize ssidcode = _ssidcode;


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
            self.userid = [self objectOrNilForKey:kLoginResultUserid fromDictionary:dict];
            self.provincecode = [self objectOrNilForKey:kLoginResultProvincecode fromDictionary:dict];
            self.resdes = [self objectOrNilForKey:kLoginResultResdes fromDictionary:dict];
            self.citycode = [self objectOrNilForKey:kLoginResultCitycode fromDictionary:dict];
            self.rescode = [self objectOrNilForKey:kLoginResultRescode fromDictionary:dict];
            self.ssid = [self objectOrNilForKey:kLoginResultSsid fromDictionary:dict];
            self.policeno = [self objectOrNilForKey:kLoginResultPoliceno fromDictionary:dict];
            self.provincetiny = [self objectOrNilForKey:kLoginResultProvincetiny fromDictionary:dict];
            self.userType = [self objectOrNilForKey:kLoginResultUserType fromDictionary:dict];
            self.accesstoken = [self objectOrNilForKey:kLoginResultAccesstoken fromDictionary:dict];
            self.ssidcode = [self objectOrNilForKey:kLoginResultSsidcode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.userid forKey:kLoginResultUserid];
    [mutableDict setValue:self.provincecode forKey:kLoginResultProvincecode];
    [mutableDict setValue:self.resdes forKey:kLoginResultResdes];
    [mutableDict setValue:self.citycode forKey:kLoginResultCitycode];
    [mutableDict setValue:self.rescode forKey:kLoginResultRescode];
    [mutableDict setValue:self.ssid forKey:kLoginResultSsid];
    [mutableDict setValue:self.policeno forKey:kLoginResultPoliceno];
    [mutableDict setValue:self.provincetiny forKey:kLoginResultProvincetiny];
    [mutableDict setValue:self.userType forKey:kLoginResultUserType];
    [mutableDict setValue:self.accesstoken forKey:kLoginResultAccesstoken];
    [mutableDict setValue:self.ssidcode forKey:kLoginResultSsidcode];

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

    self.userid = [aDecoder decodeObjectForKey:kLoginResultUserid];
    self.provincecode = [aDecoder decodeObjectForKey:kLoginResultProvincecode];
    self.resdes = [aDecoder decodeObjectForKey:kLoginResultResdes];
    self.citycode = [aDecoder decodeObjectForKey:kLoginResultCitycode];
    self.rescode = [aDecoder decodeObjectForKey:kLoginResultRescode];
    self.ssid = [aDecoder decodeObjectForKey:kLoginResultSsid];
    self.policeno = [aDecoder decodeObjectForKey:kLoginResultPoliceno];
    self.provincetiny = [aDecoder decodeObjectForKey:kLoginResultProvincetiny];
    self.userType = [aDecoder decodeObjectForKey:kLoginResultUserType];
    self.accesstoken = [aDecoder decodeObjectForKey:kLoginResultAccesstoken];
    self.ssidcode = [aDecoder decodeObjectForKey:kLoginResultSsidcode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_userid forKey:kLoginResultUserid];
    [aCoder encodeObject:_provincecode forKey:kLoginResultProvincecode];
    [aCoder encodeObject:_resdes forKey:kLoginResultResdes];
    [aCoder encodeObject:_citycode forKey:kLoginResultCitycode];
    [aCoder encodeObject:_rescode forKey:kLoginResultRescode];
    [aCoder encodeObject:_ssid forKey:kLoginResultSsid];
    [aCoder encodeObject:_policeno forKey:kLoginResultPoliceno];
    [aCoder encodeObject:_provincetiny forKey:kLoginResultProvincetiny];
    [aCoder encodeObject:_userType forKey:kLoginResultUserType];
    [aCoder encodeObject:_accesstoken forKey:kLoginResultAccesstoken];
    [aCoder encodeObject:_ssidcode forKey:kLoginResultSsidcode];
}

- (id)copyWithZone:(NSZone *)zone
{
    LoginResult *copy = [[LoginResult alloc] init];
    
    if (copy) {

        copy.userid = [self.userid copyWithZone:zone];
        copy.provincecode = [self.provincecode copyWithZone:zone];
        copy.resdes = [self.resdes copyWithZone:zone];
        copy.citycode = [self.citycode copyWithZone:zone];
        copy.rescode = [self.rescode copyWithZone:zone];
        copy.ssid = [self.ssid copyWithZone:zone];
        copy.policeno = [self.policeno copyWithZone:zone];
        copy.provincetiny = [self.provincetiny copyWithZone:zone];
        copy.userType = [self.userType copyWithZone:zone];
        copy.accesstoken = [self.accesstoken copyWithZone:zone];
        copy.ssidcode = [self.ssidcode copyWithZone:zone];
    }
    
    return copy;
}


@end
