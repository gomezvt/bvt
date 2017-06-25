***REMOVED***
***REMOVED***  GADNativeAppInstallAd.h
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

***REMOVED***/ Native app install ad. To request this ad type, you need to pass
***REMOVED***/ kGADAdLoaderAdTypeNativeAppInstall (see GADAdLoaderAdTypes.h) to the |adTypes| parameter in
***REMOVED***/ GADAdLoader's initializer method. If you request this ad type, your delegate must conform to the
***REMOVED***/ GADNativeAppInstallAdLoaderDelegate protocol.
@interface GADNativeAppInstallAd : GADNativeAd

#pragma mark - Must be displayed

***REMOVED***/ App title.
@property(nonatomic, readonly, copy, GAD_NULLABLE) NSString *headline;
***REMOVED***/ Text that encourages user to take some action with the ad. For example "Install".
@property(nonatomic, readonly, copy, GAD_NULLABLE) NSString *callToAction;
***REMOVED***/ Application icon.
@property(nonatomic, readonly, strong, GAD_NULLABLE) GADNativeAdImage *icon;

#pragma mark - Recommended to display

***REMOVED***/ App description.
@property(nonatomic, readonly, copy, GAD_NULLABLE) NSString *body;
***REMOVED***/ The app store name. For example, "App Store".
@property(nonatomic, readonly, copy, GAD_NULLABLE) NSString *store;
***REMOVED***/ String representation of the app's price.
@property(nonatomic, readonly, copy, GAD_NULLABLE) NSString *price;
***REMOVED***/ Array of GADNativeAdImage objects related to the advertised application.
@property(nonatomic, readonly, strong, GAD_NULLABLE) NSArray *images;
***REMOVED***/ App store rating (0 to 5).
@property(nonatomic, readonly, copy, GAD_NULLABLE) NSDecimalNumber *starRating;
***REMOVED***/ Video controller for controlling video playback in GADNativeAppInstallAdView's mediaView.
@property(nonatomic, strong, readonly) GADVideoController *videoController;

***REMOVED***/ Registers ad view and asset views created from this native ad.
***REMOVED***/ @param assetViews Dictionary of asset views keyed by asset IDs.
- (void)registerAdView:(UIView *)adView assetViews:(NSDictionary<NSString *, UIView *> *)assetViews;

***REMOVED***/ Unregisters ad view from this native ad. The corresponding asset views will also be
***REMOVED***/ unregistered.
- (void)unregisterAdView;

***REMOVED***

#pragma mark - Protocol and constants

***REMOVED***/ The delegate of a GADAdLoader object implements this protocol to receive GADNativeAppInstallAd
***REMOVED***/ ads.
@protocol GADNativeAppInstallAdLoaderDelegate<GADAdLoaderDelegate>
***REMOVED***/ Called when a native app install ad is received.
- (void)adLoader:(GADAdLoader *)adLoader
    didReceiveNativeAppInstallAd:(GADNativeAppInstallAd *)nativeAppInstallAd;
***REMOVED***

#pragma mark - Native App Install Ad View

***REMOVED***/ Base class for app install ad views. Your app install ad view must be a subclass of this class
***REMOVED***/ and must call superclass methods for all overriden methods.
@interface GADNativeAppInstallAdView : UIView

***REMOVED***/ This property must point to the native app install ad object rendered by this ad view.
@property(nonatomic, strong, GAD_NULLABLE) GADNativeAppInstallAd *nativeAppInstallAd;

***REMOVED***/ Weak reference to your ad view's headline asset view.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet UIView *headlineView;
***REMOVED***/ Weak reference to your ad view's call to action asset view.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet UIView *callToActionView;
***REMOVED***/ Weak reference to your ad view's icon asset view.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet UIView *iconView;
***REMOVED***/ Weak reference to your ad view's body asset view.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet UIView *bodyView;
***REMOVED***/ Weak reference to your ad view's store asset view.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet UIView *storeView;
***REMOVED***/ Weak reference to your ad view's price asset view.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet UIView *priceView;
***REMOVED***/ Weak reference to your ad view's image asset view.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet UIView *imageView;
***REMOVED***/ Weak reference to your ad view's star rating asset view.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet UIView *starRatingView;
***REMOVED***/ Weak reference to your ad view's media asset view.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet GADMediaView *mediaView;
***REMOVED***/ Weak reference to your ad view's AdChoices view. Must set adChoicesView before setting
***REMOVED***/ nativeAppInstallAd, otherwise AdChoices will be rendered in the publisher's
***REMOVED***/ preferredAdChoicesPosition as defined in GADNativeAdViewAdOptions.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet GADAdChoicesView *adChoicesView;

***REMOVED***

GAD_ASSUME_NONNULL_END
