//
//  myCameraLayer.h
//  mylib
//
//  Created by Wang Qiang and WUMUXIAN.
//  Copyright nanyang technological university 2011. All rights reserved.
//

#import "cocos2d.h"

/// myCameraLayer
/// CCLayer implement UIImagePickerControllerDelegate and UIPopoverControllerDelegate.
/// inherite this class if you want to use camera or library image in your layer.
@interface MyCameraLayer : CCLayer <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPopoverControllerDelegate>
{
    int source_type; /// indicate the source type, camera or library
    UIImagePickerController *picker;  /// image picker
    UIPopoverController* popover;   /// popover dialog for image selection.
}

/// start camera, take a photo and process it.
- (void) pickCameraPhoto;

/// open an popover dialog to select a photo from photo library.
- (void) pickLibraryPhoto;

/// process the chosen image (image taken from camera or photo library.
/// MUST BE overridden according to your app requirement.
/// @param: UIImage *, target image. 
- (void) process_image:(UIImage *) image;

@end

