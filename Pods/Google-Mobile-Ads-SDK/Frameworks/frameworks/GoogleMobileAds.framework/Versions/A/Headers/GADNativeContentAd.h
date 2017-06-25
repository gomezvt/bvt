***REMOVED***
***REMOVED***  GADNativeContentAd.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <GoogleMobileAds/GADAdChoicesView.h>
#import <GoogleMobileAds/GADAdLoaderDelegate.h>
#import <GoogleMobileAds/GADMediaView.h>
#import <GoogleMobileAds/GADNativeAd.h>
#import <GoogleMobileAds/GADNativeAdImage.h>
#import <GoogleMobileAds/GADVideoController.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

#pragma mark - Native Content Ad Assets

***REMOVED***/ Native content ad. To request this ad type, you need to pass kGADAdLoaderAdTypeNativeContent
***REMOVED***/ (see GADAdLoaderAdTypes.h) to the |adTypes| parameter in GADAdLoader's initializer method. If
***REMOVED***/ you request this ad type, your delegate must conform to the GADNativeContentAdLoaderDelegate
***REMOVED***/ protocol.
@interface GADNativeContentAd : GADNativeAd

#pragma mark - Must be displayed

***REMOVED***/ Primary text headline.
@property(nonatomic, readonly, copy, GAD_NULLABLE) NSString *headline;
***REMOVED***/ Secondary text.
@property(nonatomic, readonly, copy, GAD_NULLABLE) NSString *body;

#pragma mark - Recommended to display

***REMOVED***/ Large images.
@property(nonatomic, readonly, copy, GAD_NULLABLE) NSArray *images;
***REMOVED***/ Small logo image.
@property(nonatomic, readonly, strong, GAD_NULLABLE) GADNativeAdImage *logo;
***REMOVED***/ Text that encourages user to take some action with the ad.
@property(nonatomic, readonly, copy, GAD_NULLABLE) NSString *callToAction;
***REMOVED***/ Identifies the advertiser. For example, the advertiser’s name or visible URL.
@property(nonatomic, readonly, copy, GAD_NULLABLE) NSString *advertiser;
***REMOVED***/ Video controller for controlling video playback in GADNativeContentAdView's mediaView.
@property(nonatomic, strong, readonly) GADVideoController *videoController;

***REMOVED***/ Registers ad view and asset views created from this native ad.
***REMOVED***/ @param assetViews Dictionary of asset views keyed by asset IDs.
- (void)registerAdView:(UIView *)adView assetViews:(NSDictionary<NSString *, UIView *> *)assetViews;

***REMOVED***/ Unregisters ad view from this native ad. The corresponding asset views will also be
***REMOVED***/ unregistered.
- (void)unregisterAdView;

***REMOVED***

#pragma mark - Protocol and constants

***REMOVED***/ The delegate of a GADAdLoader object implements this protocol to receive GADNativeContentAd ads.
@protocol GADNativeContentAdLoaderDelegate<GADAdLoaderDelegate>
***REMOVED***/ Called when native content is received.
- (void)adLoader:(GADAdLoader *)adLoader
    didReceiveNativeContentAd:(GADNativeContentAd *)nativeContentAd;
***REMOVED***

#pragma mark - Native Content Ad View

***REMOVED***/ Base class for content ad views. Your content ad view must be a subclass of this class and must
***REMOVED***/ call superclass methods for all overriden methods.
@interface GADNativeContentAdView : UIView

***REMOVED***/ This property must point to the native content ad object rendered by this ad view.
@property(nonatomic, strong, GAD_NULLABLE) GADNativeContentAd *nativeContentAd;

***REMOVED***/ Weak reference to your ad view's headline asset view.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet UIView *headlineView;
***REMOVED***/ Weak reference to your ad view's body asset view.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet UIView *bodyView;
***REMOVED***/ Weak reference to your ad view's image asset view.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet UIView *imageView;
***REMOVED***/ Weak reference to your ad view's logo asset view.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet UIView *logoView;
***REMOVED***/ Weak reference to your ad view's call to action asset view.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet UIView *callToActionView;
***REMOVED***/ Weak reference to your ad view's advertiser asset view.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet UIView *advertiserView;
***REMOVED***/ Weak reference to your ad view's media asset view.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet GADMediaView *mediaView;
***REMOVED***/ Weak reference to your ad view's AdChoices view. Must set adChoicesView before setting
***REMOVED***/ nativeContentAd, otherwise AdChoices will be rendered in the publisher's
***REMOVED***/ preferredAdChoicesPosition as defined in GADNativeAdViewAdOptions.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet GADAdChoicesView *adChoicesView;

***REMOVED***

GAD_ASSUME_NONNULL_END
