***REMOVED***
***REMOVED***  GADCustomEventBannerDelegate.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2012 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

@protocol GADCustomEventBanner;

***REMOVED***/ Call back to this delegate in your custom event. You must call customEventBanner:didReceiveAd:
***REMOVED***/ when there is an ad to show, or customEventBanner:didFailAd: when there is no ad to show.
***REMOVED***/ Otherwise, if enough time passed (several seconds) after the SDK called the requestBannerAd:
***REMOVED***/ method of your custom event, the mediation SDK will consider the request timed out, and move on
***REMOVED***/ to the next ad network.
@protocol GADCustomEventBannerDelegate<NSObject>

***REMOVED***/ Your Custom Event object must call this when it receives or creates an ad view.
- (void)customEventBanner:(id<GADCustomEventBanner>)customEvent didReceiveAd:(UIView *)view;

***REMOVED***/ Your Custom Event object must call this when it fails to receive or create the ad view. Pass
***REMOVED***/ along any error object sent from the ad network's SDK, or an NSError describing the error. Pass
***REMOVED***/ nil if not available.
- (void)customEventBanner:(id<GADCustomEventBanner>)customEvent
                didFailAd:(NSError *GAD_NULLABLE_TYPE)error;

***REMOVED***/ Your Custom Event object should call this when the user touches or "clicks" the ad to initiate
***REMOVED***/ an action. When the SDK receives this callback, it reports the click back to the mediation
***REMOVED***/ server.
- (void)customEventBannerWasClicked:(id<GADCustomEventBanner>)customEvent;

***REMOVED***/ The rootViewController that you set in GADBannerView. Use this UIViewController to show a modal
***REMOVED***/ view when a user taps on the ad.
@property(nonatomic, readonly) UIViewController *viewControllerForPresentingModalView;

***REMOVED***/ When you call the following methods, the call will be propagated back to the
***REMOVED***/ GADBannerViewDelegate that you implemented and passed to GADBannerView.

***REMOVED***/ Your Custom Event should call this when the user taps an ad and a modal view appears.
- (void)customEventBannerWillPresentModal:(id<GADCustomEventBanner>)customEvent;

***REMOVED***/ Your Custom Event should call this when the user dismisses the modal view and the modal view is
***REMOVED***/ about to go away.
- (void)customEventBannerWillDismissModal:(id<GADCustomEventBanner>)customEvent;

***REMOVED***/ Your Custom Event should call this when the user dismisses the modal view and the modal view has
***REMOVED***/ gone away.
- (void)customEventBannerDidDismissModal:(id<GADCustomEventBanner>)customEvent;

***REMOVED***/ Your Custom Event should call this method when a user action will result in App switching.
- (void)customEventBannerWillLeaveApplication:(id<GADCustomEventBanner>)customEvent;

#pragma mark Deprecated

***REMOVED***/ Deprecated. Use customEventBannerWasClicked:.
- (void)customEventBanner:(id<GADCustomEventBanner>)customEvent
        clickDidOccurInAd:(UIView *)view
    GAD_DEPRECATED_MSG_ATTRIBUTE("Use customEventBannerWasClicked:.");

***REMOVED***

GAD_ASSUME_NONNULL_END
