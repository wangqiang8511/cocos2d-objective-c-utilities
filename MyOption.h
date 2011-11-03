//
//  MyOption.h
//  mylib
//
//  Created by Wang Qiang.
//  Copyright nanyang technological university 2011. All rights reserved.
//

/// Singleton App Option class
/// Contains dictionary of app configurations.
@interface MyOption : NSObject
{
    NSDictionary *options;
}

@property (retain) NSDictionary *options;

+(NSDictionary *)options;

@end
