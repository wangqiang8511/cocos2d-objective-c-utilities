//
//  MyHTTPRequest.m
//  mylib
//
//  Created by Wang Qiang.
//  Copyright nanyang technological university 2011. All rights reserved.
//

#import "MyHTTPRequest.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SBJson.h"

@implementation MyHTTPRequest

+ (NSData *) get_data_from_url:(NSString *)url
{
    NSURL *targetUrl = [NSURL URLWithString:url];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:targetUrl];
    [request startSynchronous];
    NSError *error = [request error];
    if (!error) {
        NSData *response = [request responseData];
        return response;
    }
    return nil;
}

+ (NSString *) get_string_from_url:(NSString *)url
{
    NSURL *targetUrl = [NSURL URLWithString:url];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:targetUrl];
    [request startSynchronous];
    NSError *error = [request error];
    if (!error) {
        NSString *response = [request responseString];
        return response;
    }
    return nil;
}

+ (NSDictionary *) get_json_from_url:(NSString *)url
{
    NSString * response = [MyHTTPRequest get_string_from_url:url];
    SBJsonParser * myparser = [[SBJsonParser alloc] init];         
    if (response) {
        NSDictionary* json_dict = [myparser objectWithString:response error:nil];
        [SBJsonParser release];
        return json_dict;
    }
    return nil;
}

+ (NSData *) get_image_from_url:(NSString *)url
{
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: url]];
    return imageData;
}

+ (NSString *) post_data:(NSDictionary *)data toUrl:(NSString *)url
{
    NSURL *targetUrl = [NSURL URLWithString:url];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:targetUrl];
    for (id key in data) {
        [request addPostValue:[data objectForKey:key] forKey:key];
    }
    [request startSynchronous];
    NSError *error = [request error];
    if (!error) {
        NSString * response = [request responseString];
        return response;
    }
    return nil;
}

+ (NSString *) post_data:(NSDictionary *)data andFile:(NSDictionary *)file toUrl:(NSString *)url
{
    NSURL *targetUrl = [NSURL URLWithString:url];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:targetUrl];
    for (id key in data) {
        [request addPostValue:[data objectForKey:key] forKey:key];
    }
    for (id fkey in file) {
        [request setFile:[file objectForKey:fkey] forKey:fkey];
    }
    [request startSynchronous];
    NSError *error = [request error];
    if (!error) {
        NSString * response = [request responseString];
        return response;
    }
    return nil;
}
@end
