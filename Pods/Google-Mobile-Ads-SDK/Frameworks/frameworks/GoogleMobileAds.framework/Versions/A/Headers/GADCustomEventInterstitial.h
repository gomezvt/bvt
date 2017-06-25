***REMOVED***
***REMOVED***  GADCustomEventInterstitial.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2012 Google Inc. All rights reserved.
***REMOVED***

#import <UIKit/UIKit.h>

#import <GoogleMobileAds/GADCustomEventInterstitialDelegate.h>
#import <GoogleMobileAds/GADCustomEventRequest.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ The interstitial custom event protocol. Your interstitial custom event handler must implement
***REMOVED***/ this protocol.
@protocol GADCustomEventInterstitial<NSObject>

***REMOVED***/ Inform |delegate| with the custom event execution results to ensure mediation behaves correctly.
***REMOVED***/
***REMOVED***/ In your class, define the -delegate and -setDelegate: methods or use "@synthesize delegate". The
***REMOVED***/ Google Mobile Ads SDK sets this property on instances of your class.
@property(nonatomic, weak, GAD_NULLABLE) id<GADCustomEventInterstitialDelegate> delegate;

***REMOVED***/ Called by mediation when your custom event is scheduled to be executed. Your implementation
***REMOVED***/ should start retrieving the interstitial ad. Report execution results to the delegate. You must
***REMOVED***/ wait until -presentFromRootViewController is called before displaying the interstitial ad.
***REMOVED***/
***REMOVED***/ @param serverParameter Parameter configured in the mediation UI.
***REMOVED***/ @param serverLabel Label configured in the mediation UI.
***REMOVED***/ @param request Contains ad request information.
- (void)requestInterstitialAdWithParameter:(NSString *GAD_NULLABLE_TYPE)serverParameter
                                     label:(NSString *GAD_NULLABLE_TYPE)serverLabel
                                   request:(GADCustomEventRequest *)request;

***REMOVED***/ Present the interstitial ad as a modal view using the provided view controller. Called only
***REMOVED***/ after your class calls -customEventInterstitialDidReceiveAd: on its custom event delegate.
- (void)presentFromRootViewController:(UIViewController *)rootViewController;

***REMOVED***

GAD_ASSUME_NONNULL_END
