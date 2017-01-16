***REMOVED***
***REMOVED***  YLPClient+PhoneSearch.h
***REMOVED***  Pods
***REMOVED***
***REMOVED***  Created by David Chen on 1/19/16.
***REMOVED***
***REMOVED***
#import "YLPClient.h"

@class YLPSearch;

NS_ASSUME_NONNULL_BEGIN

typedef void(^YLPPhoneSearchCompletionHandler)(YLPSearch *_Nullable search, NSError *_Nullable error);

@interface YLPClient (PhoneSearch)

- (void)businessWithPhoneNumber:(NSString *)phoneNumber
              completionHandler:(YLPPhoneSearchCompletionHandler)completionHandler;

***REMOVED***

NS_ASSUME_NONNULL_END
