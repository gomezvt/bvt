***REMOVED***
***REMOVED***  GADDebugOptionsViewController.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2016 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

@class GADDebugOptionsViewController;

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Delegate for the GADDebugOptionsViewController.
@protocol GADDebugOptionsViewControllerDelegate<NSObject>
***REMOVED***/ Called when the debug options flow is finished.
- (void)debugOptionsViewControllerDidDismiss:(GADDebugOptionsViewController *)controller;
***REMOVED***

***REMOVED***/ Displays debug options to the user.
@interface GADDebugOptionsViewController : UIViewController

***REMOVED***/ Creates and returns a GADDebugOptionsViewController object initialized with the ad unit ID.
***REMOVED***/ @param adUnitID An ad unit ID for the DFP account that is being configured with debug options.
+ (instancetype)debugOptionsViewControllerWithAdUnitID:(NSString *)adUnitID;

***REMOVED***/ Delegate for the debug options view controller.
@property(nonatomic, weak, GAD_NULLABLE)
    IBOutlet id<GADDebugOptionsViewControllerDelegate> delegate;

***REMOVED***

GAD_ASSUME_NONNULL_END
