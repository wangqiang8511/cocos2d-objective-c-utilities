//
//  MyLocationHandler.m
//  mylib
//
//  Created by Wang Qiang.
//  Copyright nanyang technological university 2011. All rights reserved.
//
#import "MyLocationHandler.h"

@implementation MyLocationHandler
+ (CLLocationCoordinate2D) get_current_location
{
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    [locationManager startUpdatingLocation];
    CLLocation* currentlocation = locationManager.location;
    [locationManager release];
    return currentlocation.coordinate;
}
@end
