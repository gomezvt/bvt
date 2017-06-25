***REMOVED***
***REMOVED***  GADMediatedNativeAd.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>

#import <GoogleMobileAds/GADMediatedNativeAdDelegate.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Base protocol for mediated native ads.
@protocol GADMediatedNativeAd<NSObject>

***REMOVED***/ Returns a delegate object that receives state change notifications.
- (nullable id<GADMediatedNativeAdDelegate>)mediatedNativeAdDelegate;

***REMOVED***/ Returns a dictionary of asset names and object pairs for assets that are not handled by
***REMOVED***/ properties of the GADMediatedNativeAd subclass.
- (NSDictionary *GAD_NULLABLE_TYPE)extraAssets;

***REMOVED***

GAD_ASSUME_NONNULL_END
