***REMOVED***
***REMOVED***  GADSearchBannerView.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2011 Google Inc. All rights reserved.
***REMOVED***

#import <GoogleMobileAds/GADAdSizeDelegate.h>
#import <GoogleMobileAds/GADBannerView.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ A view that displays search ads.
***REMOVED***/ To show search ads:
***REMOVED***/   1) Create a GADSearchBannerView and add it to your view controller's view hierarchy.
***REMOVED***/   2) Create a GADSearchRequest ad request object to hold the search query and other search data.
***REMOVED***/   3) Call GADSearchBannerView's -loadRequest: method with the GADSearchRequest object.
@interface GADSearchBannerView : GADBannerView

***REMOVED***/ If the banner view is initialized with kGADAdSizeFluid and the corresponding request is created
***REMOVED***/ with dynamic height parameters, this delegate will be called when the ad size changes.
@property(nonatomic, weak, GAD_NULLABLE) IBOutlet id<GADAdSizeDelegate> adSizeDelegate;

***REMOVED***

GAD_ASSUME_NONNULL_END
