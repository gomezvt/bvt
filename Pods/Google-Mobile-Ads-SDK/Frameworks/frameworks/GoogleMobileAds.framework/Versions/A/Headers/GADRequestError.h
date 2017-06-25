***REMOVED***
***REMOVED***  GADRequestError.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2011 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>

#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

@class GADRequest;

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Google AdMob Ads error domain.
GAD_EXTERN NSString *const kGADErrorDomain;

***REMOVED***/ NSError codes for GAD error domain.
typedef NS_ENUM(NSInteger, GADErrorCode) ***REMOVED***
  ***REMOVED***/ The ad request is invalid. The localizedFailureReason error description will have more
  ***REMOVED***/ details. Typically this is because the ad did not have the ad unit ID or root view
  ***REMOVED***/ controller set.
  kGADErrorInvalidRequest,

  ***REMOVED***/ The ad request was successful, but no ad was returned.
  kGADErrorNoFill,

  ***REMOVED***/ There was an error loading data from the network.
  kGADErrorNetworkError,

  ***REMOVED***/ The ad server experienced a failure processing the request.
  kGADErrorServerError,

  ***REMOVED***/ The current device's OS is below the minimum required version.
  kGADErrorOSVersionTooLow,

  ***REMOVED***/ The request was unable to be loaded before being timed out.
  kGADErrorTimeout,

  ***REMOVED***/ Will not send request because the interstitial object has already been used.
  kGADErrorInterstitialAlreadyUsed,

  ***REMOVED***/ The mediation response was invalid.
  kGADErrorMediationDataError,

  ***REMOVED***/ Error finding or creating a mediation ad network adapter.
  kGADErrorMediationAdapterError,

  ***REMOVED***/ The mediation request was successful, but no ad was returned from any ad networks.
  kGADErrorMediationNoFill,

  ***REMOVED***/ Attempting to pass an invalid ad size to an adapter.
  kGADErrorMediationInvalidAdSize,

  ***REMOVED***/ Internal error.
  kGADErrorInternalError,

  ***REMOVED***/ Invalid argument error.
  kGADErrorInvalidArgument,

  ***REMOVED***/ Received invalid response.
  kGADErrorReceivedInvalidResponse
***REMOVED***;

***REMOVED***/ Represents the error generated due to invalid request parameters.
@interface GADRequestError : NSError
***REMOVED***

GAD_ASSUME_NONNULL_END
