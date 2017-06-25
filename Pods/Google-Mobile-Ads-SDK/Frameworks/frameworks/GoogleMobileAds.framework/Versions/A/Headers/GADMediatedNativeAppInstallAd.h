***REMOVED***
***REMOVED***  GADMediatedNativeAppInstallAd.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>

#import <GoogleMobileAds/GADMediatedNativeAd.h>
#import <GoogleMobileAds/GADNativeAdImage.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Provides methods used for constructing native app install ads. The adapter must return an object
***REMOVED***/ conforming to this protocol for native app install ad requests.
@protocol GADMediatedNativeAppInstallAd<GADMediatedNativeAd>

***REMOVED***/ App title.
- (NSString *GAD_NULLABLE_TYPE)headline;

***REMOVED***/ Array of GADNativeAdImage objects related to the advertised application.
- (NSArray *GAD_NULLABLE_TYPE)images;

***REMOVED***/ App description.
- (NSString *GAD_NULLABLE_TYPE)body;

***REMOVED***/ Application icon.
- (GADNativeAdImage *GAD_NULLABLE_TYPE)icon;

***REMOVED***/ Text that encourages user to take some action with the ad. For example "Install".
- (NSString *GAD_NULLABLE_TYPE)callToAction;

***REMOVED***/ App store rating (0 to 5).
- (NSDecimalNumber *GAD_NULLABLE_TYPE)starRating;

***REMOVED***/ The app store name. For example, "App Store".
- (NSString *GAD_NULLABLE_TYPE)store;

***REMOVED***/ String representation of the app's price.
- (NSString *GAD_NULLABLE_TYPE)price;

@optional

***REMOVED***/ AdChoices view.
- (UIView *GAD_NULLABLE_TYPE)adChoicesView;

***REMOVED***

GAD_ASSUME_NONNULL_END
