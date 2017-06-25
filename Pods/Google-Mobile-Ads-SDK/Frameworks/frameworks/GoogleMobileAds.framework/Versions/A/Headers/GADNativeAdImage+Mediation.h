***REMOVED***
***REMOVED***  GADNativeAdImage+Mediation.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google. All rights reserved.
***REMOVED***

#import <GoogleMobileAds/GADNativeAdImage.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Provides additional GADNativeAdImage initializers.
@interface GADNativeAdImage (MediationAdditions)

***REMOVED***/ Initializes and returns a native ad image object with the provided image.
- (instancetype)initWithImage:(UIImage *)image;

***REMOVED***/ Initializes and returns a native ad image object with the provided image URL and image scale.
- (instancetype)initWithURL:(NSURL *)URL scale:(CGFloat)scale;

***REMOVED***

GAD_ASSUME_NONNULL_END
