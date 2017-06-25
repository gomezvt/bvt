***REMOVED***
***REMOVED***  GADMRewardBasedVideoAdNetworkAdapter.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google. All rights reserved.
***REMOVED***

#import <GoogleMobileAds/GoogleMobileAds.h>

@protocol GADMRewardBasedVideoAdNetworkConnector;

***REMOVED***/ Your adapter must conform to this protocol to provide reward based video ads.
@protocol GADMRewardBasedVideoAdNetworkAdapter<NSObject>

***REMOVED***/ Returns a version string for the adapter. It can be any string that uniquely identifies the
***REMOVED***/ version of your adapter. For example, "1.0", or simply a date such as "20110915".
+ (NSString *)adapterVersion;

***REMOVED***/ The extras class that is used to specify additional parameters for a request to this ad network.
***REMOVED***/ Returns Nil if the network does not have extra settings for publishers to send.
+ (Class<GADAdNetworkExtras>)networkExtrasClass;

***REMOVED***/ Returns an initialized instance of the adapter when mediation ad requests come in. The adapter
***REMOVED***/ must only maintain a weak reference to the provided connector.
- (instancetype)initWithRewardBasedVideoAdNetworkConnector:
        (id<GADMRewardBasedVideoAdNetworkConnector>)connector;

***REMOVED***/ Tells the adapter to set up reward based video ads. The adapter should notify the Google Mobile
***REMOVED***/ Ads SDK whether set up has succeeded or failed using callbacks provided in the connector. When
***REMOVED***/ set up fails, the Google Mobile Ads SDK may try to set up the adapter again.
- (void)setUp;

***REMOVED***/ Tells the adapter to request a reward based video ad. This method is called after the adapter
***REMOVED***/ has been set up. The adapter should notify the Google Mobile Ads SDK if the request succeeds or
***REMOVED***/ fails using callbacks provided in the connector.
- (void)requestRewardBasedVideoAd;

***REMOVED***/ Tells the adapter to present the reward based video ad with the provided view controller. This
***REMOVED***/ method is only called after the adapter successfully requested an ad.
- (void)presentRewardBasedVideoAdWithRootViewController:(UIViewController *)viewController;

***REMOVED***/ Tells the adapter to remove itself as a delegate or notification observer from the underlying ad
***REMOVED***/ network SDK.
- (void)stopBeingDelegate;

@optional

***REMOVED***/ Adapters that want to be initialized as early as possible should implement this method to
***REMOVED***/ opt-into initialization when the publisher initializes the Google Mobile Ads SDK. If not
***REMOVED***/ implemented, initWithRewardBasedVideoAdNetworkConnector: gets called the first time the
***REMOVED***/ publisher loads a rewarded video ad.
- (instancetype)initWithRewardBasedVideoAdNetworkConnector:
                    (id<GADMRewardBasedVideoAdNetworkConnector>)connector
                                               credentials:(NSArray<NSDictionary *> *)credentials;

***REMOVED***/ Returns an initialized instance of the adapter. The adapter must only maintain a weak reference
***REMOVED***/ to the provided connector.
- (instancetype)initWithGADMAdNetworkConnector:(id<GADMRewardBasedVideoAdNetworkConnector>)connector
    GAD_DEPRECATED_MSG_ATTRIBUTE("Use initWithRewardBasedVideoAdNetworkConnector:.");

***REMOVED***/ Tells the adapter to set up reward based video ads with the provided user ID. The adapter should
***REMOVED***/ notify the Google Mobile Ads SDK whether set up has succeeded or failed using callbacks provided
***REMOVED***/ in the connector. When set up fails, the Google Mobile Ads SDK may try to set up the adapter
***REMOVED***/ again.
- (void)setUpWithUserID:(NSString *)userID GAD_DEPRECATED_MSG_ATTRIBUTE("Use setUp.");

***REMOVED***
