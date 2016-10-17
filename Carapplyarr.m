//
//  Carapplyarr.m
//
//  Created by   on 2016/10/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Carapplyarr.h"


NSString *const kCarapplyarrCarid = @"carid";
NSString *const kCarapplyarrUserid = @"userid";
NSString *const kCarapplyarrSyscode = @"syscode";
NSString *const kCarapplyarrEnterbjstart = @"enterbjstart";
NSString *const kCarapplyarrExistpaper = @"existpaper";
NSString *const kCarapplyarrCartype = @"cartype";
NSString *const kCarapplyarrRemark = @"remark";
NSString *const kCarapplyarrApplyid = @"applyid";
NSString *const kCarapplyarrLoadpapermethod = @"loadpapermethod";
NSString *const kCarapplyarrLicenseno = @"licenseno";
NSString *const kCarapplyarrEngineno = @"engineno";
NSString *const kCarapplyarrSyscodedesc = @"syscodedesc";
NSString *const kCarapplyarrStatus = @"status";
NSString *const kCarapplyarrEnterbjend = @"enterbjend";


@interface Carapplyarr ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Carapplyarr

@synthesize carid = _carid;
@synthesize userid = _userid;
@synthesize syscode = _syscode;
@synthesize enterbjstart = _enterbjstart;
@synthesize existpaper = _existpaper;
@synthesize cartype = _cartype;
@synthesize remark = _remark;
@synthesize applyid = _applyid;
@synthesize loadpapermethod = _loadpapermethod;
@synthesize licenseno = _licenseno;
@synthesize engineno = _engineno;
@synthesize syscodedesc = _syscodedesc;
@synthesize status = _status;
@synthesize enterbjend = _enterbjend;


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
            self.carid = [self objectOrNilForKey:kCarapplyarrCarid fromDictionary:dict];
            self.userid = [self objectOrNilForKey:kCarapplyarrUserid fromDictionary:dict];
            self.syscode = [self objectOrNilForKey:kCarapplyarrSyscode fromDictionary:dict];
            self.enterbjstart = [self objectOrNilForKey:kCarapplyarrEnterbjstart fromDictionary:dict];
            self.existpaper = [self objectOrNilForKey:kCarapplyarrExistpaper fromDictionary:dict];
            self.cartype = [self objectOrNilForKey:kCarapplyarrCartype fromDictionary:dict];
            self.remark = [self objectOrNilForKey:kCarapplyarrRemark fromDictionary:dict];
            self.applyid = [self objectOrNilForKey:kCarapplyarrApplyid fromDictionary:dict];
            self.loadpapermethod = [self objectOrNilForKey:kCarapplyarrLoadpapermethod fromDictionary:dict];
            self.licenseno = [self objectOrNilForKey:kCarapplyarrLicenseno fromDictionary:dict];
            self.engineno = [self objectOrNilForKey:kCarapplyarrEngineno fromDictionary:dict];
            self.syscodedesc = [self objectOrNilForKey:kCarapplyarrSyscodedesc fromDictionary:dict];
            self.status = [self objectOrNilForKey:kCarapplyarrStatus fromDictionary:dict];
            self.enterbjend = [self objectOrNilForKey:kCarapplyarrEnterbjend fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.carid forKey:kCarapplyarrCarid];
    [mutableDict setValue:self.userid forKey:kCarapplyarrUserid];
    [mutableDict setValue:self.syscode forKey:kCarapplyarrSyscode];
    [mutableDict setValue:self.enterbjstart forKey:kCarapplyarrEnterbjstart];
    [mutableDict setValue:self.existpaper forKey:kCarapplyarrExistpaper];
    [mutableDict setValue:self.cartype forKey:kCarapplyarrCartype];
    [mutableDict setValue:self.remark forKey:kCarapplyarrRemark];
    [mutableDict setValue:self.applyid forKey:kCarapplyarrApplyid];
    [mutableDict setValue:self.loadpapermethod forKey:kCarapplyarrLoadpapermethod];
    [mutableDict setValue:self.licenseno forKey:kCarapplyarrLicenseno];
    [mutableDict setValue:self.engineno forKey:kCarapplyarrEngineno];
    [mutableDict setValue:self.syscodedesc forKey:kCarapplyarrSyscodedesc];
    [mutableDict setValue:self.status forKey:kCarapplyarrStatus];
    [mutableDict setValue:self.enterbjend forKey:kCarapplyarrEnterbjend];

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

    self.carid = [aDecoder decodeObjectForKey:kCarapplyarrCarid];
    self.userid = [aDecoder decodeObjectForKey:kCarapplyarrUserid];
    self.syscode = [aDecoder decodeObjectForKey:kCarapplyarrSyscode];
    self.enterbjstart = [aDecoder decodeObjectForKey:kCarapplyarrEnterbjstart];
    self.existpaper = [aDecoder decodeObjectForKey:kCarapplyarrExistpaper];
    self.cartype = [aDecoder decodeObjectForKey:kCarapplyarrCartype];
    self.remark = [aDecoder decodeObjectForKey:kCarapplyarrRemark];
    self.applyid = [aDecoder decodeObjectForKey:kCarapplyarrApplyid];
    self.loadpapermethod = [aDecoder decodeObjectForKey:kCarapplyarrLoadpapermethod];
    self.licenseno = [aDecoder decodeObjectForKey:kCarapplyarrLicenseno];
    self.engineno = [aDecoder decodeObjectForKey:kCarapplyarrEngineno];
    self.syscodedesc = [aDecoder decodeObjectForKey:kCarapplyarrSyscodedesc];
    self.status = [aDecoder decodeObjectForKey:kCarapplyarrStatus];
    self.enterbjend = [aDecoder decodeObjectForKey:kCarapplyarrEnterbjend];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_carid forKey:kCarapplyarrCarid];
    [aCoder encodeObject:_userid forKey:kCarapplyarrUserid];
    [aCoder encodeObject:_syscode forKey:kCarapplyarrSyscode];
    [aCoder encodeObject:_enterbjstart forKey:kCarapplyarrEnterbjstart];
    [aCoder encodeObject:_existpaper forKey:kCarapplyarrExistpaper];
    [aCoder encodeObject:_cartype forKey:kCarapplyarrCartype];
    [aCoder encodeObject:_remark forKey:kCarapplyarrRemark];
    [aCoder encodeObject:_applyid forKey:kCarapplyarrApplyid];
    [aCoder encodeObject:_loadpapermethod forKey:kCarapplyarrLoadpapermethod];
    [aCoder encodeObject:_licenseno forKey:kCarapplyarrLicenseno];
    [aCoder encodeObject:_engineno forKey:kCarapplyarrEngineno];
    [aCoder encodeObject:_syscodedesc forKey:kCarapplyarrSyscodedesc];
    [aCoder encodeObject:_status forKey:kCarapplyarrStatus];
    [aCoder encodeObject:_enterbjend forKey:kCarapplyarrEnterbjend];
}

- (id)copyWithZone:(NSZone *)zone
{
    Carapplyarr *copy = [[Carapplyarr alloc] init];
    
    if (copy) {

        copy.carid = [self.carid copyWithZone:zone];
        copy.userid = [self.userid copyWithZone:zone];
        copy.syscode = [self.syscode copyWithZone:zone];
        copy.enterbjstart = [self.enterbjstart copyWithZone:zone];
        copy.existpaper = [self.existpaper copyWithZone:zone];
        copy.cartype = [self.cartype copyWithZone:zone];
        copy.remark = [self.remark copyWithZone:zone];
        copy.applyid = [self.applyid copyWithZone:zone];
        copy.loadpapermethod = [self.loadpapermethod copyWithZone:zone];
        copy.licenseno = [self.licenseno copyWithZone:zone];
        copy.engineno = [self.engineno copyWithZone:zone];
        copy.syscodedesc = [self.syscodedesc copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.enterbjend = [self.enterbjend copyWithZone:zone];
    }
    
    return copy;
}


@end
