***REMOVED***
***REMOVED***  DFPBannerViewOptions.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright © 2016 Google Inc. All rights reserved.
***REMOVED***

#import <GoogleMobileAds/GADAdLoader.h>
#import <GoogleMobileAds/GADAdSize.h>
#import <GoogleMobileAds/GADAdSizeDelegate.h>
#import <GoogleMobileAds/GADAppEventDelegate.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Ad loader options for banner ads.
@interface DFPBannerViewOptions : GADAdLoaderOptions

***REMOVED***/ Optional delegate that is notified if the loaded banner sends app events.
@property(nonatomic, weak, GAD_NULLABLE) id<GADAppEventDelegate> appEventDelegate;

***REMOVED***/ Optional delegate that is notified if the loaded banner changes size.
@property(nonatomic, weak, GAD_NULLABLE) id<GADAdSizeDelegate> adSizeDelegate;

***REMOVED***/ Whether the publisher will record impressions manually when the ad becomes visible to the user.
@property(nonatomic, assign) BOOL enableManualImpressions;

***REMOVED***

GAD_ASSUME_NONNULL_END
