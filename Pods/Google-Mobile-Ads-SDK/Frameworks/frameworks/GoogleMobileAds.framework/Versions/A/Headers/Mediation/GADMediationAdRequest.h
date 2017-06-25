***REMOVED***
***REMOVED***  GADMediationAdRequest.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>
#import <GoogleMobileAds/GoogleMobileAds.h>

***REMOVED***/ Provides information which can be used for making ad requests during mediation.
@protocol GADMediationAdRequest<NSObject>

***REMOVED***/ Publisher ID set by the publisher on the AdMob frontend.
- (NSString *)publisherId;

***REMOVED***/ Mediation configurations set by the publisher on the AdMob frontend.
- (NSDictionary *)credentials;

***REMOVED***/ Returns YES if the publisher is requesting test ads.
- (BOOL)testMode;

***REMOVED***/ The adapter's ad network extras specified in GADRequest.
- (id<GADAdNetworkExtras>)networkExtras;

***REMOVED***/ Returns the value of childDirectedTreatment supplied by the publisher. Returns nil if the
***REMOVED***/ publisher hasn't specified child directed treatment. Returns @YES if child directed treatment is
***REMOVED***/ enabled.
- (NSNumber *)childDirectedTreatment;

***REMOVED***/ The end user's gender set by the publisher in GADRequest. Returns kGADGenderUnknown if it has
***REMOVED***/ not been specified.
- (GADGender)userGender;

***REMOVED***/ The end user's birthday set by the publisher. Returns nil if it has not been specified.
- (NSDate *)userBirthday;

***REMOVED***/ Returns YES if the publisher has specified latitude and longitude location.
- (BOOL)userHasLocation;

***REMOVED***/ Returns the user's latitude or 0 if location isn't specified.
- (CGFloat)userLatitude;

***REMOVED***/ Returns the user's longitude or 0 if location isn't specified.
- (CGFloat)userLongitude;

***REMOVED***/ Returns the user's location accuracy or 0 if location isn't specified.
- (CGFloat)userLocationAccuracyInMeters;

***REMOVED***/ Returns user's location description. May return a value even if userHasLocation is NO.
- (NSString *)userLocationDescription;

***REMOVED***/ Keywords describing the user's current activity. Example: @"Sport Scores".
- (NSArray *)userKeywords;

***REMOVED***
