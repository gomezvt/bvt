***REMOVED***
***REMOVED***  GADNativeAd.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

@protocol GADNativeAdDelegate;

***REMOVED***/ Native ad base class. All native ad types are subclasses of this class.
@interface GADNativeAd : NSObject

***REMOVED***/ Optional delegate to receive state change notifications.
@property(nonatomic, weak, GAD_NULLABLE) id<GADNativeAdDelegate> delegate;

***REMOVED***/ Root view controller for handling ad actions.
@property(nonatomic, weak, GAD_NULLABLE) UIViewController *rootViewController;

***REMOVED***/ Dictionary of assets which aren't processed by the receiver.
@property(nonatomic, readonly, copy, GAD_NULLABLE) NSDictionary *extraAssets;

***REMOVED***/ The ad network class name that fetched the current ad. For both standard and mediated Google
***REMOVED***/ AdMob ads, this method returns @"GADMAdapterGoogleAdMobAds". For ads fetched via mediation
***REMOVED***/ custom events, this method returns @"GADMAdapterCustomEvents".
@property(nonatomic, readonly, copy, GAD_NULLABLE) NSString *adNetworkClassName;

***REMOVED***

GAD_ASSUME_NONNULL_END
