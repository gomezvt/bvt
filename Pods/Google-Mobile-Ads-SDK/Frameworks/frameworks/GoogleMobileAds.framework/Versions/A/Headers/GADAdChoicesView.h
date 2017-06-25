***REMOVED***
***REMOVED***  GADAdChoicesView.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2016 Google Inc. All rights reserved.
***REMOVED***

#import <UIKit/UIKit.h>

#import <GoogleMobileAds/GADNativeAd.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Displays AdChoices content.
***REMOVED***/
***REMOVED***/ If a GADAdChoicesView is set on GADNativeAppInstallAdView or GADNativeContentAdView prior to
***REMOVED***/ calling -setNativeAppInstallAd: or -setNativeContentAd:, AdChoices content will render inside
***REMOVED***/ the GADAdChoicesView. By default, AdChoices is placed in the top right corner of
***REMOVED***/ GADNativeAppInstallAdView and GADNativeContentAdView.
@interface GADAdChoicesView : UIView

***REMOVED***/ Native ad object that contains the AdChoices asset. Set this property to populate this view's
***REMOVED***/ content.
@property(nonatomic, weak) GADNativeAd *nativeAd;

***REMOVED***

GAD_ASSUME_NONNULL_END
