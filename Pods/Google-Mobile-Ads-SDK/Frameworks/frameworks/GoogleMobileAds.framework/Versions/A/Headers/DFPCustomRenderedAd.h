***REMOVED***
***REMOVED***  DFPCustomRenderedAd.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2014 Google Inc. All rights reserved.
***REMOVED***

#import <UIKit/UIKit.h>

#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Custom rendered ad. Your application renders the ad.
@interface DFPCustomRenderedAd : NSObject

***REMOVED***/ The ad's HTML.
@property(nonatomic, readonly, copy) NSString *adHTML;

***REMOVED***/ The base URL of the ad's HTML.
@property(nonatomic, readonly, copy) NSURL *adBaseURL;

***REMOVED***/ Call this method when the user clicks the ad.
- (void)recordClick;

***REMOVED***/ Call this method when the ad is visible to the user.
- (void)recordImpression;

***REMOVED***/ Call this method after the ad has been rendered in a UIView object.
- (void)finishedRenderingAdView:(UIView *)view;

***REMOVED***

GAD_ASSUME_NONNULL_END
