//
//  MyGoogleMapView.h
//  mylib
//
//  Created by Wang Qiang.
//  Copyright nanyang technological university 2011. All rights reserved.
//
#import <CoreLocation/CoreLocation.h>

/// View for google map api 
/// Render a UIWebView which connect a google map api service.
/// Usage:
/// // init the view with proper size and correct url
/// CGRect webFrame = [[UIScreen mainScreen] applicationFrame];
/// NSString *url = @"http://155.69.54.30:9000/test";
/// googleView = [[MyGoogleMapView alloc]initWithFrame:webFrame andUrl:url];
/// wrapper = [CCUIViewWrapper wrapperForUIView:[googleView getWebView]];
/// [self addChild:wrapper];
/// // Change the location
/// CLLocationCoordinate2D chengdu;
/// chengdu.latitude = 30.67;
/// chengdu.longitude = 104.06;
/// [googleView changeLocation:chengdu];
@interface MyGoogleMapView : NSObject <UIWebViewDelegate>
{
    UIWebView *webView;
}

/// constructor.
/// @param frame: CGRect, UIWebView size. 
/// @param url: NSString *, url string, should contain a google map apis. 
/// @return: MyGoogleMapView instance. 
- (id) initWithFrame:(CGRect)frame andUrl:(NSString *)url;

/// get the UIWebView view.
/// @return: UIWebView *, the real UIWebView. 
- (UIWebView *) getWebView;

/// change the location.
/// @param: CLLocationCoordinate2D, location struct. 
- (void) changeLocation:(CLLocationCoordinate2D) location;

@end
