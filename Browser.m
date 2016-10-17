//
//  Browser.m
//  JinJingZheng
//
//  Created by 迪远 王 on 2016/10/16.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import "Browser.h"

#import <AFNetworking.h>
#import "AFHTTPSessionManager+SimpleAction.h"
#import "MessageCodeResult.h"
#import "LoginResult.h"
#import "UIDevice+FCUUID.h"



@implementation Browser{
    AFHTTPSessionManager * browser;
}

-(id)init{
    
    if (self = [super init]) {
        browser = [AFHTTPSessionManager manager];
        browser.responseSerializer = [AFHTTPResponseSerializer serializer];
        browser.responseSerializer.acceptableContentTypes = [browser.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    }
    
    return self;
}

-(void)requestMessageCode:(NSString *)phoneNumber withHandler:(AsyncResponseHandler)handler{
    
    NSMutableDictionary * parameters = [NSMutableDictionary dictionary];
    // Header
    [parameters setValue:@"application/json" forKey:@"Content-Type"];
    [parameters setValue:@"application/json" forKey:@"Accept"];
    [parameters setValue:@"BeiJingJiaoJing/1.0.9 (iPhone; iOS 9.0.2; Scale/2.00)" forKey:@"User-Agent"];
    [parameters setValue:@"gzip, deflate" forKey:@"Accept-Encoding"];
    [parameters setValue:@"zh-Hans-CN;q=1, en-CN;q=0.9" forKey:@"Accept-Language"];

    NSString * jsonBody = [NSString stringWithFormat:@"{\"phone\":\"%@\",\"regist\":\"1\"}", phoneNumber];

    [browser POSTWithURLString:@"https://bjjj.zhongchebaolian.com/common_api/mobile/standard/verification" parameters:parameters jsonBody:jsonBody requestCallback:^(BOOL isSuccess, NSString *html) {
        
        NSError *error = nil;
        NSDictionary *string2dic = [NSJSONSerialization JSONObjectWithData: [html dataUsingEncoding:NSUTF8StringEncoding]
                                                                   options: NSJSONReadingMutableContainers
                                                                     error: &error];
        
        MessageCodeResult * result = [[MessageCodeResult alloc] initWithDictionary:string2dic];
        
        NSString * rescode = [result valueForKey:@"rescode"];

        NSLog(@">>> %@", result);
    }];
}


-(NSString*)dataTojsonString:(id)object{
    NSString *jsonString = nil;
    NSError *error;
    // Pass 0 if you don't care about the readability of the generated string NSJSONWritingPrettyPrinted
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:0 error:&error];
    if (! jsonData) {
        NSLog(@"dataTojsonString error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

-(void)login:(NSString *)phoneNumber andMessageCode:(NSString *)code withHandler:(AsyncResponseHandler)handler{
    NSMutableDictionary * parameters = [NSMutableDictionary dictionary];
    // Header
    [parameters setValue:@"application/json" forKey:@"Content-Type"];
    [parameters setValue:@"application/json" forKey:@"Accept"];
    [parameters setValue:@"BeiJingJiaoJing/1.0.9 (iPhone; iOS 9.0.2; Scale/2.00)" forKey:@"User-Agent"];
    [parameters setValue:@"gzip, deflate" forKey:@"Accept-Encoding"];
    [parameters setValue:@"zh-Hans-CN;q=1, en-CN;q=0.9" forKey:@"Accept-Language"];
    
    
    NSString * deviceid = [[UIDevice currentDevice] uuid];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    
    NSDictionary * body = @{
                            @"devicetype"   :   @"0",
                            @"lon"          :   @"",
                            @"phone"        :   phoneNumber,
                            @"timestamp"    :   currentDateStr,
                            @"source"       :   @"0",
                            @"lat"          :   @"",
                            @"token"        :   @"101d85590947311339f",
                            @"deviceid"     :   deviceid,
                            @"citycode"     :   @"1101",
                            @"appkey"       :   @"0791682354",
                            @"valicode"     :   code,
                            @"vertype"      :   @"1"
                            };
    
    NSString * jsonBody = [self dataTojsonString:body];
    
    [browser POSTWithURLString:@"https://api.accident.zhongchebaolian.com/industryguild_mobile_standard_self2.1.2/mobile/standard/login" parameters:parameters jsonBody:jsonBody requestCallback:^(BOOL isSuccess, NSString *html) {
        
        NSError *error = nil;
        NSDictionary *string2dic = [NSJSONSerialization JSONObjectWithData: [html dataUsingEncoding:NSUTF8StringEncoding]
                                                                   options: NSJSONReadingMutableContainers
                                                                     error: &error];
        LoginResult * result = [[LoginResult alloc] initWithDictionary:string2dic];
        
        //{"citycode":"","policeno":"","ssid":"MBSXZ06043979174521514069026","provincetiny":null,"accesstoken":null,"provincecode":null,"userid":"d33b849efa164c74964937761028cc20","userType":"1","ssidcode":null,"rescode":"200","resdes":"登陆成功"}
        
        NSLog(@">>> %@", html);
    }];

}

@end
