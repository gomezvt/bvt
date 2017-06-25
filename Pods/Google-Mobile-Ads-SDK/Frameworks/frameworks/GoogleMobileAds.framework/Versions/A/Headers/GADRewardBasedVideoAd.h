***REMOVED***
***REMOVED***  GADRewardBasedVideoAd.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <GoogleMobileAds/GADRequest.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

@protocol GADRewardBasedVideoAdDelegate;

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ The GADRewardBasedVideoAd class is used for requesting and presenting a reward based video ad.
***REMOVED***/ This class isn't thread safe.
@interface GADRewardBasedVideoAd : NSObject

***REMOVED***/ Delegate for receiving video notifications.
@property(nonatomic, weak, GAD_NULLABLE) id<GADRewardBasedVideoAdDelegate> delegate;

***REMOVED***/ Indicates if the receiver is ready to be presented full screen.
@property(nonatomic, readonly, getter=isReady) BOOL ready;

***REMOVED***/ The ad network class name that fetched the current ad. Returns nil while the latest ad request
***REMOVED***/ is in progress or if the latest ad request failed. For both standard and mediated Google AdMob
***REMOVED***/ ads, this property returns @"GADMAdapterGoogleAdMobAds". For ads fetched via mediation custom
***REMOVED***/ events, this property returns the mediated custom event adapter.
@property(nonatomic, readonly, copy, GAD_NULLABLE) NSString *adNetworkClassName;

***REMOVED***/ Returns the shared GADRewardBasedVideoAd instance.
+ (GADRewardBasedVideoAd *)sharedInstance;

***REMOVED***/ Initiates the request to fetch the reward based video ad. The |request| object supplies ad
***REMOVED***/ targeting information and must not be nil. The adUnitID is the ad unit id used for fetching an
***REMOVED***/ ad and must not be nil.
- (void)loadRequest:(GADRequest *)request withAdUnitID:(NSString *)adUnitID;

***REMOVED***/ Presents the reward based video ad with the provided view controller.
- (void)presentFromRootViewController:(UIViewController *)viewController;

***REMOVED***

GAD_ASSUME_NONNULL_END
