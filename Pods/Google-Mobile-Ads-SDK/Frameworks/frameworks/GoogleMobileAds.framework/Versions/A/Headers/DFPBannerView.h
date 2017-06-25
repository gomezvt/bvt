***REMOVED***
***REMOVED***  DFPBannerView.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2012 Google Inc. All rights reserved.
***REMOVED***

#import <GoogleMobileAds/DFPCustomRenderedBannerViewDelegate.h>
#import <GoogleMobileAds/GADAdLoaderDelegate.h>
#import <GoogleMobileAds/GADAppEventDelegate.h>
#import <GoogleMobileAds/GADBannerView.h>
#import <GoogleMobileAds/GADCorrelator.h>
#import <GoogleMobileAds/GADVideoController.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ The delegate of a GADAdLoader object must conform to this protocol to receive DFPBannerViews.
@protocol DFPBannerAdLoaderDelegate<GADAdLoaderDelegate>

***REMOVED***/ Asks the delegate which banner ad sizes should be requested.
- (NSArray<NSValue *> *)validBannerSizesForAdLoader:(GADAdLoader *)adLoader;

***REMOVED***/ Tells the delegate that a DFP banner ad was received.
- (void)adLoader:(GADAdLoader *)adLoader didReceiveDFPBannerView:(DFPBannerView *)bannerView;

***REMOVED***

***REMOVED***/ The view that displays DoubleClick For Publishers banner ads.
***REMOVED***/
***REMOVED***/ To request this ad type using GADAdLoader, you need to pass kGADAdLoaderAdTypeDFPBanner (see
***REMOVED***/ GADAdLoaderAdTypes.h) to the |adTypes| parameter in GADAdLoader's initializer method. If you
***REMOVED***/ request this ad type, your delegate must conform to the DFPBannerAdLoaderDelegate protocol.
@interface DFPBannerView : GADBannerView

***REMOVED***/ Required value created on the DFP website. Create a new ad unit for every unique placement of an
***REMOVED***/ ad in your application. Set this to the ID assigned for this placement. Ad units are important
***REMOVED***/ for targeting and statistics.
***REMOVED***/
***REMOVED***/ Example DFP ad unit ID: @"/6499/example/banner"
@property(nonatomic, copy, GAD_NULLABLE) NSString *adUnitID;

***REMOVED***/ Optional delegate that is notified when creatives send app events.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet id<GADAppEventDelegate> appEventDelegate;

***REMOVED***/ Optional delegate that is notified when creatives cause the banner to change size.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet id<GADAdSizeDelegate> adSizeDelegate;

***REMOVED***/ Optional array of NSValue encoded GADAdSize structs, specifying all valid sizes that are
***REMOVED***/ appropriate for this slot. Never create your own GADAdSize directly. Use one of the predefined
***REMOVED***/ standard ad sizes (such as kGADAdSizeBanner), or create one using the GADAdSizeFromCGSize
***REMOVED***/ method.
***REMOVED***/
***REMOVED***/ Example:
***REMOVED***/
***REMOVED***/   <pre>
***REMOVED***/   NSArray *validSizes = @[
***REMOVED***/     NSValueFromGADAdSize(kGADAdSizeBanner),
***REMOVED***/     NSValueFromGADAdSize(kGADAdSizeLargeBanner)
***REMOVED***/   ];
***REMOVED***/
***REMOVED***/   bannerView.validAdSizes = validSizes;
***REMOVED***/   </pre>
@property(nonatomic, copy, GAD_NULLABLE) NSArray *validAdSizes;

***REMOVED***/ Correlator object for correlating this object to other ad objects.
@property(nonatomic, strong, GAD_NULLABLE) GADCorrelator *correlator;

***REMOVED***/ Indicates that the publisher will record impressions manually when the ad becomes visible to the
***REMOVED***/ user.
@property(nonatomic, assign) BOOL enableManualImpressions;

***REMOVED***/ Optional delegate object for custom rendered ads.
@property(nonatomic, weak, GAD_NULLABLE)
    IBOutlet id<DFPCustomRenderedBannerViewDelegate> customRenderedBannerViewDelegate;

***REMOVED***/ Video controller for controlling video rendered by this ad view.
@property(nonatomic, strong, readonly) GADVideoController *videoController;

***REMOVED***/ If you've set enableManualImpressions to YES, call this method when the ad is visible.
- (void)recordImpression;

***REMOVED***/ Use this function to resize the banner view without launching a new ad request.
- (void)resize:(GADAdSize)size;

***REMOVED***/ Sets options that configure ad loading.
***REMOVED***/
***REMOVED***/ @param adOptions An array of GADAdLoaderOptions objects. The array is deep copied and option
***REMOVED***/ objects cannot be modified after calling this method.
- (void)setAdOptions:(NSArray *)adOptions;

#pragma mark Deprecated

***REMOVED***/ Deprecated. Use the validAdSizes property.
***REMOVED***/ Sets the receiver's valid ad sizes to the values pointed to by the provided NULL terminated list
***REMOVED***/ of GADAdSize pointers.
***REMOVED***/
***REMOVED***/ Example:
***REMOVED***/
***REMOVED***/   <pre>
***REMOVED***/   GADAdSize size1 = kGADAdSizeBanner;
***REMOVED***/   GADAdSize size2 = kGADAdSizeLargeBanner;
***REMOVED***/   [bannerView setValidAdSizesWithSizes:&size1, &size2, NULL];
***REMOVED***/   </pre>
- (void)setValidAdSizesWithSizes:(GADAdSize *)firstSize, ... NS_REQUIRES_NIL_TERMINATION
                                 GAD_DEPRECATED_MSG_ATTRIBUTE("Use validAdSizes property.");

***REMOVED***

GAD_ASSUME_NONNULL_END
