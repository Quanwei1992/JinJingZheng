//
//  Datalist.h
//
//  Created by   on 2016/10/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Datalist : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *carapplyarr;
@property (nonatomic, strong) NSString *userid;
@property (nonatomic, strong) NSString *licenseno;
@property (nonatomic, strong) NSString *carid;
@property (nonatomic, strong) NSString *applyflag;
@property (nonatomic, strong) NSString *applyid;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
