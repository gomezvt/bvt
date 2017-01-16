***REMOVED***
***REMOVED***  YLPClientPrivate.h
***REMOVED***  Pods
***REMOVED***
***REMOVED***  Created by David Chen on 1/8/16.
***REMOVED***
***REMOVED***
#import "YLPClient.h"

NS_ASSUME_NONNULL_BEGIN

extern NSString *const kYLPErrorDomain;

@interface YLPClient ()

- (instancetype)initWithAccessToken:(NSString *)accessToken;

- (NSURLRequest *)requestWithPath:(NSString *)path;
- (NSURLRequest *)requestWithPath:(NSString *)path params:(nullable NSDictionary *)params;
- (void)queryWithRequest:(NSURLRequest *)request completionHandler:(void (^)(NSDictionary *responseDict, NSError *error))completionHandler;

+ (NSCharacterSet *)URLEncodeAllowedCharacters;
+ (NSURLRequest *)authRequestWithAppId:(NSString *)appId secret:(NSString *)secret;

***REMOVED***

NS_ASSUME_NONNULL_END
