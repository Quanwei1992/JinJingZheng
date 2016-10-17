//
//  Browser.h
//  JinJingZheng
//
//  Created by 迪远 王 on 2016/10/16.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Browser : NSObject

typedef void (^AsyncResponseHandler) (BOOL isSuccess, id data);

- (void) requestMessageCode:(NSString *) phoneNumber withHandler:(AsyncResponseHandler) handler;

- (void) login:(NSString *) phoneNumber andMessageCode:(NSString *)code withHandler:(AsyncResponseHandler) handler;

@end
