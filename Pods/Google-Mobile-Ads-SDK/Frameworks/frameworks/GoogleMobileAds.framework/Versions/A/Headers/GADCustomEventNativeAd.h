***REMOVED***
***REMOVED***  GADCustomEventNativeAd.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>

#import <GoogleMobileAds/GADCustomEventRequest.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

@protocol GADCustomEventNativeAdDelegate;

***REMOVED***/ Native ad custom event protocol. Your native ad custom event handler class must conform to this
***REMOVED***/ protocol.
@protocol GADCustomEventNativeAd<NSObject>

***REMOVED***/ Called when the custom event is scheduled to be executed.
***REMOVED***/
***REMOVED***/ @param serverParameter A value configured in the mediation UI for the custom event.
***REMOVED***/ @param request Ad targeting information.
***REMOVED***/ @param adTypes List of requested native ad types. See GADAdLoaderAdTypes.h for available ad
***REMOVED***/ types.
***REMOVED***/ @param options Additional options configured by the publisher for requesting a native ad. See
***REMOVED***/ GADNativeAdImageAdLoaderOptions.h for available image options.
***REMOVED***/ @param rootViewController Publisher-provided view controller.
- (void)requestNativeAdWithParameter:(NSString *)serverParameter
                             request:(GADCustomEventRequest *)request
                             adTypes:(NSArray *)adTypes
                             options:(NSArray *)options
                  rootViewController:(UIViewController *)rootViewController;

***REMOVED***/ Indicates if the custom event handles user clicks. Return YES if the custom event should handle
***REMOVED***/ user clicks. In this case, the Google Mobile Ads SDK doesn't track user clicks and the custom
***REMOVED***/ event must notify the Google Mobile Ads SDK of clicks using
***REMOVED***/ +[GADMediatedNativeAdNotificationSource mediatedNativeAdDidRecordClick:]. Return NO if the
***REMOVED***/ custom event doesn't handles user clicks. In this case, the Google Mobile Ads SDK tracks user
***REMOVED***/ clicks itself and the custom event is notified of user clicks via -[GADMediatedNativeAdDelegate
***REMOVED***/ mediatedNativeAd:didRecordClickOnAssetWithName:view:viewController:].
- (BOOL)handlesUserClicks;

***REMOVED***/ Indicates if the custom event handles user impressions tracking. If this method returns YES, the
***REMOVED***/ Google Mobile Ads SDK will not track user impressions and the custom event must notify the
***REMOVED***/ Google Mobile Ads SDK of impressions using +[GADMediatedNativeAdNotificationSource
***REMOVED***/ mediatedNativeAdDidRecordImpression:]. If this method returns NO,
***REMOVED***/ the Google Mobile Ads SDK tracks user impressions and notifies the custom event of impressions
***REMOVED***/ using -[GADMediatedNativeAdDelegate mediatedNativeAdDidRecordImpression:].
- (BOOL)handlesUserImpressions;

***REMOVED***/ Delegate object used for receiving custom native ad load request progress.
@property(nonatomic, weak, GAD_NULLABLE) id<GADCustomEventNativeAdDelegate> delegate;

***REMOVED***

GAD_ASSUME_NONNULL_END
