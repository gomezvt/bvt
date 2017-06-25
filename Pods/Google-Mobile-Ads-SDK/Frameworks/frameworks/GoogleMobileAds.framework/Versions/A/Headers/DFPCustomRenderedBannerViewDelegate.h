***REMOVED***
***REMOVED***  DFPCustomRenderedBannerViewDelegate.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2014 Google Inc. All rights reserved.
***REMOVED***

#import <UIKit/UIKit.h>

#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

@class DFPBannerView;
@class DFPCustomRenderedAd;

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ The DFPCustomRenderedAd banner view delegate protocol for notifying the delegate of changes to
***REMOVED***/ custom rendered banners.
@protocol DFPCustomRenderedBannerViewDelegate<NSObject>

***REMOVED***/ Called after ad data has been received. You must construct a banner from |customRenderedAd| and
***REMOVED***/ call the |customRenderedAd| object's finishedRenderingAdView: when the ad has been rendered.
- (void)bannerView:(DFPBannerView *)bannerView
    didReceiveCustomRenderedAd:(DFPCustomRenderedAd *)customRenderedAd;

***REMOVED***

GAD_ASSUME_NONNULL_END
