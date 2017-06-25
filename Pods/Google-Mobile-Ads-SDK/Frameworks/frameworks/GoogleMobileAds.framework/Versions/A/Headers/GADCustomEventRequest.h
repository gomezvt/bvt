***REMOVED***
***REMOVED***  GADCustomEventRequest.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2012 Google Inc. All rights reserved.
***REMOVED***

#import <UIKit/UIKit.h>

#import <GoogleMobileAds/GADRequest.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

@class GADCustomEventExtras;

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Specifies optional ad request targeting parameters that are provided by the publisher and are
***REMOVED***/ forwarded to custom events for purposes of populating an ad request to a 3rd party ad network.
@interface GADCustomEventRequest : NSObject

***REMOVED***/ User's gender set in GADRequest. If not specified, returns kGADGenderUnknown.
@property(nonatomic, readonly, assign) GADGender userGender;

***REMOVED***/ User's birthday set in GADRequest. If not specified, returns nil.
@property(nonatomic, readonly, copy, GAD_NULLABLE) NSDate *userBirthday;

***REMOVED***/ If the user's latitude, longitude, and accuracy are not specified, userHasLocation returns NO,
***REMOVED***/ and userLatitude, userLongitude, and userLocationAccuracyInMeters return 0.
@property(nonatomic, readonly, assign) BOOL userHasLocation;

***REMOVED***/ User's latitude set in GADRequest.
@property(nonatomic, readonly, assign) CGFloat userLatitude;

***REMOVED***/ User's longitude set in GADRequest.
@property(nonatomic, readonly, assign) CGFloat userLongitude;

***REMOVED***/ The accuracy, in meters, of the user's location data.
@property(nonatomic, readonly, assign) CGFloat userLocationAccuracyInMeters;

***REMOVED***/ Description of the user's location, in free form text, set in GADRequest. If not available,
***REMOVED***/ returns nil. This may be set even if userHasLocation is NO.
@property(nonatomic, readonly, copy, GAD_NULLABLE) NSString *userLocationDescription;

***REMOVED***/ Keywords set in GADRequest. Returns nil if no keywords are set.
@property(nonatomic, readonly, copy, GAD_NULLABLE) NSArray *userKeywords;

***REMOVED***/ The additional parameters set by the application. This property allows you to pass additional
***REMOVED***/ information from your application to your Custom Event object. To do so, create an instance of
***REMOVED***/ GADCustomEventExtras to pass to GADRequest -registerAdNetworkExtras:. The instance should have
***REMOVED***/ an NSDictionary set for a particular custom event label. That NSDictionary becomes the
***REMOVED***/ additionalParameters here.
@property(nonatomic, readonly, copy, GAD_NULLABLE) NSDictionary *additionalParameters;

***REMOVED***/ Indicates if the testing property has been set in GADRequest.
@property(nonatomic, readonly, assign) BOOL isTesting;

***REMOVED***

GAD_ASSUME_NONNULL_END
