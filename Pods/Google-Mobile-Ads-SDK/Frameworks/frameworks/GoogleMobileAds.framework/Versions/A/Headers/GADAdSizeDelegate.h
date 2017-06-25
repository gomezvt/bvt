***REMOVED***
***REMOVED***  GADAdSizeDelegate.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2012 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>

#import <GoogleMobileAds/GADAdSize.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

@class GADBannerView;

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ The class implementing this protocol will be notified when the DFPBannerView changes ad size.
***REMOVED***/ Any views that may be affected by the banner size change will have time to adjust.
@protocol GADAdSizeDelegate<NSObject>

***REMOVED***/ Called before the ad view changes to the new size.
- (void)adView:(GADBannerView *)bannerView willChangeAdSizeTo:(GADAdSize)size;

***REMOVED***

GAD_ASSUME_NONNULL_END
