***REMOVED***
***REMOVED***  GADNativeAdDelegate.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>

#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

@class GADNativeAd;

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Identifies native ad assets.
@protocol GADNativeAdDelegate<NSObject>

@optional

#pragma mark Ad Lifecycle Events

***REMOVED***/ Called when an impression is recorded for an ad. Only called for Google ads and is not supported
***REMOVED***/ for mediation ads.
- (void)nativeAdDidRecordImpression:(GADNativeAd *)nativeAd;

***REMOVED***/ Called when a click is recorded for an ad. Only called for Google ads and is not supported for
***REMOVED***/ mediation ads.
- (void)nativeAdDidRecordClick:(GADNativeAd *)nativeAd;

#pragma mark Click-Time Lifecycle Notifications

***REMOVED***/ Called just before presenting the user a full screen view, such as a browser, in response to
***REMOVED***/ clicking on an ad. Use this opportunity to stop animations, time sensitive interactions, etc.
***REMOVED***/
***REMOVED***/ Normally the user looks at the ad, dismisses it, and control returns to your application with
***REMOVED***/ the nativeAdDidDismissScreen: message. However, if the user hits the Home button or clicks on an
***REMOVED***/ App Store link, your application will end. The next method called will be the
***REMOVED***/ applicationWillResignActive: of your UIApplicationDelegate object.Immediately after that,
***REMOVED***/ nativeAdWillLeaveApplication: is called.
- (void)nativeAdWillPresentScreen:(GADNativeAd *)nativeAd;

***REMOVED***/ Called just before dismissing a full screen view.
- (void)nativeAdWillDismissScreen:(GADNativeAd *)nativeAd;

***REMOVED***/ Called just after dismissing a full screen view. Use this opportunity to restart anything you
***REMOVED***/ may have stopped as part of nativeAdWillPresentScreen:.
- (void)nativeAdDidDismissScreen:(GADNativeAd *)nativeAd;

***REMOVED***/ Called just before the application will go to the background or terminate due to an ad action
***REMOVED***/ that will launch another application (such as the App Store). The normal UIApplicationDelegate
***REMOVED***/ methods, like applicationDidEnterBackground:, will be called immediately before this.
- (void)nativeAdWillLeaveApplication:(GADNativeAd *)nativeAd;

***REMOVED***

GAD_ASSUME_NONNULL_END
