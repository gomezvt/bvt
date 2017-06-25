***REMOVED***
***REMOVED***  GADAdReward.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>

#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Reward information for GADRewardBasedVideoAd ads.
@interface GADAdReward : NSObject

***REMOVED***/ Type of the reward.
@property(nonatomic, readonly, copy) NSString *type;

***REMOVED***/ Amount rewarded to the user.
@property(nonatomic, readonly, copy) NSDecimalNumber *amount;

***REMOVED***/ Returns an initialized GADAdReward with the provided reward type and reward amount. rewardType
***REMOVED***/ and rewardAmount must not be nil.
- (instancetype)initWithRewardType:(NSString *)rewardType
                      rewardAmount:(NSDecimalNumber *)rewardAmount NS_DESIGNATED_INITIALIZER;

***REMOVED***

GAD_ASSUME_NONNULL_END
