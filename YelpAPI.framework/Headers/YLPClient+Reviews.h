***REMOVED***
***REMOVED***  YLPClient+Reviews.h
***REMOVED***  YelpAPI
***REMOVED***
***REMOVED***  Created by Steven Sheldon on 10/21/16.
***REMOVED***
***REMOVED***

#import "YLPClient.h"

@class YLPBusinessReviews;

NS_ASSUME_NONNULL_BEGIN

typedef void(^YLPReviewsCompletionHandler)(YLPBusinessReviews *_Nullable reviews, NSError *_Nullable error);

@interface YLPClient (Reviews)

- (void)reviewsForBusinessWithId:(NSString *)businessId
               completionHandler:(YLPReviewsCompletionHandler)completionHandler;

- (void)reviewsForBusinessWithId:(NSString *)businessId
                          locale:(nullable NSString *)locale
               completionHandler:(YLPReviewsCompletionHandler)completionHandler;

***REMOVED***

NS_ASSUME_NONNULL_END
