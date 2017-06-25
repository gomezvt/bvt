***REMOVED***
***REMOVED***  GADNativeCustomTemplateAd.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <GoogleMobileAds/GADAdLoaderDelegate.h>
#import <GoogleMobileAds/GADMediaView.h>
#import <GoogleMobileAds/GADNativeAd.h>
#import <GoogleMobileAds/GADNativeAdImage.h>
#import <GoogleMobileAds/GADVideoController.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Native ad custom click handler block. |assetID| is the ID of asset that has received a click.
typedef void (^GADNativeAdCustomClickHandler)(NSString *assetID);

***REMOVED***/ Asset key for the GADMediaView asset view.
extern NSString *const GADNativeCustomTemplateAdMediaViewKey;

***REMOVED***/ Native custom template ad. To request this ad type, you need to pass
***REMOVED***/ kGADAdLoaderAdTypeNativeCustomTemplate (see GADAdLoaderAdTypes.h) to the |adTypes| parameter in
***REMOVED***/ GADAdLoader's initializer method. If you request this ad type, your delegate must conform to the
***REMOVED***/ GADNativeCustomTemplateAdLoaderDelegate protocol.
@interface GADNativeCustomTemplateAd : GADNativeAd

***REMOVED***/ The ad's custom template ID.
@property(nonatomic, readonly) NSString *templateID;

***REMOVED***/ Array of available asset keys.
@property(nonatomic, readonly) NSArray *availableAssetKeys;

***REMOVED***/ Returns video controller for controlling receiver's video.
@property(nonatomic, readonly, strong) GADVideoController *videoController;

***REMOVED***/ Returns media view for rendering video loaded by the receiver. Returns nil if receiver doesn't
***REMOVED***/ has a video.
@property(nonatomic, readonly, strong, GAD_NULLABLE) GADMediaView *mediaView;

***REMOVED***/ Custom click handler. Set this property only if this template ad is configured with a custom
***REMOVED***/ click action, otherwise set it to nil. If this property is set to a non-nil value, the ad's
***REMOVED***/ built-in click actions are ignored and |customClickHandler| is executed when a click on the
***REMOVED***/ asset is received.
@property(atomic, copy) GADNativeAdCustomClickHandler customClickHandler;

***REMOVED***/ Returns the native ad image corresponding to the specified key or nil if the image is not
***REMOVED***/ available.
- (GADNativeAdImage *GAD_NULLABLE_TYPE)imageForKey:(NSString *)key;

***REMOVED***/ Returns the string corresponding to the specified key or nil if the string is not available.
- (NSString *GAD_NULLABLE_TYPE)stringForKey:(NSString *)key;

***REMOVED***/ Call when the user clicks on the ad. Provide the asset key that best matches the asset the user
***REMOVED***/ interacted with. If this ad is configured with a custom click action, ensure the receiver's
***REMOVED***/ customClickHandler property is set before calling this method.
- (void)performClickOnAssetWithKey:(NSString *)assetKey;

***REMOVED***/ Call when the ad is displayed on screen to the user. Can be called multiple times. Only the
***REMOVED***/ first impression is recorded.
- (void)recordImpression;

***REMOVED***/ Call when the user clicks on the ad. Provide the asset key that best matches the asset the user
***REMOVED***/ interacted with. Provide |customClickHandler| only if this template is configured with a custom
***REMOVED***/ click action, otherwise pass in nil. If a block is provided, the ad's built-in click actions are
***REMOVED***/ ignored and |customClickHandler| is executed after recording the click.
***REMOVED***/
***REMOVED***/ This method is deprecated. See performClickOnAssetWithKey: API.
- (void)performClickOnAssetWithKey:(NSString *)assetKey
                customClickHandler:(dispatch_block_t GAD_NULLABLE_TYPE)customClickHandler
    GAD_DEPRECATED_MSG_ATTRIBUTE("Use performClickOnAssetWithKey:.");

***REMOVED***

#pragma mark - Loading Protocol

***REMOVED***/ The delegate of a GADAdLoader object implements this protocol to receive
***REMOVED***/ GADNativeCustomTemplateAd ads.
@protocol GADNativeCustomTemplateAdLoaderDelegate<GADAdLoaderDelegate>

***REMOVED***/ Called when requesting an ad. Asks the delegate for an array of custom template ID strings.
- (NSArray *)nativeCustomTemplateIDsForAdLoader:(GADAdLoader *)adLoader;

***REMOVED***/ Tells the delegate that a native custom template ad was received.
- (void)adLoader:(GADAdLoader *)adLoader
    didReceiveNativeCustomTemplateAd:(GADNativeCustomTemplateAd *)nativeCustomTemplateAd;

***REMOVED***

GAD_ASSUME_NONNULL_END
