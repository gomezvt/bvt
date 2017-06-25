***REMOVED***
***REMOVED***  GADRequest.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2011 Google Inc. All rights reserved.
***REMOVED***

#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>

#import <GoogleMobileAds/GADAdNetworkExtras.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Add this constant to the testDevices property's array to receive test ads on the simulator.
GAD_EXTERN const id kGADSimulatorID;

***REMOVED***/ Genders to help deliver more relevant ads.
typedef NS_ENUM(NSInteger, GADGender) ***REMOVED***
  kGADGenderUnknown,  ***REMOVED***/< Unknown gender.
  kGADGenderMale,     ***REMOVED***/< Male gender.
  kGADGenderFemale    ***REMOVED***/< Female gender.
***REMOVED***;

***REMOVED***/ Specifies optional parameters for ad requests.
@interface GADRequest : NSObject<NSCopying>

***REMOVED***/ Returns a default request.
+ (instancetype)request;

#pragma mark Additional Parameters For Ad Networks

***REMOVED***/ Ad networks may have additional parameters they accept. To pass these parameters to them, create
***REMOVED***/ the ad network extras object for that network, fill in the parameters, and register it here. The
***REMOVED***/ ad network should have a header defining the interface for the 'extras' object to create. All
***REMOVED***/ networks will have access to the basic settings you've set in this GADRequest (gender, birthday,
***REMOVED***/ testing mode, etc.). If you register an extras object that is the same class as one you have
***REMOVED***/ registered before, the previous extras will be overwritten.
- (void)registerAdNetworkExtras:(id<GADAdNetworkExtras>)extras;

***REMOVED***/ Returns the network extras defined for an ad network.
- (id<GADAdNetworkExtras> GAD_NULLABLE_TYPE)adNetworkExtrasFor:(Class<GADAdNetworkExtras>)aClass;

***REMOVED***/ Removes the extras for an ad network. |aClass| is the class which represents that network's
***REMOVED***/ extras type.
- (void)removeAdNetworkExtrasFor:(Class<GADAdNetworkExtras>)aClass;

#pragma mark Collecting SDK Information

***REMOVED***/ Returns the version of the SDK.
+ (NSString *)sdkVersion;

#pragma mark Testing

***REMOVED***/ Test ads will be returned for devices with device IDs specified in this array.
@property(nonatomic, copy, GAD_NULLABLE) NSArray *testDevices;

#pragma mark User Information

***REMOVED***/ Provide the user's gender to increase ad relevancy.
@property(nonatomic, assign) GADGender gender;

***REMOVED***/ Provide the user's birthday to increase ad relevancy.
@property(nonatomic, copy, GAD_NULLABLE) NSDate *birthday;

***REMOVED***/ The user's current location may be used to deliver more relevant ads. However do not use Core
***REMOVED***/ Location just for advertising, make sure it is used for more beneficial reasons as well. It is
***REMOVED***/ both a good idea and part of Apple's guidelines.
- (void)setLocationWithLatitude:(CGFloat)latitude
                      longitude:(CGFloat)longitude
                       accuracy:(CGFloat)accuracyInMeters;

***REMOVED***/ [Optional] This method allows you to specify whether you would like your app to be treated as
***REMOVED***/ child-directed for purposes of the Children’s Online Privacy Protection Act (COPPA),
***REMOVED***/ http:***REMOVED***/business.ftc.gov/privacy-and-security/childrens-privacy.
***REMOVED***/
***REMOVED***/ If you call this method with YES, you are indicating that your app should be treated as
***REMOVED***/ child-directed for purposes of the Children’s Online Privacy Protection Act (COPPA). If you call
***REMOVED***/ this method with NO, you are indicating that your app should not be treated as child-directed
***REMOVED***/ for purposes of the Children’s Online Privacy Protection Act (COPPA). If you do not call this
***REMOVED***/ method, ad requests will include no indication of how you would like your app treated with
***REMOVED***/ respect to COPPA.
***REMOVED***/
***REMOVED***/ By setting this method, you certify that this notification is accurate and you are authorized to
***REMOVED***/ act on behalf of the owner of the app. You understand that abuse of this setting may result in
***REMOVED***/ termination of your Google account.
***REMOVED***/
***REMOVED***/ It may take some time for this designation to be fully implemented in applicable Google
***REMOVED***/ services. This designation will only apply to ad requests for which you have set this method.
- (void)tagForChildDirectedTreatment:(BOOL)childDirectedTreatment;

#pragma mark Contextual Information

***REMOVED***/ Array of keyword strings. Keywords are words or phrases describing the current user activity
***REMOVED***/ such as @"Sports Scores" or @"Football". Set this property to nil to clear the keywords.
@property(nonatomic, copy, GAD_NULLABLE) NSArray *keywords;

***REMOVED***/ URL string for a webpage whose content matches the app content. This webpage content is used for
***REMOVED***/ targeting purposes.
@property(nonatomic, copy, GAD_NULLABLE) NSString *contentURL;

#pragma mark Request Agent Information

***REMOVED***/ String that identifies the ad request's origin. Third party libraries that reference the Mobile
***REMOVED***/ Ads SDK should set this property to denote the platform from which the ad request originated.
***REMOVED***/ For example, a third party ad network called "CoolAds network" that is mediating requests to the
***REMOVED***/ Mobile Ads SDK should set this property as "CoolAds".
@property(nonatomic, copy, GAD_NULLABLE) NSString *requestAgent;

#pragma mark Deprecated Methods

***REMOVED***/ Provide the user's birthday to increase ad relevancy.
- (void)setBirthdayWithMonth:(NSInteger)month
                         day:(NSInteger)day
                        year:(NSInteger)year
    GAD_DEPRECATED_MSG_ATTRIBUTE(" use the birthday property.");

***REMOVED***/ When Core Location isn't available but the user's location is known supplying it here may
***REMOVED***/ deliver more relevant ads. It can be any free-form text such as @"Champs-Elysees Paris" or
***REMOVED***/ @"94041 US".
- (void)setLocationWithDescription:(NSString *GAD_NULLABLE_TYPE)locationDescription
    GAD_DEPRECATED_MSG_ATTRIBUTE(" use setLocationWithLatitude:longitude:accuracy:.");

***REMOVED***

GAD_ASSUME_NONNULL_END
