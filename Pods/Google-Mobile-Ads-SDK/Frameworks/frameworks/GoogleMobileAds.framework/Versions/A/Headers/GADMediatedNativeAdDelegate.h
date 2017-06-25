***REMOVED***
***REMOVED***  GADMediatedNativeAdDelegate.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

@protocol GADMediatedNativeAd;

***REMOVED***/ GADMediatedNativeAdDelegate objects handle mediated native ad events.
@protocol GADMediatedNativeAdDelegate<NSObject>

@optional

***REMOVED***/ Tells the delegate that the mediated native ad has rendered in |view|, a subview of
***REMOVED***/ |viewController|.
- (void)mediatedNativeAd:(id<GADMediatedNativeAd>)mediatedNativeAd
         didRenderInView:(UIView *)view
          viewController:(UIViewController *)viewController;

***REMOVED***/ Tells the delegate that the mediated native ad has recorded an impression. This method is called
***REMOVED***/ only once per mediated native ad.
- (void)mediatedNativeAdDidRecordImpression:(id<GADMediatedNativeAd>)mediatedNativeAd;

***REMOVED***/ Tells the delegate that the mediated native ad has recorded a user click on the asset named
***REMOVED***/ |assetName|. Full screen actions should be presented from |viewController|. This method is
***REMOVED***/ called only if -[GADMAdNetworkAdapter handlesUserClicks] returns NO.
- (void)mediatedNativeAd:(id<GADMediatedNativeAd>)mediatedNativeAd
    didRecordClickOnAssetWithName:(NSString *)assetName
                             view:(UIView *)view
                   viewController:(UIViewController *)viewController;

***REMOVED***/ Tells the delegate that the mediated native ad has untracked |view|. This method is called
***REMOVED***/ when the mediatedNativeAd is no longer rendered in the provided view and the delegate should
***REMOVED***/ stop tracking the view's impressions and clicks.
- (void)mediatedNativeAd:(id<GADMediatedNativeAd>)mediatedNativeAd didUntrackView:(UIView *)view;

***REMOVED***

GAD_ASSUME_NONNULL_END
