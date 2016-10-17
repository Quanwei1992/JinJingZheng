//
//  MessageCodeResult.h
//
//  Created by   on 2016/10/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MessageCodeResult : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *rescode;
@property (nonatomic, strong) NSString *verification;
@property (nonatomic, strong) NSString *resdes;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
