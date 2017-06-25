***REMOVED***
***REMOVED***  GADNativeExpressAdView.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google Inc. All rights reserved.
***REMOVED***

#import <UIKit/UIKit.h>

#import <GoogleMobileAds/GADAdSize.h>
#import <GoogleMobileAds/GADNativeExpressAdViewDelegate.h>
#import <GoogleMobileAds/GADRequest.h>
#import <GoogleMobileAds/GADVideoController.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ The view that displays native ads. A minimum implementation to get an ad from within a
***REMOVED***/ UIViewController class is:
***REMOVED***/
***REMOVED***/   <pre>
***REMOVED***/   ***REMOVED*** Create and setup the ad view, specifying the size and origin at ***REMOVED***0, 0***REMOVED***.
***REMOVED***/   GADNativeExpressAdView *adView =
***REMOVED***/       [[GADNativeExpressAdView alloc] initWithAdSize:kGADAdSizeBanner];
***REMOVED***/   adView.rootViewController = self;
***REMOVED***/   adView.adUnitID = @"ID created when registering your app";
***REMOVED***/   ***REMOVED*** Place the ad view onto the screen.
***REMOVED***/   [self.view addSubview:adView];
***REMOVED***/   ***REMOVED*** Request an ad without any additional targeting information.
***REMOVED***/   [adView loadRequest:[GADRequest request]];
***REMOVED***/   </pre>
@interface GADNativeExpressAdView : UIView

#pragma mark - Initialization

***REMOVED***/ Returns an initialized GADNativeExpressAdView instance set to |adSize| and positioned at
***REMOVED***/ |origin| relative to its superview bounds. Returns nil if |adSize| is an invalid ad size.
- (instancetype GAD_NULLABLE_TYPE)initWithAdSize:(GADAdSize)adSize origin:(CGPoint)origin;

***REMOVED***/ Returns an initialized GADNativeExpressAdView instance set to |adSize| and positioned at the top
***REMOVED***/ left of its superview. Returns nil if |adSize| is an invalid ad size.
- (instancetype GAD_NULLABLE_TYPE)initWithAdSize:(GADAdSize)adSize;

***REMOVED***/ Video controller for controlling video rendered by this native express ad view.
@property(nonatomic, strong, readonly) GADVideoController *videoController;

#pragma mark - Pre-Request

***REMOVED***/ Required value created on the AdMob website. Create a new ad unit for every unique placement of
***REMOVED***/ an ad in your application. Set this to the ID assigned for this placement. Ad units are
***REMOVED***/ important for targeting and statistics.
***REMOVED***/
***REMOVED***/ Example AdMob ad unit ID: @"ca-app-pub-0123456789012345/0123456789"
@property(nonatomic, copy, GAD_NULLABLE) IBInspectable NSString *adUnitID;

***REMOVED***/ Required reference to the current root view controller. For example, the root view controller in
***REMOVED***/ a tab-based application would be the UITabViewController.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet UIViewController *rootViewController;

***REMOVED***/ Required to set this native ad view to a proper size. Never create your own GADAdSize directly.
***REMOVED***/ Use one of the predefined standard ad sizes (such as kGADAdSizeBanner), or create one using the
***REMOVED***/ GADAdSizeFromCGSize method. If you are not using mediation, changing the adSize after an ad has
***REMOVED***/ been shown will cause a new request (for an ad of the new size) to be sent. If you are using
***REMOVED***/ mediation, then a new request may not be sent.
@property(nonatomic, assign) GADAdSize adSize;

***REMOVED***/ Optional delegate object that receives state change notifications from this
***REMOVED***/ GADNativeExpressAdView. Typically this is a UIViewController.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet id<GADNativeExpressAdViewDelegate> delegate;

***REMOVED***/ A Boolean value that determines whether autoloading of ads in the receiver is enabled. If
***REMOVED***/ enabled, you do not need to call the loadRequest: method to load ads.
@property(nonatomic, assign, getter=isAutoloadEnabled) IBInspectable BOOL autoloadEnabled;

***REMOVED***/ Sets options that configure ad loading.
***REMOVED***/
***REMOVED***/ @param adOptions An array of GADAdLoaderOptions objects. The array is deep copied and option
***REMOVED***/ objects cannot be modified after calling this method.
- (void)setAdOptions:(NSArray *)adOptions;

#pragma mark - Making an Ad Request

***REMOVED***/ Makes an ad request. The request object supplies targeting information.
- (void)loadRequest:(GADRequest *GAD_NULLABLE_TYPE)request;

#pragma mark - Mediation

***REMOVED***/ The name of the ad network adapter class that fetched the current ad. Returns nil while the
***REMOVED***/ latest ad request is in progress or if the latest ad request failed. For both standard and
***REMOVED***/ mediated Google AdMob ads, this method returns @"GADMAdapterGoogleAdMobAds". For ads fetched via
***REMOVED***/ mediation custom events, this method returns @"GADMAdapterCustomEvents".
@property(nonatomic, readonly, weak, GAD_NULLABLE) NSString *adNetworkClassName;

***REMOVED***

GAD_ASSUME_NONNULL_END
