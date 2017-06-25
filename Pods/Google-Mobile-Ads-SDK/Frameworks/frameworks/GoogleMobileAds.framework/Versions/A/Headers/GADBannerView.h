***REMOVED***
***REMOVED***  GADBannerView.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2011 Google Inc. All rights reserved.
***REMOVED***

#import <UIKit/UIKit.h>

#import <GoogleMobileAds/GADAdSize.h>
#import <GoogleMobileAds/GADAdSizeDelegate.h>
#import <GoogleMobileAds/GADBannerViewDelegate.h>
#import <GoogleMobileAds/GADInAppPurchaseDelegate.h>
#import <GoogleMobileAds/GADRequest.h>
#import <GoogleMobileAds/GADRequestError.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ The view that displays banner ads. A minimum implementation to get an ad from within a
***REMOVED***/ UIViewController class is:
***REMOVED***/
***REMOVED***/   <pre>
***REMOVED***/   ***REMOVED*** Create and setup the ad view, specifying the size and origin at ***REMOVED***0, 0***REMOVED***.
***REMOVED***/   GADBannerView *adView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
***REMOVED***/   adView.rootViewController = self;
***REMOVED***/   adView.adUnitID = @"ID created when registering your app";
***REMOVED***/   ***REMOVED*** Place the ad view onto the screen.
***REMOVED***/   [self.view addSubview:adView];
***REMOVED***/   ***REMOVED*** Request an ad without any additional targeting information.
***REMOVED***/   [adView loadRequest:[GADRequest request]];
***REMOVED***/   </pre>
@interface GADBannerView : UIView

#pragma mark Initialization

***REMOVED***/ Initializes and returns a banner view with the specified ad size and origin relative to the
***REMOVED***/ banner's superview.
- (instancetype)initWithAdSize:(GADAdSize)adSize origin:(CGPoint)origin;

***REMOVED***/ Initializes and returns a banner view with the specified ad size placed at its superview's
***REMOVED***/ origin.
- (instancetype)initWithAdSize:(GADAdSize)adSize;

#pragma mark Pre-Request

***REMOVED***/ Required value created on the AdMob website. Create a new ad unit for every unique placement of
***REMOVED***/ an ad in your application. Set this to the ID assigned for this placement. Ad units are
***REMOVED***/ important for targeting and statistics.
***REMOVED***/
***REMOVED***/ Example AdMob ad unit ID: @"ca-app-pub-0123456789012345/0123456789"
@property(nonatomic, copy, GAD_NULLABLE) IBInspectable NSString *adUnitID;

***REMOVED***/ Required reference to the current root view controller. For example the root view controller in
***REMOVED***/ tab-based application would be the UITabViewController.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet UIViewController *rootViewController;

***REMOVED***/ Required to set this banner view to a proper size. Never create your own GADAdSize directly. Use
***REMOVED***/ one of the predefined standard ad sizes (such as kGADAdSizeBanner), or create one using the
***REMOVED***/ GADAdSizeFromCGSize method. If not using mediation, then changing the adSize after an ad has
***REMOVED***/ been shown will cause a new request (for an ad of the new size) to be sent. If using mediation,
***REMOVED***/ then a new request may not be sent.
@property(nonatomic, assign) GADAdSize adSize;

***REMOVED***/ Optional delegate object that receives state change notifications from this GADBannerView.
***REMOVED***/ Typically this is a UIViewController.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet id<GADBannerViewDelegate> delegate;

***REMOVED***/ Optional delegate that is notified when creatives cause the banner to change size.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet id<GADAdSizeDelegate> adSizeDelegate;

#pragma mark Making an Ad Request

***REMOVED***/ Makes an ad request. The request object supplies targeting information.
- (void)loadRequest:(GADRequest *GAD_NULLABLE_TYPE)request;

***REMOVED***/ A Boolean value that determines whether autoloading of ads in the receiver is enabled. If
***REMOVED***/ enabled, you do not need to call the loadRequest: method to load ads.
@property(nonatomic, assign, getter=isAutoloadEnabled) IBInspectable BOOL autoloadEnabled;

#pragma mark Mediation

***REMOVED***/ The ad network class name that fetched the current ad. Returns nil while the latest ad request
***REMOVED***/ is in progress or if the latest ad request failed. For both standard and mediated Google AdMob
***REMOVED***/ ads, this property returns @"GADMAdapterGoogleAdMobAds". For ads fetched via mediation custom
***REMOVED***/ events, this property returns @"GADMAdapterCustomEvents".
@property(nonatomic, readonly, copy, GAD_NULLABLE) NSString *adNetworkClassName;

#pragma mark Deprecated

***REMOVED***/ Indicates if the currently displayed ad (or most recent failure) was a result of auto refreshing
***REMOVED***/ as specified on server. This property is set to NO after each loadRequest: method.
@property(nonatomic, readonly, assign) BOOL hasAutoRefreshed GAD_DEPRECATED_ATTRIBUTE;

***REMOVED***/ Deprecated delegate. GADInAppPurchase has been deprecated.
@property(nonatomic, weak, GAD_NULLABLE)
    IBOutlet id<GADInAppPurchaseDelegate> inAppPurchaseDelegate GAD_DEPRECATED_ATTRIBUTE;

***REMOVED***/ The mediated ad network's underlying ad view. You may use this property to read the ad's actual
***REMOVED***/ size and adjust this banner view's frame origin. However, modifying the banner view's frame size
***REMOVED***/ triggers the Mobile Ads SDK to request a new ad. Only update the banner view's frame origin.
@property(nonatomic, readonly, weak, GAD_NULLABLE)
    UIView *mediatedAdView GAD_DEPRECATED_MSG_ATTRIBUTE("Use adNetworkClassName.");

***REMOVED***

GAD_ASSUME_NONNULL_END
