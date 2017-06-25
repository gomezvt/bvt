***REMOVED***
***REMOVED***  GADMAdNetworkAdapterProtocol.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2011 Google. All rights reserved.
***REMOVED***

#import <GoogleMobileAds/GoogleMobileAds.h>

#import "GADMAdNetworkConnectorProtocol.h"
#import "GADMEnums.h"

***REMOVED***/ Subclasses should prefix their name with "GADMAdapter" example: GADMAdapterGoogleAdMobAds
#define kGADMAdapterClassNamePrefix @"GADMAdapter"

@protocol GADMAdNetworkConnector;

***REMOVED***/ Ad network adapter protocol.
@protocol GADMAdNetworkAdapter<NSObject>

***REMOVED***/ Returns a version string for the adapter. It can be any string that uniquely identifies the
***REMOVED***/ version of your adapter. For example, "1.0", or simply a date such as "20110915".
+ (NSString *)adapterVersion;

***REMOVED***/ The extras class that is used to specify additional parameters for a request to this ad network.
***REMOVED***/ Returns Nil if the network does not have extra settings for publishers to send.
+ (Class<GADAdNetworkExtras>)networkExtrasClass;

***REMOVED***/ Designated initializer. Implementing classes can and should keep the connector in an instance
***REMOVED***/ variable. However you must never retain the connector, as doing so will create a circular
***REMOVED***/ reference and cause memory leaks.
- (instancetype)initWithGADMAdNetworkConnector:(id<GADMAdNetworkConnector>)connector;

***REMOVED***/ Asks the adapter to initiate a banner ad request. The adapter does not need to return anything.
***REMOVED***/ The assumption is that the adapter will start an asynchronous ad fetch over the network. Your
***REMOVED***/ adapter may act as a delegate to your SDK to listen to callbacks. If your SDK does not support
***REMOVED***/ the given ad size, or does not support banner ads, call back to the adapter:didFailAd: method of
***REMOVED***/ the connector.
- (void)getBannerWithSize:(GADAdSize)adSize;

***REMOVED***/ Asks the adapter to initiate an interstitial ad request. The adapter does not need to return
***REMOVED***/ anything. The assumption is that the adapter will start an asynchronous ad fetch over the
***REMOVED***/ network. Your adapter may act as a delegate to your SDK to listen to callbacks. If your SDK does
***REMOVED***/ not support interstitials, call back to the adapter:didFailInterstitial: method of the
***REMOVED***/ connector.
- (void)getInterstitial;

***REMOVED***/ When called, the adapter must remove itself as a delegate or notification observer from the
***REMOVED***/ underlying ad network SDK. You should also call this method in your adapter dealloc, so when
***REMOVED***/ your adapter goes away, your SDK will not call a freed object. This function should be
***REMOVED***/ idempotent and should not crash regardless of when or how many times the method is called.
- (void)stopBeingDelegate;

***REMOVED***/ Some ad transition types may cause issues with particular Ad SDKs. The adapter may decide
***REMOVED***/ whether the given animation type is OK. Defaults to YES.
- (BOOL)isBannerAnimationOK:(GADMBannerAnimationType)animType;

***REMOVED***/ Present an interstitial using the supplied UIViewController, by calling
***REMOVED***/ presentViewController:animated:completion:.
***REMOVED***/
***REMOVED***/ Your interstitial should not immediately present itself when it is received. Instead, you should
***REMOVED***/ wait until this method is called on your adapter to present the interstitial.
***REMOVED***/
***REMOVED***/ Make sure to call adapterWillPresentInterstitial: on the connector when the interstitial is
***REMOVED***/ about to be presented, and adapterWillDismissInterstitial: and adapterDidDismissInterstitial:
***REMOVED***/ when the interstitial is being dismissed.
- (void)presentInterstitialFromRootViewController:(UIViewController *)rootViewController;

@optional

***REMOVED***/ Starts request for a native ad. |adTypes| contains the list of native ad types requested. See
***REMOVED***/ GADAdLoaderAdTypes.h for available ad types. |options| are any additional options configured by
***REMOVED***/ the publisher for requesting a native ad. See GADNativeAdImageAdLoaderOptions.h for available
***REMOVED***/ image options. When this method is called the receiver may start native ad request
***REMOVED***/ asynchronously. On completion the receiver should notify the Google Mobile Ads SDK with a native
***REMOVED***/ ad object using the receiver's connector method
***REMOVED***/ adapter:didReceiveNativeAdDataSource:mediationDelegate or adapter:didFailAd: if the ad request
***REMOVED***/ encountered an error.
- (void)getNativeAdWithAdTypes:(NSArray *)adTypes options:(NSArray *)options;

***REMOVED***/ Indicates if the adapter handles user clicks. If this method returns YES, the adapter must
***REMOVED***/ handle user clicks and notify the Google Mobile Ads SDK of clicks using
***REMOVED***/ +[GADMediatedNativeAdNotificationSource mediatedNativeAdDidRecordClick:]. If this method returns
***REMOVED***/ NO, the Google Mobile Ads SDK handles user clicks and notifies the adapter of clicks using
***REMOVED***/ -[GADMediatedNativeAdDelegate
***REMOVED***/ mediatedNativeAd:didRecordClickOnAssetWithName:view:viewController:].
- (BOOL)handlesUserClicks;

***REMOVED***/ Indicates if the adapter handles user impressions tracking. If this method returns YES, the
***REMOVED***/ Google Mobile Ads SDK will not track user impressions and the adapter must notify the
***REMOVED***/ Google Mobile Ads SDK of impressions using +[GADMediatedNativeAdNotificationSource
***REMOVED***/ mediatedNativeAdDidRecordImpression:]. If this method returns NO,
***REMOVED***/ the Google Mobile Ads SDK tracks user impressions and notifies the adapter of impressions
***REMOVED***/ using -[GADMediatedNativeAdDelegate mediatedNativeAdDidRecordImpression:].
- (BOOL)handlesUserImpressions;

***REMOVED***/ If your ad network handles multiple ad sizes for the same banner ad, implement this method to
***REMOVED***/ know when the user changes the banner size. This is typically changing from
***REMOVED***/ kGADAdSizeSmartBannerPortrait to kGADAdSizeSmartBannerLandscape, or vice versa. If this method
***REMOVED***/ is not implemented, every time the user changes the ad size, a new ad will be requested with the
***REMOVED***/ new size by calling your getBannerWithSize: method.
- (void)changeAdSizeTo:(GADAdSize)adSize;

***REMOVED***
