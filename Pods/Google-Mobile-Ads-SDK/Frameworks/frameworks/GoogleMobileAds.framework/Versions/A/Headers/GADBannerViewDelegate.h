***REMOVED***
***REMOVED***  GADBannerViewDelegate.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2011 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>

#import <GoogleMobileAds/GADAdDelegate.h>
#import <GoogleMobileAds/GADRequestError.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

@class GADBannerView;

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Delegate methods for receiving GADBannerView state change messages such as ad request status
***REMOVED***/ and ad click lifecycle.
@protocol GADBannerViewDelegate<GADAdDelegate>

@optional

#pragma mark Ad Request Lifecycle Notifications

***REMOVED***/ Tells the delegate that an ad request successfully received an ad. The delegate may want to add
***REMOVED***/ the banner view to the view hierarchy if it hasn't been added yet.
- (void)adViewDidReceiveAd:(GADBannerView *)bannerView;

***REMOVED***/ Tells the delegate that an ad request failed. The failure is normally due to network
***REMOVED***/ connectivity or ad availablility (i.e., no fill).
- (void)adView:(GADBannerView *)bannerView didFailToReceiveAdWithError:(GADRequestError *)error;

#pragma mark Click-Time Lifecycle Notifications

***REMOVED***/ Tells the delegate that a full screen view will be presented in response to the user clicking on
***REMOVED***/ an ad. The delegate may want to pause animations and time sensitive interactions.
- (void)adViewWillPresentScreen:(GADBannerView *)bannerView;

***REMOVED***/ Tells the delegate that the full screen view will be dismissed.
- (void)adViewWillDismissScreen:(GADBannerView *)bannerView;

***REMOVED***/ Tells the delegate that the full screen view has been dismissed. The delegate should restart
***REMOVED***/ anything paused while handling adViewWillPresentScreen:.
- (void)adViewDidDismissScreen:(GADBannerView *)bannerView;

***REMOVED***/ Tells the delegate that the user click will open another app, backgrounding the current
***REMOVED***/ application. The standard UIApplicationDelegate methods, like applicationDidEnterBackground:,
***REMOVED***/ are called immediately before this method is called.
- (void)adViewWillLeaveApplication:(GADBannerView *)bannerView;

***REMOVED***

GAD_ASSUME_NONNULL_END
