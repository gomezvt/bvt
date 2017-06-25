***REMOVED***
***REMOVED***  DFPRequest.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2014 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>

#import <GoogleMobileAds/GADRequest.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Add this constant to the testDevices property's array to receive test ads on the simulator.
GAD_EXTERN const id kDFPSimulatorID;

***REMOVED***/ Specifies optional parameters for ad requests.
@interface DFPRequest : GADRequest

***REMOVED***/ Publisher provided user ID.
@property(nonatomic, copy, GAD_NULLABLE) NSString *publisherProvidedID;

***REMOVED***/ Array of strings used to exclude specified categories in ad results.
@property(nonatomic, copy, GAD_NULLABLE) NSArray *categoryExclusions;

***REMOVED***/ Key-value pairs used for custom targeting.
@property(nonatomic, copy, GAD_NULLABLE) NSDictionary *customTargeting;

***REMOVED***/ This API is deprecated and a no-op, use an instance of GADCorrelator set on DFPInterstitial or
***REMOVED***/ DFPBannerView objects to correlate requests.
+ (void)updateCorrelator GAD_DEPRECATED_MSG_ATTRIBUTE(
    "Set GADCorrelator objects on your ads instead. This method no longer affects ad correlation.");

***REMOVED***

GAD_ASSUME_NONNULL_END
