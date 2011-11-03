//
//  myCameraLayer.m
//  mylib
//
//  Created by Wang Qiang and WUMUXIAN.
//  Copyright nanyang technological university 2011. All rights reserved.
//

#import "MyCameraLayer.h"
#import "AppDelegate.h"

@implementation MyCameraLayer


- (id) init
{
    if ((self=[super init])) {
        // init 
        picker = nil;
        popover = nil;
        source_type = 0;
    }
    return self;
}

- (void) process_image:(UIImage *) image
{
    
}

- (void) pickCameraPhoto
{
    if (picker) {
        [picker dismissModalViewControllerAnimated:NO];
        [picker.view removeFromSuperview];
        [picker release];
    }
    if (popover) {
        [popover dismissPopoverAnimated:NO];
        [popover release];
    }
    picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.wantsFullScreenLayout = YES;
    //[picker presentModalViewController:picker animated:YES];
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [delegate.viewController presentModalViewController:picker animated:YES];
    source_type = 1;
    [[CCDirector sharedDirector] pause];
    [[CCDirector sharedDirector] stopAnimation];
    [[[CCDirector sharedDirector] openGLView] addSubview:picker.view];
}

- (void) pickLibraryPhoto
{
    if (picker) {
        [picker dismissModalViewControllerAnimated:NO];
        [picker.view removeFromSuperview];
        [picker release];
    }
    if (popover) {
        [popover dismissPopoverAnimated:NO];
        [popover release];
    }
    picker = [[[UIImagePickerController alloc] init] retain];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.wantsFullScreenLayout = YES;
    
    popover = [[[UIPopoverController alloc] initWithContentViewController:picker] retain];
    [popover setDelegate:self];
    
    CGSize winsize = [[CCDirector sharedDirector] winSize];
    [popover setPopoverContentSize:CGSizeMake(320, winsize.height) animated:NO];
    
    CGRect r = CGRectMake(20,20,10,10);
    r.origin = [[CCDirector sharedDirector] convertToGL:r.origin];
    source_type = 2;
    [popover presentPopoverFromRect:r inView:[[CCDirector sharedDirector] openGLView] permittedArrowDirections:UIPopoverArrowDirectionDown animated:NO];
}

// delegate method for processing image got from camera or library
- (void)imagePickerController:(UIImagePickerController *)image_picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    // newImage is a UIImage do not try to use a UIImageView
    UIImage * newImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    // Dismiss UIImagePickerController and release it
    [image_picker dismissModalViewControllerAnimated:YES];
    [image_picker.view removeFromSuperview];
    [image_picker release];
    [self process_image:newImage];
    if (popover) {
        [popover dismissPopoverAnimated:YES];
        [popover release];
    }
    popover = nil;
    picker = nil;
    if (source_type == 1) {
        [[CCDirector sharedDirector] startAnimation];
        [[CCDirector sharedDirector] resume];
    }
    source_type = 0;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)image_picker
{
    [image_picker dismissModalViewControllerAnimated:YES];
    [image_picker.view removeFromSuperview];
    [image_picker release];
    picker = nil;
    if (popover) {
        [popover dismissPopoverAnimated:YES];
        [popover release];
        popover = nil;
    }
    if (source_type == 1) {
        [[CCDirector sharedDirector] startAnimation];
        [[CCDirector sharedDirector] resume];
    }
    source_type = 0;
}

//for Ipad UIPopoverController if there is a cancel when the user click outside the popover
- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    if (picker) {
        [picker dismissModalViewControllerAnimated:YES];
        [picker.view removeFromSuperview];
        [picker release];
        picker = nil;
    }
    [popoverController dismissPopoverAnimated:YES];
    [popoverController release];
    popover = nil;
    source_type = 0;
}

@end

