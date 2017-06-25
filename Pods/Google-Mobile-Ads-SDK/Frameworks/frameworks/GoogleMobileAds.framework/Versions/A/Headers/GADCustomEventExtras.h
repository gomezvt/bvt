***REMOVED***
***REMOVED***  GADCustomEventExtras.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2012 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>

#import <GoogleMobileAds/GADAdNetworkExtras.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Create an instance of this class to set additional parameters for each custom event object. The
***REMOVED***/ additional parameters for a custom event are keyed by the custom event label. These extras are
***REMOVED***/ passed to your implementation of GADCustomEventBanner or GADCustomEventInterstitial.
@interface GADCustomEventExtras : NSObject<GADAdNetworkExtras>

***REMOVED***/ Set additional parameters for the custom event with label |label|. To remove additional
***REMOVED***/ parameters associated with |label|, pass in nil for |extras|.
- (void)setExtras:(NSDictionary *GAD_NULLABLE_TYPE)extras forLabel:(NSString *)label;

***REMOVED***/ Retrieve the extras for |label|.
- (NSDictionary *GAD_NULLABLE_TYPE)extrasForLabel:(NSString *)label;

***REMOVED***/ Removes all the extras set on this instance.
- (void)removeAllExtras;

***REMOVED***/ Returns all the extras set on this instance.
- (NSDictionary *)allExtras;

***REMOVED***

GAD_ASSUME_NONNULL_END
