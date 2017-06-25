***REMOVED***
***REMOVED***  GADMediatedNativeContentAd.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>

#import <GoogleMobileAds/GADMediatedNativeAd.h>
#import <GoogleMobileAds/GADNativeAdImage.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Provides methods used for constructing native content ads.
@protocol GADMediatedNativeContentAd<GADMediatedNativeAd>

***REMOVED***/ Primary text headline.
- (NSString *GAD_NULLABLE_TYPE)headline;

***REMOVED***/ Secondary text.
- (NSString *GAD_NULLABLE_TYPE)body;

***REMOVED***/ List of large images. Each object is an instance of GADNativeAdImage.
- (NSArray *GAD_NULLABLE_TYPE)images;

***REMOVED***/ Small logo image.
- (GADNativeAdImage *GAD_NULLABLE_TYPE)logo;

***REMOVED***/ Text that encourages user to take some action with the ad.
- (NSString *GAD_NULLABLE_TYPE)callToAction;

***REMOVED***/ Identifies the advertiser. For example, the advertiser’s name or visible URL.
- (NSString *GAD_NULLABLE_TYPE)advertiser;

@optional

***REMOVED***/ AdChoices view.
- (UIView *GAD_NULLABLE_TYPE)adChoicesView;

***REMOVED***

GAD_ASSUME_NONNULL_END
