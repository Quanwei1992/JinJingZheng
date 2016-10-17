//
//  Datalist.m
//
//  Created by   on 2016/10/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Datalist.h"
#import "Carapplyarr.h"


NSString *const kDatalistCarapplyarr = @"carapplyarr";
NSString *const kDatalistUserid = @"userid";
NSString *const kDatalistLicenseno = @"licenseno";
NSString *const kDatalistCarid = @"carid";
NSString *const kDatalistApplyflag = @"applyflag";
NSString *const kDatalistApplyid = @"applyid";


@interface Datalist ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Datalist

@synthesize carapplyarr = _carapplyarr;
@synthesize userid = _userid;
@synthesize licenseno = _licenseno;
@synthesize carid = _carid;
@synthesize applyflag = _applyflag;
@synthesize applyid = _applyid;


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
    NSObject *receivedCarapplyarr = [dict objectForKey:kDatalistCarapplyarr];
    NSMutableArray *parsedCarapplyarr = [NSMutableArray array];
    if ([receivedCarapplyarr isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCarapplyarr) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCarapplyarr addObject:[Carapplyarr modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCarapplyarr isKindOfClass:[NSDictionary class]]) {
       [parsedCarapplyarr addObject:[Carapplyarr modelObjectWithDictionary:(NSDictionary *)receivedCarapplyarr]];
    }

    self.carapplyarr = [NSArray arrayWithArray:parsedCarapplyarr];
            self.userid = [self objectOrNilForKey:kDatalistUserid fromDictionary:dict];
            self.licenseno = [self objectOrNilForKey:kDatalistLicenseno fromDictionary:dict];
            self.carid = [self objectOrNilForKey:kDatalistCarid fromDictionary:dict];
            self.applyflag = [self objectOrNilForKey:kDatalistApplyflag fromDictionary:dict];
            self.applyid = [self objectOrNilForKey:kDatalistApplyid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForCarapplyarr = [NSMutableArray array];
    for (NSObject *subArrayObject in self.carapplyarr) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCarapplyarr addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCarapplyarr addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCarapplyarr] forKey:kDatalistCarapplyarr];
    [mutableDict setValue:self.userid forKey:kDatalistUserid];
    [mutableDict setValue:self.licenseno forKey:kDatalistLicenseno];
    [mutableDict setValue:self.carid forKey:kDatalistCarid];
    [mutableDict setValue:self.applyflag forKey:kDatalistApplyflag];
    [mutableDict setValue:self.applyid forKey:kDatalistApplyid];

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

    self.carapplyarr = [aDecoder decodeObjectForKey:kDatalistCarapplyarr];
    self.userid = [aDecoder decodeObjectForKey:kDatalistUserid];
    self.licenseno = [aDecoder decodeObjectForKey:kDatalistLicenseno];
    self.carid = [aDecoder decodeObjectForKey:kDatalistCarid];
    self.applyflag = [aDecoder decodeObjectForKey:kDatalistApplyflag];
    self.applyid = [aDecoder decodeObjectForKey:kDatalistApplyid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_carapplyarr forKey:kDatalistCarapplyarr];
    [aCoder encodeObject:_userid forKey:kDatalistUserid];
    [aCoder encodeObject:_licenseno forKey:kDatalistLicenseno];
    [aCoder encodeObject:_carid forKey:kDatalistCarid];
    [aCoder encodeObject:_applyflag forKey:kDatalistApplyflag];
    [aCoder encodeObject:_applyid forKey:kDatalistApplyid];
}

- (id)copyWithZone:(NSZone *)zone
{
    Datalist *copy = [[Datalist alloc] init];
    
    if (copy) {

        copy.carapplyarr = [self.carapplyarr copyWithZone:zone];
        copy.userid = [self.userid copyWithZone:zone];
        copy.licenseno = [self.licenseno copyWithZone:zone];
        copy.carid = [self.carid copyWithZone:zone];
        copy.applyflag = [self.applyflag copyWithZone:zone];
        copy.applyid = [self.applyid copyWithZone:zone];
    }
    
    return copy;
}


@end
