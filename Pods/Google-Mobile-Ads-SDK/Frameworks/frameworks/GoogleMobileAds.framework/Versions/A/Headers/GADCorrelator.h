***REMOVED***
***REMOVED***  GADCorrelator.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>

#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Represents a correlation between multiple ads. Set an instance of this object on multiple ads to
***REMOVED***/ indicate they are being used in a common context.
@interface GADCorrelator : NSObject

***REMOVED***/ Resets the correlator to force a new set of correlated ads.
- (void)reset;

***REMOVED***

GAD_ASSUME_NONNULL_END
