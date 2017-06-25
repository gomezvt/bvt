***REMOVED***
***REMOVED***  GADMAdNetworkConnectorProtocol.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2011 Google. All rights reserved.
***REMOVED***

#import <GoogleMobileAds/GoogleMobileAds.h>
#import <UIKit/UIKit.h>

#import "GADMediationAdRequest.h"

@protocol GADMAdNetworkAdapter;

***REMOVED***/ Ad network adapters interact with the mediation SDK using an object that implements the
***REMOVED***/ GADMAdNetworkConnector protocol. The connector object can be used to obtain necessary
***REMOVED***/ information for ad requests, and to call back to the mediation SDK on ad request returns and
***REMOVED***/ user interactions.
@protocol GADMAdNetworkConnector<GADMediationAdRequest>

***REMOVED***/ When you need to show a landing page or any other modal view, such as when a user clicks or when
***REMOVED***/ your Ads SDK needs to show an interstitial, use this method to obtain a UIViewController that
***REMOVED***/ you can use to show your modal view. Call the -presentViewController:animated:completion: method
***REMOVED***/ of the returned UIViewController .
- (UIViewController *)viewControllerForPresentingModalView;

#pragma mark - Adapter Callbacks

***REMOVED***/ Tells the connector that the adapter failed to receive an ad.
- (void)adapter:(id<GADMAdNetworkAdapter>)adapter didFailAd:(NSError *)error;

***REMOVED***/ Tells the connector that the adapter received a banner ad.
- (void)adapter:(id<GADMAdNetworkAdapter>)adapter didReceiveAdView:(UIView *)view;

***REMOVED***/ Tells the connector that the adapter received an interstitial.
- (void)adapterDidReceiveInterstitial:(id<GADMAdNetworkAdapter>)adapter;

***REMOVED***/ Tells the connector that the adapter has received a mediated native ad. |mediatedNativeAd| is
***REMOVED***/ used by the Google Mobile Ads SDK for constructing a native ad object.
- (void)adapter:(id<GADMAdNetworkAdapter>)adapter
    didReceiveMediatedNativeAd:(id<GADMediatedNativeAd>)mediatedNativeAd;

#pragma mark Ad events

***REMOVED*** Adapter should call as many of these as possible, during the lifecycle of the loaded banner or
***REMOVED*** interstitial ad.

***REMOVED***/ Tells the connector that the adapter recorded a user click.
- (void)adapterDidGetAdClick:(id<GADMAdNetworkAdapter>)adapter;
***REMOVED***/ Tells the connector that the adapter will leave the application because of a user action.
- (void)adapterWillLeaveApplication:(id<GADMAdNetworkAdapter>)adapter;

***REMOVED*** Adapter should call as many of these as possible, during the lifecycle of the loaded banner ad.

***REMOVED***/ Tells the connector that the adapter will present a full screen modal.
- (void)adapterWillPresentFullScreenModal:(id<GADMAdNetworkAdapter>)adapter;
***REMOVED***/ Tells the connector that the adapter will dismiss a full screen modal.
- (void)adapterWillDismissFullScreenModal:(id<GADMAdNetworkAdapter>)adapter;
***REMOVED***/ Tells the connector that the adapter dismissed a full screen modal.
- (void)adapterDidDismissFullScreenModal:(id<GADMAdNetworkAdapter>)adapter;

***REMOVED*** Adapter should call these methods during the lifecycle of the loaded interstitial ad.

***REMOVED***/ Tells the connector that the adapter will present an interstitial.
- (void)adapterWillPresentInterstitial:(id<GADMAdNetworkAdapter>)adapter;
***REMOVED***/ Tells the connector that the adapter will dismiss an interstitial.
- (void)adapterWillDismissInterstitial:(id<GADMAdNetworkAdapter>)adapter;
***REMOVED***/ Tells the connector that the adapter did dismiss an interstitial.
- (void)adapterDidDismissInterstitial:(id<GADMAdNetworkAdapter>)adapter;

#pragma mark Deprecated

***REMOVED***/ Deprecated. Use -adapterDidReceiveInterstitial:.
- (void)adapter:(id<GADMAdNetworkAdapter>)adapter
    didReceiveInterstitial:(NSObject *)interstitial
    GAD_DEPRECATED_MSG_ATTRIBUTE("Use -adapterDidReceiveInterstitial:.");

***REMOVED***/ Deprecated. Use -adapterDidGetAdClick:.
- (void)adapter:(id<GADMAdNetworkAdapter>)adapter
    clickDidOccurInBanner:(UIView *)view
    GAD_DEPRECATED_MSG_ATTRIBUTE("Use -adapterDidGetAdClick:.");

***REMOVED***/ Deprecated. Use -adapter:didFailAd:.
- (void)adapter:(id<GADMAdNetworkAdapter>)adapter
    didFailInterstitial:(NSError *)error GAD_DEPRECATED_MSG_ATTRIBUTE("Use -adapter:didFailAd:");

***REMOVED***
