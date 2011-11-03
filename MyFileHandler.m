//
//  MyFileHandler.m
//  SBSAPP
//
//  Created by WUMUXIAN on 30/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

//
//  MyFileHandler.m
//  mylib
//
//  Created by Wang Qiang.
//  Copyright nanyang technological university 2011. All rights reserved.
//

#import "MyFileHandler.h"

@implementation MyFileHandler

+ (NSString *)get_current_dir
{
    NSArray *dirPaths;
    NSString *docsDir;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                   NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    return docsDir;
}

+ (NSString *)get_abs_path:(NSString *) relpath
{
    NSString* baseDir = [MyFileHandler get_current_dir];
    NSString *absPath = [NSString stringWithFormat:@"%@/%@", baseDir, relpath];
    return absPath;
}

+ (NSString *)get_app_dir
{
    return [[NSBundle mainBundle] resourcePath];    
}

+ (NSString *)get_abs_app_path:(NSString *) relpath
{
    NSString* baseDir = [MyFileHandler get_app_dir];
    NSString *absPath = [NSString stringWithFormat:@"%@/%@", baseDir, relpath];
    return absPath;
}

+ (BOOL) exist_file:(NSString *)file
{
    return [[NSFileManager defaultManager] fileExistsAtPath: file];
}

+ (BOOL) write_to_file:(NSString *)file with:(NSData *)data
{
    NSString* filename = [MyFileHandler get_abs_path:file];
    if (![MyFileHandler exist_file:filename]){
        [[NSFileManager defaultManager] createFileAtPath: filename contents: nil attributes: nil];
    }
    NSFileHandle *fileHandler = [NSFileHandle fileHandleForWritingAtPath: filename]; 
    [fileHandler writeData: data];
    [fileHandler closeFile];
    return true;
}


+ (BOOL) write_str_to_file:(NSString *)file with:(NSString *)str
{
    NSData * data = [MyFileHandler string_to_data:str];
    return [MyFileHandler write_to_file:file with:data];
}

+ (BOOL) write_img_to_file:(NSString *)file with:(UIImage *)img
{
    NSData * data = [MyFileHandler image_to_data:img];
    return [MyFileHandler write_to_file:file with:data];
}

+ (NSData *) read_from_file:(NSString *)file
{
    NSString* filename = [MyFileHandler get_abs_path:file];
    if ([MyFileHandler exist_file:filename]) {
        NSFileHandle *fileHandler = [NSFileHandle fileHandleForReadingAtPath: filename]; 
        NSData* readData = [fileHandler readDataToEndOfFile];
        [fileHandler closeFile];
        return readData;
    } else {
        return nil;
    }
}

+ (NSData *) read_from_file_in_resource:(NSString *)file
{
    NSString* filename = [MyFileHandler get_abs_app_path:file];
    if ([MyFileHandler exist_file:filename]) {
        NSFileHandle *fileHandler = [NSFileHandle fileHandleForReadingAtPath: filename]; 
        NSData* readData = [fileHandler readDataToEndOfFile];
        [fileHandler closeFile];
        return readData;
    } else {
        return nil;
    }
}

+ (NSString *) read_str_from_file:(NSString *)file
{
    NSData *data = [MyFileHandler read_from_file:file];
    return [MyFileHandler data_to_string:data];
}

+ (UIImage *) read_img_from_file:(NSString *)file
{
    NSData *data = [MyFileHandler read_from_file:file];
    return [MyFileHandler data_to_image:data];
}

+ (NSString *) data_to_string:(NSData *)data
{
    NSString* newStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return newStr;
}

+ (UIImage *) data_to_image:(NSData *)data
{
    UIImage *image=[UIImage imageWithData:data];
    return image;
}

+ (NSData *) string_to_data:(NSString *)str
{
    NSData* data = [str dataUsingEncoding:NSUTF8StringEncoding];
    return data;
}

+ (NSData *) image_to_data:(UIImage *)image
{
    NSData *imageData = UIImagePNGRepresentation(image);
    return imageData;
}

@end

