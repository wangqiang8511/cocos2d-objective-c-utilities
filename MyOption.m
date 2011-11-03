//
//  MyOption.m
//  mylib
//
//  Created by Wang Qiang.
//  Copyright nanyang technological university 2011. All rights reserved.
//

#import "MyOption.h"
#import "MyFileHandler.h"
#import "SBJson.h"


@implementation MyOption
@synthesize options;

- (id) init
{
    if ((self=[super init])) {
        SBJsonParser * myparser = [[SBJsonParser alloc] init];         
        NSString* confstr = [MyFileHandler data_to_string:[MyFileHandler read_from_file_in_resource:@"AppConfig.json"]];
        options = [myparser objectWithString:confstr error:nil];
        [myparser release];
    }
    return self;
}

+ (NSDictionary *)options
{
    static dispatch_once_t pred = 0;
    __strong static MyOption * _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init]; // or some other init method
    });
    return _sharedObject.options;
}

- (void) dealloc
{
    [options release];
    options = nil;
    [super dealloc];
}
@end
