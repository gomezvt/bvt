***REMOVED***
***REMOVED***  GADAdDelegate.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2015 Google Inc. All rights reserved.
***REMOVED***

#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

#pragma mark - Audio Control Notifications

***REMOVED***/ Delegate methods common to multiple ad types.
@protocol GADAdDelegate<NSObject>

@optional

#pragma mark Audio Control Methods

***REMOVED***/ Asks the delegate if the audio session category can be changed while displaying an ad. Return NO
***REMOVED***/ to prevent the Google Mobile Ads SDK from changing the audio session category. The default
***REMOVED***/ behavior if unimplemented is to return YES.
- (BOOL)ad:(id)ad shouldChangeAudioSessionToCategory:(NSString *)audioSessionCategory;

***REMOVED***

GAD_ASSUME_NONNULL_END
