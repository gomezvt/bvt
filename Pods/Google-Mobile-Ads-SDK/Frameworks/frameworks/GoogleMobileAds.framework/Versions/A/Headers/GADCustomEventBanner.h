***REMOVED***
***REMOVED***  GADCustomEventBanner.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2012 Google Inc. All rights reserved.
***REMOVED***

#import <UIKit/UIKit.h>

#import <GoogleMobileAds/GADAdSize.h>
#import <GoogleMobileAds/GADCustomEventBannerDelegate.h>
#import <GoogleMobileAds/GADCustomEventRequest.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ The banner custom event protocol. Your banner custom event handler must implement this protocol.
@protocol GADCustomEventBanner<NSObject>

***REMOVED***/ Inform |delegate| with the custom event execution results to ensure mediation behaves correctly.
***REMOVED***/
***REMOVED***/ In your class, define the -delegate and -setDelegate: methods or use "@synthesize delegate". The
***REMOVED***/ Google Mobile Ads SDK sets this property on instances of your class.
@property(nonatomic, weak, GAD_NULLABLE) id<GADCustomEventBannerDelegate> delegate;

***REMOVED***/ Called by mediation when your custom event is scheduled to be executed. Report execution results
***REMOVED***/ to the delegate.
***REMOVED***/
***REMOVED***/ @param adSize The size of the ad as configured in the mediation UI for the mediation placement.
***REMOVED***/ @param serverParameter Parameter configured in the mediation UI.
***REMOVED***/ @param serverLabel Label configured in the mediation UI.
***REMOVED***/ @param request Contains ad request information.
- (void)requestBannerAd:(GADAdSize)adSize
              parameter:(NSString *GAD_NULLABLE_TYPE)serverParameter
                  label:(NSString *GAD_NULLABLE_TYPE)serverLabel
                request:(GADCustomEventRequest *)request;

***REMOVED***

GAD_ASSUME_NONNULL_END
