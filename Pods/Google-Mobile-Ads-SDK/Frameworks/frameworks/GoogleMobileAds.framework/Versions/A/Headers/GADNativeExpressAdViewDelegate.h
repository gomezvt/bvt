***REMOVED***
***REMOVED***  GADNativeExpressAdViewDelegate.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>

#import <GoogleMobileAds/GADRequestError.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

@class GADNativeExpressAdView;

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Delegate methods for receiving GADNativeExpressAdView state change messages such as ad request
***REMOVED***/ status and ad click lifecycle.
@protocol GADNativeExpressAdViewDelegate<NSObject>

@optional

#pragma mark Ad Request Lifecycle Notifications

***REMOVED***/ Tells the delegate that the native express ad view successfully received an ad. The delegate may
***REMOVED***/ want to add the native express ad view to the view hierarchy if it hasn't been added yet.
- (void)nativeExpressAdViewDidReceiveAd:(GADNativeExpressAdView *)nativeExpressAdView;

***REMOVED***/ Tells the delegate that an ad request failed. The failure is normally due to network
***REMOVED***/ connectivity or ad availablility (i.e., no fill).
- (void)nativeExpressAdView:(GADNativeExpressAdView *)nativeExpressAdView
    didFailToReceiveAdWithError:(GADRequestError *)error;

#pragma mark Click-Time Lifecycle Notifications

***REMOVED***/ Tells the delegate that a full screen view will be presented in response to the user clicking on
***REMOVED***/ an ad. The delegate may want to pause animations and time sensitive interactions.
- (void)nativeExpressAdViewWillPresentScreen:(GADNativeExpressAdView *)nativeExpressAdView;

***REMOVED***/ Tells the delegate that the full screen view will be dismissed.
- (void)nativeExpressAdViewWillDismissScreen:(GADNativeExpressAdView *)nativeExpressAdView;

***REMOVED***/ Tells the delegate that the full screen view has been dismissed. The delegate should restart
***REMOVED***/ anything paused while handling adViewWillPresentScreen:.
- (void)nativeExpressAdViewDidDismissScreen:(GADNativeExpressAdView *)nativeExpressAdView;

***REMOVED***/ Tells the delegate that the user click will open another app, backgrounding the current
***REMOVED***/ application. The standard UIApplicationDelegate methods, like applicationDidEnterBackground:,
***REMOVED***/ are called immediately before this method is called.
- (void)nativeExpressAdViewWillLeaveApplication:(GADNativeExpressAdView *)nativeExpressAdView;

***REMOVED***

GAD_ASSUME_NONNULL_END
