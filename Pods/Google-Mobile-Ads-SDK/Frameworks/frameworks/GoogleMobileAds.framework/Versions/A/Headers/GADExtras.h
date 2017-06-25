***REMOVED***
***REMOVED***  GADExtras.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2012 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>

#import <GoogleMobileAds/GADAdNetworkExtras.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Ad network extras sent to Google networks.
@interface GADExtras : NSObject<GADAdNetworkExtras>

***REMOVED***/ Additional parameters to be sent to Google networks.
@property(nonatomic, copy, GAD_NULLABLE) NSDictionary *additionalParameters;

***REMOVED***

GAD_ASSUME_NONNULL_END
