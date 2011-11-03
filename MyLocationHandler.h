//
//  MyLocationHandler.h
//  mylib
//
//  Created by Wang Qiang.
//  Copyright nanyang technological university 2011. All rights reserved.
//
#import <CoreLocation/CoreLocation.h>
/// MyLocationHandler
/// class for process location information.
/// usage:
/// CLLocationCoordinate2D location = [MyLocationHandler get_current_location];
@interface MyLocationHandler : NSObject <CLLocationManagerDelegate>
{
}

/// Get current location.
/// @return: CLLocationCoordinate2D *, latitude, longitude of current location. 
+ (CLLocationCoordinate2D) get_current_location;

@end
