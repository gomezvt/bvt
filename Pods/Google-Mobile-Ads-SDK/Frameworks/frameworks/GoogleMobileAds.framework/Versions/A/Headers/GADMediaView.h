***REMOVED***
***REMOVED***  GADMediaView.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2016 Google Inc. All rights reserved.
***REMOVED***

#import <UIKit/UIKit.h>

#import <GoogleMobileAds/GADNativeAd.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Displays native ad media assets.
***REMOVED***/
***REMOVED***/ To display media assets in GADNativeAppInstallAdView instances, add a GADMediaView subview and
***REMOVED***/ assign the native ad view's mediaView property.
***REMOVED***/
***REMOVED***/ If the native ad doesn't contain a video and image loading is enabled, the GADMediaView displays
***REMOVED***/ the native ad's |images| asset's first image.
***REMOVED***/
***REMOVED***/ If the native ad doesn't contain a video and image loading is disabled, the GADMediaView object
***REMOVED***/ is empty.
@interface GADMediaView : UIView

***REMOVED***/ Native ad object that contains the AdChoices asset. Set this property to populate this view's
***REMOVED***/ content.
@property(nonatomic, weak) GADNativeAd *nativeAd;

***REMOVED***

GAD_ASSUME_NONNULL_END
