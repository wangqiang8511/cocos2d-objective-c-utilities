//
//  MyGoogleMapView.m
//  mylib
//
//  Created by Wang Qiang.
//  Copyright nanyang technological university 2011. All rights reserved.
//

#import "MyGoogleMapView.h"

@implementation MyGoogleMapView

- (id) init
{
    if ((self=[super init])) {
        CGRect webFrame = [[UIScreen mainScreen] applicationFrame];
        webView = [[UIWebView alloc] initWithFrame:webFrame];
        webView.backgroundColor = [UIColor whiteColor];
        NSString *url = @"http://155.69.54.30:9000/test";
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        [webView loadRequest:request];
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame andUrl:(NSString *)url
{
    if ((self=[super init])) {
        webView = [[UIWebView alloc] initWithFrame:frame];
        webView.backgroundColor = [UIColor whiteColor];
        webView.delegate = self;
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        [webView loadRequest:request];
    }
    return self;
}

- (UIWebView *) getWebView
{
    return self->webView;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSString* errorString = [NSString stringWithFormat:
        @"<html><center><font size=+5 color='red'>An error occurred:<br>%@</font></center></html>",
        error.localizedDescription];
    [self->webView loadHTMLString:errorString baseURL:nil];
}

- (void) changeLocation:(CLLocationCoordinate2D) location
{
    NSString *jsCommand = [NSString stringWithFormat:@"changeLocation(%f, %f)", location.latitude, location.longitude];
    [webView stringByEvaluatingJavaScriptFromString:jsCommand];
}

- (void) dealloc
{
    [webView release];
    webView = nil;
    [super dealloc];
}

@end
