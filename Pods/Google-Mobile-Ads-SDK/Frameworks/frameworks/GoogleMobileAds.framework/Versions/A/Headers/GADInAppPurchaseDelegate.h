***REMOVED***
***REMOVED***  GADInAppPurchaseDelegate.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2013 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>

#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

@class GADDefaultInAppPurchase;
@class GADInAppPurchase;

GAD_ASSUME_NONNULL_BEGIN

#pragma mark - Default Purchase Flow

***REMOVED***/ In-app purchase delegate protocol for default purchase handling. The delegate must deliver
***REMOVED***/ the purchased item then call the GADDefaultInAppPurchase object's finishTransaction method.
GAD_DEPRECATED_ATTRIBUTE
@protocol GADDefaultInAppPurchaseDelegate<NSObject>

***REMOVED***/ Called when the user successfully paid for a purchase. You must first deliver the purchased
***REMOVED***/ item to the user, then call defaultInAppPurchase's finishTransaction method.
- (void)userDidPayForPurchase:(GADDefaultInAppPurchase *)defaultInAppPurchase;

@optional

***REMOVED***/ Called when the user clicks on the buy button of an in-app purchase ad. Return YES if the
***REMOVED***/ default purchase flow should be started to purchase the item, otherwise return NO. If not
***REMOVED***/ implemented, defaults to YES.
- (BOOL)shouldStartPurchaseForProductID:(NSString *)productID quantity:(NSInteger)quantity;

***REMOVED***

#pragma mark - Custom Purchase Flow

***REMOVED***/ In-app purchase delegate protocol for custom purchase handling. The delegate must handle the
***REMOVED***/ product purchase flow then call the GADInAppPurchase object's reportPurchaseStatus: method.
GAD_DEPRECATED_ATTRIBUTE
@protocol GADInAppPurchaseDelegate<NSObject>

***REMOVED***/ Called when the user clicks on the buy button of an in-app purchase ad. After the receiver
***REMOVED***/ handles the purchase, it must call the GADInAppPurchase object's reportPurchaseStatus: method.
- (void)didReceiveInAppPurchase:(GADInAppPurchase *)purchase;

***REMOVED***

GAD_ASSUME_NONNULL_END
