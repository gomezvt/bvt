***REMOVED***
***REMOVED***  GADNativeAdViewAdOptions.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2016 Google Inc. All rights reserved.
***REMOVED***

#import <GoogleMobileAds/GADAdLoader.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Position of the AdChoices icon in the containing ad.
typedef NS_ENUM(NSInteger, GADAdChoicesPosition) ***REMOVED***
  GADAdChoicesPositionTopRightCorner,     ***REMOVED***/< Top right corner.
  GADAdChoicesPositionTopLeftCorner,      ***REMOVED***/< Top left corner.
  GADAdChoicesPositionBottomRightCorner,  ***REMOVED***/< Bottom right corner.
  GADAdChoicesPositionBottomLeftCorner    ***REMOVED***/< Bottom Left Corner.
***REMOVED***;

***REMOVED***/ Ad loader options for configuring the view of native ads.
@interface GADNativeAdViewAdOptions : GADAdLoaderOptions

***REMOVED***/ Indicates preferred location of AdChoices icon. Default is GADAdChoicesPositionTopRightCorner.
@property(nonatomic, assign) GADAdChoicesPosition preferredAdChoicesPosition;

***REMOVED***

GAD_ASSUME_NONNULL_END
