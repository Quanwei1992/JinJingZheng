//
//  CarListResult.m
//
//  Created by   on 2016/10/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CarListResult.h"
#import "Datalist.h"


NSString *const kCarListResultDatalist = @"datalist";
NSString *const kCarListResultRescode = @"rescode";
NSString *const kCarListResultResdes = @"resdes";


@interface CarListResult ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CarListResult

@synthesize datalist = _datalist;
@synthesize rescode = _rescode;
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
    NSObject *receivedDatalist = [dict objectForKey:kCarListResultDatalist];
    NSMutableArray *parsedDatalist = [NSMutableArray array];
    if ([receivedDatalist isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDatalist) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDatalist addObject:[Datalist modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDatalist isKindOfClass:[NSDictionary class]]) {
       [parsedDatalist addObject:[Datalist modelObjectWithDictionary:(NSDictionary *)receivedDatalist]];
    }

    self.datalist = [NSArray arrayWithArray:parsedDatalist];
            self.rescode = [self objectOrNilForKey:kCarListResultRescode fromDictionary:dict];
            self.resdes = [self objectOrNilForKey:kCarListResultResdes fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForDatalist = [NSMutableArray array];
    for (NSObject *subArrayObject in self.datalist) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDatalist addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDatalist addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDatalist] forKey:kCarListResultDatalist];
    [mutableDict setValue:self.rescode forKey:kCarListResultRescode];
    [mutableDict setValue:self.resdes forKey:kCarListResultResdes];

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

    self.datalist = [aDecoder decodeObjectForKey:kCarListResultDatalist];
    self.rescode = [aDecoder decodeObjectForKey:kCarListResultRescode];
    self.resdes = [aDecoder decodeObjectForKey:kCarListResultResdes];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_datalist forKey:kCarListResultDatalist];
    [aCoder encodeObject:_rescode forKey:kCarListResultRescode];
    [aCoder encodeObject:_resdes forKey:kCarListResultResdes];
}

- (id)copyWithZone:(NSZone *)zone
{
    CarListResult *copy = [[CarListResult alloc] init];
    
    if (copy) {

        copy.datalist = [self.datalist copyWithZone:zone];
        copy.rescode = [self.rescode copyWithZone:zone];
        copy.resdes = [self.resdes copyWithZone:zone];
    }
    
    return copy;
}


@end
