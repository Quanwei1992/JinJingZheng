//
//  Carapplyarr.h
//
//  Created by   on 2016/10/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Carapplyarr : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *carid;
@property (nonatomic, strong) NSString *userid;
@property (nonatomic, strong) NSString *syscode;
@property (nonatomic, strong) NSString *enterbjstart;
@property (nonatomic, strong) NSString *existpaper;
@property (nonatomic, strong) NSString *cartype;
@property (nonatomic, strong) NSString *remark;
@property (nonatomic, strong) NSString *applyid;
@property (nonatomic, strong) NSString *loadpapermethod;
@property (nonatomic, strong) NSString *licenseno;
@property (nonatomic, strong) NSString *engineno;
@property (nonatomic, strong) NSString *syscodedesc;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *enterbjend;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
