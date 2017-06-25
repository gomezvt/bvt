***REMOVED***
***REMOVED***  GADAdLoaderAdTypes.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>

#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Use with GADAdLoader to request native app install ads. To receive ads, the ad loader's delegate
***REMOVED***/ must conform to the GADNativeAppInstallAdLoaderDelegate protocol. See GADNativeAppInstallAd.h.
***REMOVED***/
***REMOVED***/ See GADNativeAdImageAdLoaderOptions.h for ad loader image options.
GAD_EXTERN NSString *const kGADAdLoaderAdTypeNativeAppInstall;

***REMOVED***/ Use with GADAdLoader to request native content ads. To receive ads, the ad loader's delegate
***REMOVED***/ must conform to the GADNativeContentAdLoaderDelegate protocol. See GADNativeContentAd.h.
***REMOVED***/
***REMOVED***/ See GADNativeAdImageAdLoaderOptions.h for ad loader image options.
GAD_EXTERN NSString *const kGADAdLoaderAdTypeNativeContent;

***REMOVED***/ Use with GADAdLoader to request native custom template ads. To receive ads, the ad loader's
***REMOVED***/ delegate must conform to the GADNativeCustomTemplateAdLoaderDelegate protocol. See
***REMOVED***/ GADNativeCustomTemplateAd.h.
GAD_EXTERN NSString *const kGADAdLoaderAdTypeNativeCustomTemplate;

***REMOVED***/ Use with GADAdLoader to request DFP banner ads. To receive ads, the ad loader's delegate must
***REMOVED***/ conform to the DFPBannerAdLoaderDelegate protocol. See DFPBannerView.h.
GAD_EXTERN NSString *const kGADAdLoaderAdTypeDFPBanner;

GAD_ASSUME_NONNULL_END
