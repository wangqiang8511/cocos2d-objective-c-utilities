//
//  MyHTTPRequest.h
//  mylib
//
//  Created by Wang Qiang.
//  Copyright nanyang technological university 2011. All rights reserved.
//

/// MyHTTPRequest
/// Handling HTTP get post request more easier.
/// + (NSData *) get_data_from_url:(NSString *)url;
/// + (NSString *) get_string_from_url:(NSString *)url;
/// + (NSDictionary *) get_json_from_url:(NSString *)url;
/// + (NSData *) get_image_from_url:(NSString *)url;
/// + (NSString *) post_data:(NSDictionary *)data toUrl:(NSString *)url;
/// + (NSString *) post_data:(NSDictionary *)data andFile:(NSDictionary *)file toUrl:(NSString *)url;
@interface MyHTTPRequest : NSObject
{

}

/// Get binary data from url by GET method.
/// @param: NSString *, url you want to retrival. 
/// @return: NSData *, binary data received from http reuqest. 
+ (NSData *) get_data_from_url:(NSString *)url;

/// Get string from url by GET method.
/// @param: NSString *, url you want to retrival. 
/// @return: NSString *, string received from http reuqest. 
+ (NSString *) get_string_from_url:(NSString *)url;

/// Get json dict from url by GET method.
/// @param: NSString *, url you want to retrival. 
/// @return: NSDictionary*, json dict received from http reuqest. 
+ (NSDictionary *) get_json_from_url:(NSString *)url;

/// Get image binary data from url.
/// @param: NSString *, image url. 
/// @return: NSData *, image binary data. 
+ (NSData *) get_image_from_url:(NSString *)url;

/// Post data to url by POST method.
/// @param: NSDictionary *, data dict for posting.
/// @param: NSString *, url. 
/// @return: NSString *, response string. 
+ (NSString *) post_data:(NSDictionary *)data toUrl:(NSString *)url;

/// Post data and file to url by multipart/form-data POST method.
/// @param: NSDictionary *, data dict for posting.
/// @param: NSDictionary *, file filename dict for posting.
/// @param: NSString *, url. 
/// @return: NSString *, response string. 
+ (NSString *) post_data:(NSDictionary *)data andFile:(NSDictionary *)file toUrl:(NSString *)url;
@end
