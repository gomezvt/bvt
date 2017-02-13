***REMOVED***
***REMOVED***  YLPClient+Business.h
***REMOVED***  Pods
***REMOVED***
***REMOVED***  Created by David Chen on 1/4/16.
***REMOVED***
***REMOVED***
#import "YLPClient.h"

@class YLPBusiness;

NS_ASSUME_NONNULL_BEGIN

typedef void(^YLPBusinessCompletionHandler)(YLPBusiness * _Nullable business, NSError * _Nullable error);

@interface YLPClient (Business)

- (void)businessWithId:(NSString *)businessId
     completionHandler:(YLPBusinessCompletionHandler)completionHandler;

- (void)reviewsWithId:(NSString *)businessId
     completionHandler:(YLPBusinessCompletionHandler)completionHandler;

***REMOVED***

NS_ASSUME_NONNULL_END
