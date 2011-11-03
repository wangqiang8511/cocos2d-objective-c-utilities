//
//  MyFileHandler.h
//
//  Created by Wang Qiang and WUMUXIAN.
//  Copyright nanyang technological university 2011. All rights reserved.
//

/// MyFileHandler 
/// Handling file more easier.
/// + (NSString *)get_current_dir;
/// + (NSString *)get_abs_path:(NSString *) relpath;
/// + (NSString *)get_app_dir;
/// + (NSString *)get_abs_app_path:(NSString *) relpath;
/// + (BOOL) write_to_file:(NSString *)file with:(NSData *)data;
/// + (BOOL) write_str_to_file:(NSString *)file with:(NSString *)str;
/// + (NSData *) read_from_file:(NSString *)file;
/// + (NSData *) read_from_file_in_resource:(NSString *)file;
/// + (NSString *) read_str_from_file:(NSString *)file;
/// + (BOOL) exist_file:(NSString *)file;
/// + (NSString *) data_to_string:(NSData *)data;
/// + (NSData *) string_to_data:(NSString *)str;
@interface MyFileHandler : NSObject
{
    
}

/// Get current writable dir on device.
/// @return: NSString *, current writable dir. 
+ (NSString *)get_current_dir;

/// Get abs path which is writable and readable on device.
/// @param: NSString *, relative path.
/// @return: NSString *, abs path. 
+ (NSString *)get_abs_path:(NSString *) relpath;

/// Get app dir
/// @return: NSString *, app dir. 
+ (NSString *)get_app_dir;

/// Get abs path refer to app path
/// @param: NSString *, relative path.
/// @return: NSString *, abs path. 
+ (NSString *)get_abs_app_path:(NSString *) relpath;

/// Write data to file.
/// @param file: NSString *, target filename. 
/// @param data: NSData *, data you want to write. 
/// @return: BOOL, true if write operation success. 
+ (BOOL) write_to_file:(NSString *)file with:(NSData *)data;

/// Write string to file.
/// @param file: NSString *, target filename. 
/// @param str: NSString*, string you want to write. 
/// @return: BOOL, true if write operation success. 
+ (BOOL) write_str_to_file:(NSString *)file with:(NSString *)str;

/// Write image to file.
/// @param file: NSString *, target filename. 
/// @param img: NSString*, image you want to write. 
/// @return: BOOL, true if write operation success. 
+ (BOOL) write_img_to_file:(NSString *)file with:(UIImage *)img;

/// Read data from file.
/// @param file: NSString *, target filename. 
/// @return: NSData *, data read from file. 
+ (NSData *) read_from_file:(NSString *)file;

/// Read data from file in app resource dir.
/// @param file: NSString *, target filename. 
/// @return: NSData *, data read from file. 
+ (NSData *) read_from_file_in_resource:(NSString *)file;

/// Read string from file.
/// @param file: NSString *, target filename. 
/// @return: NSString*, data read from file. 
+ (NSString *) read_str_from_file:(NSString *)file;

/// Read image from file.
/// @param file: NSString *, target filename. 
/// @return: UIImage*, image read from file. 
+ (UIImage *) read_img_from_file:(NSString *)file;

/// Judge if file exist.
/// @param file: NSString *, target filename. 
/// @return: BOOL, true if file exist. 
+ (BOOL) exist_file:(NSString *)file;

/// Convert NSData to NSString.
/// @param: NSData *, data need to convert. 
/// @return: NSString *, result string. 
+ (NSString *) data_to_string:(NSData *)data;

/// Convert NSString to NSData.
/// @param: NSString *, string need to convert. 
/// @return: NSData *, result data. 
+ (NSData *) string_to_data:(NSString *)str;

/// Convert NSData to UIImage.
/// @param: NSData *, data need to convert
/// @return: UIImage *, result image.
+ (UIImage *) data_to_image:(NSData *)data;

/// Convert UIImage to NSData.
/// @param: UIImage *, image need to convert
/// @return: NSData * return data
+ (NSData *) image_to_data:(UIImage *)image;
@end

