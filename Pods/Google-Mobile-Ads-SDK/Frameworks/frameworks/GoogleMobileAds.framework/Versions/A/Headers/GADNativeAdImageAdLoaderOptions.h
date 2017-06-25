***REMOVED***
***REMOVED***  GADNativeAdImageAdLoaderOptions.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google Inc. All rights reserved.
***REMOVED***

#import <GoogleMobileAds/GADAdLoader.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Native ad image orientation preference.
typedef NS_ENUM(NSInteger, GADNativeAdImageAdLoaderOptionsOrientation) ***REMOVED***
  GADNativeAdImageAdLoaderOptionsOrientationAny = 1,       ***REMOVED***/< No orientation preference.
  GADNativeAdImageAdLoaderOptionsOrientationPortrait = 2,  ***REMOVED***/< Prefer portrait images.
  GADNativeAdImageAdLoaderOptionsOrientationLandscape = 3  ***REMOVED***/< Prefer landscape images.
***REMOVED***;

***REMOVED***/ Ad loader options for native ad image settings.
@interface GADNativeAdImageAdLoaderOptions : GADAdLoaderOptions

***REMOVED***/ Indicates if image asset content should be loaded by the SDK. If set to YES, the SDK will not
***REMOVED***/ load image asset content and native ad image URLs can be used to fetch content. Defaults to NO,
***REMOVED***/ image assets are loaded by the SDK.
@property(nonatomic, assign) BOOL disableImageLoading;

***REMOVED***/ Indicates if multiple images should be loaded for each asset. Defaults to NO.
@property(nonatomic, assign) BOOL shouldRequestMultipleImages;

***REMOVED***/ Indicates preferred image orientation. Defaults to
***REMOVED***/ GADNativeAdImageAdLoaderOptionsOrientationAny.
@property(nonatomic, assign) GADNativeAdImageAdLoaderOptionsOrientation preferredImageOrientation;

***REMOVED***

GAD_ASSUME_NONNULL_END
