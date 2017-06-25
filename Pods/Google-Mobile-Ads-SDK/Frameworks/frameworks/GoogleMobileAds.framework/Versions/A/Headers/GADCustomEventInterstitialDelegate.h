***REMOVED***
***REMOVED***  GADCustomEventInterstitialDelegate.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2012 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>

#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

@protocol GADCustomEventInterstitial;

***REMOVED***/ Call back to this delegate in your custom event. You must call
***REMOVED***/ customEventInterstitialDidReceiveAd: when there is an ad to show, or
***REMOVED***/ customEventInterstitial:didFailAd: when there is no ad to show. Otherwise, if enough time passed
***REMOVED***/ (several seconds) after the SDK called the requestInterstitialAdWithParameter: method of your
***REMOVED***/ custom event, the mediation SDK will consider the request timed out, and move on to the next ad
***REMOVED***/ network.
@protocol GADCustomEventInterstitialDelegate<NSObject>

***REMOVED***/ Your Custom Event object must call this when it receives or creates an interstitial ad.
- (void)customEventInterstitialDidReceiveAd:(id<GADCustomEventInterstitial>)customEvent;

***REMOVED***/ Your Custom Event object must call this when it fails to receive or create the ad. Pass along
***REMOVED***/ any error object sent from the ad network's SDK, or an NSError describing the error. Pass nil if
***REMOVED***/ not available.
- (void)customEventInterstitial:(id<GADCustomEventInterstitial>)customEvent
                      didFailAd:(NSError *GAD_NULLABLE_TYPE)error;

***REMOVED***/ Your Custom Event object should call this when the user touches or "clicks" the ad to initiate
***REMOVED***/ an action. When the SDK receives this callback, it reports the click back to the mediation
***REMOVED***/ server.
- (void)customEventInterstitialWasClicked:(id<GADCustomEventInterstitial>)customEvent;

***REMOVED*** When you call any of the following methods, the call will be propagated back to the
***REMOVED*** GADInterstitialDelegate that you implemented and passed to GADInterstitial.

***REMOVED***/ Your Custom Event should call this when the interstitial is being displayed.
- (void)customEventInterstitialWillPresent:(id<GADCustomEventInterstitial>)customEvent;

***REMOVED***/ Your Custom Event should call this when the interstitial is about to be dismissed.
- (void)customEventInterstitialWillDismiss:(id<GADCustomEventInterstitial>)customEvent;

***REMOVED***/ Your Custom Event should call this when the interstitial has been dismissed.
- (void)customEventInterstitialDidDismiss:(id<GADCustomEventInterstitial>)customEvent;

***REMOVED***/ Your Custom Event should call this method when a user action will result in app switching.
- (void)customEventInterstitialWillLeaveApplication:(id<GADCustomEventInterstitial>)customEvent;

#pragma mark Deprecated

***REMOVED***/ Deprecated. Use customEventInterstitialDidReceiveAd:.
- (void)customEventInterstitial:(id<GADCustomEventInterstitial>)customEvent
                   didReceiveAd:(NSObject *)ad
    GAD_DEPRECATED_MSG_ATTRIBUTE("Use customEventInterstitialDidReceiveAd:.");

***REMOVED***

GAD_ASSUME_NONNULL_END
