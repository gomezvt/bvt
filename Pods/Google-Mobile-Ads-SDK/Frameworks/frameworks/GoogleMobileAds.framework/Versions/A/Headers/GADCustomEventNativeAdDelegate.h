***REMOVED***
***REMOVED***  GADCustomEventNativeAdDelegate.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>

#import <GoogleMobileAds/GADCustomEventNativeAd.h>
#import <GoogleMobileAds/GADMediatedNativeAd.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ The delegate of the GADCustomEventNativeAd object must adopt the GADCustomEventNativeAdDelegate
***REMOVED***/ protocol. Methods in this protocol are used for native ad's custom event communication with the
***REMOVED***/ Google Mobile Ads SDK.
@protocol GADCustomEventNativeAdDelegate<NSObject>

***REMOVED***/ Tells the delegate that the custom event ad request succeeded and loaded a native ad.
- (void)customEventNativeAd:(id<GADCustomEventNativeAd>)customEventNativeAd
    didReceiveMediatedNativeAd:(id<GADMediatedNativeAd>)mediatedNativeAd;

***REMOVED***/ Tells the delegate that the custom event ad request failed.
- (void)customEventNativeAd:(id<GADCustomEventNativeAd>)customEventNativeAd
     didFailToLoadWithError:(NSError *)error;

***REMOVED***

GAD_ASSUME_NONNULL_END
