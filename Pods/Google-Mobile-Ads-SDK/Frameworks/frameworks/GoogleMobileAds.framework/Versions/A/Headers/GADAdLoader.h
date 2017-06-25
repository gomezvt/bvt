***REMOVED***
***REMOVED***  GADAdLoader.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <GoogleMobileAds/GADAdLoaderDelegate.h>
#import <GoogleMobileAds/GADRequest.h>
#import <GoogleMobileAds/GADRequestError.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Loads ads. See GADAdLoaderAdTypes.h for available ad types.
@interface GADAdLoader : NSObject

***REMOVED***/ Object notified when an ad request succeeds or fails. Must conform to requested ad types'
***REMOVED***/ delegate protocols.
@property(nonatomic, weak, GAD_NULLABLE) id<GADAdLoaderDelegate> delegate;

***REMOVED***/ The ad loader's ad unit ID.
@property(nonatomic, readonly) NSString *adUnitID;

***REMOVED***/ Returns an initialized ad loader configured to load the specified ad types.
***REMOVED***/
***REMOVED***/ @param rootViewController The root view controller is used to present ad click actions.
***REMOVED***/ @param adTypes An array of ad types. See GADAdLoaderAdTypes.h for available ad types.
***REMOVED***/ @param options An array of GADAdLoaderOptions objects to configure how ads are loaded, or nil to
***REMOVED***/ use default options. See each ad type's header for available GADAdLoaderOptions subclasses.
- (instancetype)initWithAdUnitID:(NSString *)adUnitID
              rootViewController:(UIViewController *GAD_NULLABLE_TYPE)rootViewController
                         adTypes:(NSArray *)adTypes
                         options:(NSArray *GAD_NULLABLE_TYPE)options;

***REMOVED***/ Loads the ad and informs the delegate of the outcome.
- (void)loadRequest:(GADRequest *GAD_NULLABLE_TYPE)request;

***REMOVED***

***REMOVED***/ Ad loader options base class. See each ad type's header for available GADAdLoaderOptions
***REMOVED***/ subclasses.
@interface GADAdLoaderOptions : NSObject
***REMOVED***

GAD_ASSUME_NONNULL_END
