***REMOVED***
***REMOVED***  YLPClient.m
***REMOVED***  Pods
***REMOVED***
***REMOVED***  Created by David Chen on 12/7/15.
***REMOVED***
***REMOVED***

#import <Foundation/Foundation.h>
#import "YLPClient.h"
#import "YLPClientPrivate.h"

NSString *const kYLPAPIHost = @"api.yelp.com";
NSString *const kYLPErrorDomain = @"com.yelp.YelpAPI.ErrorDomain";

@interface YLPClient ()
@property (strong, nonatomic) NSString *accessToken;
***REMOVED***

@implementation YLPClient

- (instancetype)init ***REMOVED***
    return nil;
***REMOVED***

- (instancetype)initWithAccessToken:(NSString *)accessToken ***REMOVED***
    if (self = [super init]) ***REMOVED***
        _accessToken = accessToken;
    ***REMOVED***
    return self;
***REMOVED***

- (NSURLRequest *)requestWithPath:(NSString *)path ***REMOVED***
    return [self requestWithPath:path params:nil];
***REMOVED***

- (NSURLRequest *)requestWithPath:(NSString *)path params:(NSDictionary *)params ***REMOVED***
    NSURLComponents *urlComponents = [[NSURLComponents alloc] init];
    urlComponents.scheme = @"https";
    urlComponents.host = kYLPAPIHost;
    urlComponents.path = path;

    NSArray *queryItems = [YLPClient queryItemsForParams:params];
    if (queryItems.count > 0) ***REMOVED***
        urlComponents.queryItems = queryItems;
    ***REMOVED***

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:urlComponents.URL];
    request.HTTPMethod = @"GET";
    NSString *authHeader = [NSString stringWithFormat:@"Bearer %@", self.accessToken];
    [request setValue:authHeader forHTTPHeaderField:@"Authorization"];

    return request;
***REMOVED***

- (void)queryWithRequest:(NSURLRequest *)request
       completionHandler:(void (^)(NSDictionary *jsonResponse, NSError *error))completionHandler ***REMOVED***
    [YLPClient queryWithRequest:request completionHandler:completionHandler];
***REMOVED***

#pragma mark Request utilities

+ (void)queryWithRequest:(NSURLRequest *)request
       completionHandler:(void (^)(NSDictionary *jsonResponse, NSError *error))completionHandler ***REMOVED***
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) ***REMOVED***
        NSDictionary *responseJSON;
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        ***REMOVED*** This case handles cases where the request was processed by the API, thus
        ***REMOVED*** resulting in a JSON object being passed back into `data`.
        if (!error) ***REMOVED***
            responseJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        ***REMOVED***
        
        if (!error && httpResponse.statusCode == 200) ***REMOVED***
            completionHandler(responseJSON, nil);
        ***REMOVED*** else ***REMOVED***
            ***REMOVED*** If a request fails due to systematic errors with the API then an NSError will be returned.
            error = error ? error : [NSError errorWithDomain:kYLPErrorDomain code:httpResponse.statusCode userInfo:responseJSON];
            completionHandler(nil, error);
        ***REMOVED***
    ***REMOVED***] resume];
***REMOVED***

+ (NSArray<NSURLQueryItem *> *)queryItemsForParams:(NSDictionary<NSString *, id> *)params ***REMOVED***
    NSMutableArray *queryItems = [NSMutableArray array];
    for (NSString *name in params) ***REMOVED***
        NSString *value = [params[name] description];
        NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:name value:value];
        [queryItems addObject:queryItem];
    ***REMOVED***
    return queryItems;
***REMOVED***

+ (NSCharacterSet *)URLEncodeAllowedCharacters ***REMOVED***
    ***REMOVED*** unreserved  = ALPHA / DIGIT / "-" / "." / "_" / "~"
    NSMutableCharacterSet *allowedCharacters = [[NSMutableCharacterSet alloc] init];
    [allowedCharacters addCharactersInRange:NSMakeRange((NSUInteger)'A', 26)];
    [allowedCharacters addCharactersInRange:NSMakeRange((NSUInteger)'a', 26)];
    [allowedCharacters addCharactersInRange:NSMakeRange((NSUInteger)'0', 10)];
    [allowedCharacters addCharactersInString:@"-._~"];
    return allowedCharacters;
***REMOVED***

#pragma mark Authorization

+ (NSURLRequest *)authRequestWithAppId:(NSString *)appId secret:(NSString *)secret ***REMOVED***
    NSURLComponents *urlComponents = [[NSURLComponents alloc] init];
    urlComponents.scheme = @"https";
    urlComponents.host = kYLPAPIHost;
    urlComponents.path = @"/oauth2/token";

    NSCharacterSet *allowedCharacters = [self URLEncodeAllowedCharacters];
    NSString *body = [NSString stringWithFormat:@"grant_type=client_credentials&client_id=%@&client_secret=%@",
                      [appId stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters],
                      [secret stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters]];
    NSData *bodyData = [body dataUsingEncoding:NSUTF8StringEncoding];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:urlComponents.URL];
    request.HTTPMethod = @"POST";
    request.HTTPBody = bodyData;
    [request setValue:[NSString stringWithFormat:@"%zd", bodyData.length] forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];

    return request;
***REMOVED***

+ (void)authorizeWithAppId:(NSString *)appId
                    secret:(NSString *)secret
         completionHandler:(void (^)(YLPClient *client, NSError *error))completionHandler ***REMOVED***
    NSURLRequest *request = [self authRequestWithAppId:appId secret:secret];
    [self queryWithRequest:request completionHandler:^(NSDictionary *jsonResponse, NSError *error) ***REMOVED***
        if (error) ***REMOVED***
            completionHandler(nil, error);
        ***REMOVED*** else ***REMOVED***
            NSString *accessToken = jsonResponse[@"access_token"];
            YLPClient *client = [[YLPClient alloc] initWithAccessToken:accessToken];
            completionHandler(client, nil);
        ***REMOVED***
    ***REMOVED***];
***REMOVED***

***REMOVED***
