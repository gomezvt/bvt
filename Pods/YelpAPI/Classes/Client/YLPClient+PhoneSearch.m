***REMOVED***
***REMOVED***  YLPClient+PhoneSearch.m
***REMOVED***  Pods
***REMOVED***
***REMOVED***  Created by David Chen on 1/19/16.
***REMOVED***
***REMOVED***

#import "YLPClient+PhoneSearch.h"
#import "YLPClientPrivate.h"
#import "YLPResponsePrivate.h"
#import "YLPSearch.h"


@implementation YLPClient (PhoneSearch)

- (NSURLRequest *)businessRequestWithParams:(NSDictionary *)params ***REMOVED***
    NSString *phoneSearchPath = @"/v3/businesses/search/phone";
    return [self requestWithPath:phoneSearchPath params:params];
***REMOVED***

- (void)businessWithPhoneNumber:(NSString *)phoneNumber
              completionHandler:(YLPPhoneSearchCompletionHandler)completionHandler ***REMOVED***
    NSDictionary *params = @***REMOVED***@"phone": phoneNumber***REMOVED***;
    NSURLRequest *req = [self businessRequestWithParams:params];
    
    [self queryWithRequest:req completionHandler:^(NSDictionary *responseDict, NSError *error) ***REMOVED***
        if (error) ***REMOVED***
            completionHandler(nil, error);
        ***REMOVED*** else ***REMOVED***
            YLPSearch *search = [[YLPSearch alloc] initWithDictionary:responseDict];
            completionHandler(search, nil);
        ***REMOVED***
    ***REMOVED***];
***REMOVED***

***REMOVED***
