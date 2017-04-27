***REMOVED***
***REMOVED***  YLPClient+Business.m
***REMOVED***  Pods
***REMOVED***
***REMOVED***  Created by David Chen on 1/4/16.
***REMOVED***
***REMOVED***

#import "YLPClient+Business.h"
#import "YLPBusiness.h"
#import "YLPClientPrivate.h"
#import "YLPResponsePrivate.h"

@implementation YLPClient (Business)

- (NSURLRequest *)businessRequestWithId:(NSString *)businessId ***REMOVED***
    NSString *businessPath = [@"/v3/businesses/" stringByAppendingString:businessId];
    return [self requestWithPath:businessPath];
***REMOVED***

- (void)businessWithId:(NSString *)businessId
     completionHandler:(void (^)(YLPBusiness *business, NSError *error))completionHandler ***REMOVED***
    NSURLRequest *req = [self businessRequestWithId:businessId];
    [self queryWithRequest:req completionHandler:^(NSDictionary *responseDict, NSError *error) ***REMOVED***
        if (error) ***REMOVED***
            completionHandler(nil, error);
        ***REMOVED*** else ***REMOVED***
            YLPBusiness *business = [[YLPBusiness alloc] initWithDictionary:responseDict];
            completionHandler(business, nil);
            
            [[NSNotificationCenter defaultCenter]
             postNotificationName:@"BVTReceivedBusinessesIdNotification"
             object:business];
        ***REMOVED***
    ***REMOVED***];
***REMOVED***

***REMOVED***
