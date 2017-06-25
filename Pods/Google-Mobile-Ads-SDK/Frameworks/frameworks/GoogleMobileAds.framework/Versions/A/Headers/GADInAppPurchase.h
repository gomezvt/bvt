***REMOVED***
***REMOVED***  GADInAppPurchase.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2013 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

@protocol GADDefaultInAppPurchaseDelegate;

#pragma mark - Default Purchase Flow

***REMOVED***/ The consumable in-app purchase item that has been purchased by the user. The purchase flow is
***REMOVED***/ handled by the Google Mobile Ads SDK.
***REMOVED***/ Instances of this class are created and passed to your in-app purchase delegate after the user
***REMOVED***/ has successfully paid for a product. Your code must correctly deliver the product to the user
***REMOVED***/ and then call the didCompletePurchase method to finish the transaction.

GAD_DEPRECATED_ATTRIBUTE
@interface GADDefaultInAppPurchase : NSObject

***REMOVED***/ Enables the default consumable product in-app purchase flow handled by the Google Mobile Ads
***REMOVED***/ SDK. The GADDefaultInAppPurchaseDelegate object is retained while the default purchase flow is
***REMOVED***/ enabled. This method adds a SKPaymentTransactionObserver to the default SKPaymentQueue.
***REMOVED***/
***REMOVED***/ Call this method early in your application to handle unfinished transactions from previous
***REMOVED***/ application sessions. For example, call this method in your application delegate's
***REMOVED***/ application:didFinishLaunchingWithOptions: method.
+ (void)enableDefaultPurchaseFlowWithDelegate:(id<GADDefaultInAppPurchaseDelegate>)delegate;

***REMOVED***/ Disables the default in-app purchase flow handled by the Google Mobile Ads SDK and releases the
***REMOVED***/ associated GADDefaultInAppPurchaseDelegate object.
+ (void)disableDefaultPurchaseFlow;

***REMOVED***/ The in-app purchase product ID.
@property(nonatomic, readonly, copy) NSString *productID;

***REMOVED***/ The product quantity.
@property(nonatomic, readonly, assign) NSInteger quantity;

***REMOVED***/ The purchased item's completed payment transaction. Your application can use this property's
***REMOVED***/ data to save a permanent record of the completed payment. The default purchase flow will finish
***REMOVED***/ the transaction on your behalf. Do not finish the transaction yourself.
@property(nonatomic, readonly, strong) SKPaymentTransaction *paymentTransaction;

***REMOVED***/ The in-app purchase delegate object must first deliver the user's item and then call this
***REMOVED***/ method. Failure to call this method will result in duplicate purchase notifications.
- (void)finishTransaction;

***REMOVED***

#pragma mark - Custom Purchase Flow

***REMOVED***/ Enum of the different statuses resulting from processing a purchase.
GAD_DEPRECATED_ATTRIBUTE
typedef NS_ENUM(NSInteger, GADInAppPurchaseStatus) ***REMOVED***
  kGADInAppPurchaseStatusError = 0,          ***REMOVED***/< Error occured while processing the purchase.
  kGADInAppPurchaseStatusSuccessful = 1,     ***REMOVED***/< Purchase was completed successfully.
  kGADInAppPurchaseStatusCancel = 2,         ***REMOVED***/< Purchase was cancelled by the user.
  kGADInAppPurchaseStatusInvalidProduct = 3  ***REMOVED***/< Error occured while looking up the product.
***REMOVED***;

***REMOVED***/ The in-app purchase item to be purchased with the purchase flow handled by you, the
***REMOVED***/ application developer.
***REMOVED***/ Instances of this class are created and passed to your GADInAppPurchaseDelegate object when
***REMOVED***/ users click a buy button. It is important to report the result of the purchase back to the SDK
***REMOVED***/ in order to track metrics about the transaction.
GAD_DEPRECATED_ATTRIBUTE
@interface GADInAppPurchase : NSObject

***REMOVED***/ The in-app purchase product ID.
@property(nonatomic, readonly, copy) NSString *productID;

***REMOVED***/ The product quantity.
@property(nonatomic, readonly, assign) NSInteger quantity;

***REMOVED***/ The GADInAppPurchaseDelegate object must call this method after handling the in-app purchase for
***REMOVED***/ both successful and unsuccessful purchase attempts. This method reports ad conversion and
***REMOVED***/ purchase status information to Google.
- (void)reportPurchaseStatus:(GADInAppPurchaseStatus)purchaseStatus;

***REMOVED***

GAD_ASSUME_NONNULL_END
