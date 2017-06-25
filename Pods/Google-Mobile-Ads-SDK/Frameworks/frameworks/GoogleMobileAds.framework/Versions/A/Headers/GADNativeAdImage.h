***REMOVED***
***REMOVED***  GADNativeAdImage.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Native ad image.
@interface GADNativeAdImage : NSObject

***REMOVED***/ The image. If image autoloading is disabled, this property will be nil.
@property(nonatomic, readonly, strong, GAD_NULLABLE) UIImage *image;

***REMOVED***/ The image's URL.
@property(nonatomic, readonly, copy) NSURL *imageURL;

***REMOVED***/ The image's scale.
@property(nonatomic, readonly, assign) CGFloat scale;

***REMOVED***

GAD_ASSUME_NONNULL_END
