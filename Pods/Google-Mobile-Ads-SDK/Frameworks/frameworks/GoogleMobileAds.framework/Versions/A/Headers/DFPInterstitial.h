***REMOVED***
***REMOVED***  DFPInterstitial.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2012 Google Inc. All rights reserved.
***REMOVED***

#import <GoogleMobileAds/DFPCustomRenderedInterstitialDelegate.h>
#import <GoogleMobileAds/GADAppEventDelegate.h>
#import <GoogleMobileAds/GADCorrelator.h>
#import <GoogleMobileAds/GADInterstitial.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ DoubleClick For Publishers interstitial ad, a full-screen advertisement shown at natural
***REMOVED***/ transition points in your application such as between game levels or news stories.
@interface DFPInterstitial : GADInterstitial

***REMOVED***/ Required value created on the DFP website. Create a new ad unit for every unique placement of an
***REMOVED***/ ad in your application. Set this to the ID assigned for this placement. Ad units are important
***REMOVED***/ for targeting and stats.
***REMOVED***/
***REMOVED***/ Example DFP ad unit ID: @"/6499/example/interstitial"
@property(nonatomic, readonly, copy) NSString *adUnitID;

***REMOVED***/ Correlator object for correlating this object to other ad objects.
@property(nonatomic, strong, GAD_NULLABLE) GADCorrelator *correlator;

***REMOVED***/ Optional delegate that is notified when creatives send app events.
@property(nonatomic, weak, GAD_NULLABLE) id<GADAppEventDelegate> appEventDelegate;

***REMOVED***/ Optional delegate object for custom rendered ads.
@property(nonatomic, weak, GAD_NULLABLE)
    id<DFPCustomRenderedInterstitialDelegate> customRenderedInterstitialDelegate;

***REMOVED***

GAD_ASSUME_NONNULL_END
