***REMOVED***
***REMOVED***  GADAppEventDelegate.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2012 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>

#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

@class GADBannerView;
@class GADInterstitial;

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Implement your app event within these methods. The delegate will be notified when the SDK
***REMOVED***/ receives an app event message from the ad.
@protocol GADAppEventDelegate<NSObject>

@optional

***REMOVED***/ Called when the banner receives an app event.
- (void)adView:(GADBannerView *)banner
    didReceiveAppEvent:(NSString *)name
              withInfo:(NSString *GAD_NULLABLE_TYPE)info;

***REMOVED***/ Called when the interstitial receives an app event.
- (void)interstitial:(GADInterstitial *)interstitial
    didReceiveAppEvent:(NSString *)name
              withInfo:(NSString *GAD_NULLABLE_TYPE)info;

***REMOVED***

GAD_ASSUME_NONNULL_END
