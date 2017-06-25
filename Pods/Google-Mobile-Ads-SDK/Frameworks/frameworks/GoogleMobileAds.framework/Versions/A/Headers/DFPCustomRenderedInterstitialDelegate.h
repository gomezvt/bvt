***REMOVED***
***REMOVED***  DFPCustomRenderedInterstitialDelegate.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2014 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>

#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

@class DFPCustomRenderedAd;
@class DFPInterstitial;

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ The DFPCustomRenderedAd interstitial delegate protocol for notifying the delegate of changes to
***REMOVED***/ custom rendered interstitials.
@protocol DFPCustomRenderedInterstitialDelegate<NSObject>

***REMOVED***/ Called after ad data has been received. You must construct an interstitial from
***REMOVED***/ |customRenderedAd| and call the |customRenderedAd| object's finishedRenderingAdView: method when
***REMOVED***/ the ad has been rendered.
- (void)interstitial:(DFPInterstitial *)interstitial
    didReceiveCustomRenderedAd:(DFPCustomRenderedAd *)customRenderedAd;

***REMOVED***

GAD_ASSUME_NONNULL_END
