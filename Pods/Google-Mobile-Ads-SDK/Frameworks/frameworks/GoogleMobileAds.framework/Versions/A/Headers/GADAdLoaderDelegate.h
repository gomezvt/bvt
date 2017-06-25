***REMOVED***
***REMOVED***  GADAdLoaderDelegate.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>

#import <GoogleMobileAds/GADRequestError.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

@class GADAdLoader;

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Base ad loader delegate protocol. Ad types provide extended protocols that declare methods to
***REMOVED***/ handle successful ad loads.
@protocol GADAdLoaderDelegate<NSObject>

***REMOVED***/ Called when adLoader fails to load an ad.
- (void)adLoader:(GADAdLoader *)adLoader didFailToReceiveAdWithError:(GADRequestError *)error;

@optional

***REMOVED***/ Called after adLoader has finished loading.
- (void)adLoaderDidFinishLoading:(GADAdLoader *)adLoader;

***REMOVED***

GAD_ASSUME_NONNULL_END
