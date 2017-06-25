***REMOVED***
***REMOVED***  GADMediatedNativeAdNotificationSource.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>

#import <GoogleMobileAds/GADMediatedNativeAd.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Notifies the Google Mobile Ads SDK about the events performed by adapters. Adapters may perform
***REMOVED***/ some action (e.g. opening an in app browser or open the iTunes store) when handling callbacks
***REMOVED***/ from GADMediatedNativeAdDelegate. Adapters in such case should notify the Google Mobile Ads SDK
***REMOVED***/ by calling the relevant methods from this class.
@interface GADMediatedNativeAdNotificationSource : NSObject

***REMOVED***/ Called by the adapter when it has registered an impression on the tracked view. Adapter should
***REMOVED***/ only call this method if -[GADMAdNetworkAdapter handlesUserImpressions] returns YES.
+ (void)mediatedNativeAdDidRecordImpression:(id<GADMediatedNativeAd>)mediatedNativeAd;

***REMOVED***/ Called by the adapter when it has registered a user click on the tracked view. Adapter should
***REMOVED***/ only call this method if -[GADMAdNetworkAdapter handlesUserClicks] returns YES.
+ (void)mediatedNativeAdDidRecordClick:(id<GADMediatedNativeAd>)mediatedNativeAd;

***REMOVED***/ Must be called by the adapter just before mediatedNativeAd has opened an in app modal screen.
+ (void)mediatedNativeAdWillPresentScreen:(id<GADMediatedNativeAd>)mediatedNativeAd;

***REMOVED***/ Must be called by the adapter just before the in app modal screen opened by mediatedNativeAd is
***REMOVED***/ dismissed.
+ (void)mediatedNativeAdWillDismissScreen:(id<GADMediatedNativeAd>)mediatedNativeAd;

***REMOVED***/ Must be called by the adapter after the in app modal screen opened by mediatedNativeAd is
***REMOVED***/ dismissed.
+ (void)mediatedNativeAdDidDismissScreen:(id<GADMediatedNativeAd>)mediatedNativeAd;

***REMOVED***/ Must be called by the adapter just before mediatedNativeAd has left the application.
+ (void)mediatedNativeAdWillLeaveApplication:(id<GADMediatedNativeAd>)mediatedNativeAd;

***REMOVED***

GAD_ASSUME_NONNULL_END
