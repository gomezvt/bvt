***REMOVED***
***REMOVED***  GADCorrelatorAdLoaderOptions.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google Inc. All rights reserved.
***REMOVED***

#import <GoogleMobileAds/GADAdLoader.h>
#import <GoogleMobileAds/GADCorrelator.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Ad loader options for adding a correlator to a native ad request.
@interface GADCorrelatorAdLoaderOptions : GADAdLoaderOptions

***REMOVED***/ Correlator object for correlating ads loaded by an ad loader to other ad objects.
@property(nonatomic, strong, GAD_NULLABLE) GADCorrelator *correlator;

***REMOVED***

GAD_ASSUME_NONNULL_END
