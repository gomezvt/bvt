***REMOVED***
***REMOVED***  YLPClient+Reviews.m
***REMOVED***  YelpAPI
***REMOVED***
***REMOVED***  Created by Steven Sheldon on 10/21/16.
***REMOVED***
***REMOVED***

#import "YLPClient+Reviews.h"
#import "YLPClientPrivate.h"
#import "YLPResponsePrivate.h"

@implementation YLPClient (Reviews)

- (void)reviewsForBusinessWithId:(NSString *)businessId
               completionHandler:(YLPReviewsCompletionHandler)completionHandler ***REMOVED***
    [self reviewsForBusinessWithId:businessId locale:nil completionHandler:completionHandler];
***REMOVED***

- (void)reviewsForBusinessWithId:(NSString *)businessId
                          locale:(nullable NSString *)locale
               completionHandler:(YLPReviewsCompletionHandler)completionHandler ***REMOVED***
    NSString *path = [NSString stringWithFormat:@"/v3/businesses/%@/reviews", businessId];
    NSDictionary *params = locale ? @***REMOVED***@"locale": locale***REMOVED*** : @***REMOVED******REMOVED***;
    NSURLRequest *request = [self requestWithPath:path params:params];

    [self queryWithRequest:request completionHandler:^(NSDictionary *responseDict, NSError *error) ***REMOVED***
        if (error) ***REMOVED***
            completionHandler(nil, error);
        ***REMOVED*** else ***REMOVED***
            YLPBusinessReviews *reviews = [[YLPBusinessReviews alloc] initWithDictionary:responseDict];
            completionHandler(reviews, nil);
        ***REMOVED***
    ***REMOVED***];
***REMOVED***

***REMOVED***
