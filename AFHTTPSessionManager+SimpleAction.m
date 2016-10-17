//
//  AFHTTPSessionManager+SimpleAction.m
//  CCF
//
//  Created by WDY on 16/1/15.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import "AFHTTPSessionManager+SimpleAction.h"
#import "NSString+Extensions.h"

@implementation AFHTTPSessionManager(SimpleAction)


-(void)GETWithURL:(NSURL *)url requestCallback:(RequestCallback)callback{

    [self GET:[url absoluteString] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *orgHtml = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        NSString *html = [orgHtml replaceUnicode];
        callback(YES, html);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        callback(NO, @"网络异常");
    }];
}

-(void)POSTWithURL:(NSURL *)url parameters:(id)parameters requestCallback:(RequestCallback)callback{
    [self POST:[url absoluteString] parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *html = [[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding] replaceUnicode];
        callback(YES,html);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        callback(NO, @"网络异常");
    }];
}

-(void)POSTWithURL:(NSURL *)url parameters:(id)parameters constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>))block requestCallback:(RequestCallback)callback{

    
    [self POST:[url absoluteString] parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *html = [[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding] replaceUnicode];
        callback(YES, html);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"AFHTTPSessionManager+SimpleAction POSTWithURL  %@", error);
        callback(NO, @"网络异常");
    }];
}



-(void)GETWithURLString:(NSString *)url requestCallback:(RequestCallback)callback{
    NSURL * nsurl = [NSURL URLWithString:url];
    [self GETWithURL:nsurl requestCallback:callback];
}


-(void)POSTWithURLString:(NSString *)url parameters:(id)parameters constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>))block requestCallback:(RequestCallback)callback{
    NSURL * nsurl = [NSURL URLWithString:url];
    
    [self POSTWithURL:nsurl parameters:parameters constructingBodyWithBlock:block requestCallback:callback];
}


-(void)POSTWithURLString:(NSString *)url parameters:(id)parameters requestCallback:(RequestCallback)callback{
    NSURL * nsurl = [NSURL URLWithString:url];
    [self POSTWithURL:nsurl parameters:parameters requestCallback:callback];
}

-(void)POSTWithURLString:(NSString *)url parameters:(id)parameters jsonBody:(NSString *)jsonBody requestCallback:(RequestCallback)callback{
    
    
    [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [self.requestSerializer setQueryStringSerializationWithBlock:^NSString *(NSURLRequest *request, id parameters, NSError * __autoreleasing * error) {
        
//        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:error];
//        NSString *argString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return jsonBody;
    }];
    
    [self POSTWithURLString:url parameters:parameters requestCallback:callback];
    
    
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//
//    
//    NSMutableURLRequest * request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:url parameters:parameters error:nil];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [request setHTTPBody:[jsonBody dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//        NSString *html = [[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding] replaceUnicode];
//        callback(YES, html);
//    }];
}
@end
