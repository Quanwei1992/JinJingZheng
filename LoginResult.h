//
//  LoginResult.h
//
//  Created by   on 2016/10/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LoginResult : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *userid;
@property (nonatomic, assign) id provincecode;
@property (nonatomic, strong) NSString *resdes;
@property (nonatomic, strong) NSString *citycode;
@property (nonatomic, strong) NSString *rescode;
@property (nonatomic, strong) NSString *ssid;
@property (nonatomic, strong) NSString *policeno;
@property (nonatomic, assign) id provincetiny;
@property (nonatomic, strong) NSString *userType;
@property (nonatomic, assign) id accesstoken;
@property (nonatomic, assign) id ssidcode;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
