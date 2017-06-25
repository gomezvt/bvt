***REMOVED***
***REMOVED***  GADInterstitialDelegate.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2011 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>

#import <GoogleMobileAds/GADAdDelegate.h>
#import <GoogleMobileAds/GADRequestError.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

@class GADInterstitial;

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Delegate for receiving state change messages from a GADInterstitial such as interstitial ad
***REMOVED***/ requests succeeding/failing.
@protocol GADInterstitialDelegate<GADAdDelegate>

@optional

#pragma mark Ad Request Lifecycle Notifications

***REMOVED***/ Called when an interstitial ad request succeeded. Show it at the next transition point in your
***REMOVED***/ application such as when transitioning between view controllers.
- (void)interstitialDidReceiveAd:(GADInterstitial *)ad;

***REMOVED***/ Called when an interstitial ad request completed without an interstitial to
***REMOVED***/ show. This is common since interstitials are shown sparingly to users.
- (void)interstitial:(GADInterstitial *)ad didFailToReceiveAdWithError:(GADRequestError *)error;

#pragma mark Display-Time Lifecycle Notifications

***REMOVED***/ Called just before presenting an interstitial. After this method finishes the interstitial will
***REMOVED***/ animate onto the screen. Use this opportunity to stop animations and save the state of your
***REMOVED***/ application in case the user leaves while the interstitial is on screen (e.g. to visit the App
***REMOVED***/ Store from a link on the interstitial).
- (void)interstitialWillPresentScreen:(GADInterstitial *)ad;

***REMOVED***/ Called when |ad| fails to present.
- (void)interstitialDidFailToPresentScreen:(GADInterstitial *)ad;

***REMOVED***/ Called before the interstitial is to be animated off the screen.
- (void)interstitialWillDismissScreen:(GADInterstitial *)ad;

***REMOVED***/ Called just after dismissing an interstitial and it has animated off the screen.
- (void)interstitialDidDismissScreen:(GADInterstitial *)ad;

***REMOVED***/ Called just before the application will background or terminate because the user clicked on an
***REMOVED***/ ad that will launch another application (such as the App Store). The normal
***REMOVED***/ UIApplicationDelegate methods, like applicationDidEnterBackground:, will be called immediately
***REMOVED***/ before this.
- (void)interstitialWillLeaveApplication:(GADInterstitial *)ad;

***REMOVED***

GAD_ASSUME_NONNULL_END
