***REMOVED***
***REMOVED***  GADAudioVideoManager.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2016 Google Inc. All rights reserved.
***REMOVED***

#import <GoogleMobileAds/GADAudioVideoManagerDelegate.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Provides audio and video notifications and configurations management. Available only on iOS 7
***REMOVED***/ and above.
***REMOVED***/
***REMOVED***/ Don't create an instance of this class and use the one available from GADMobileAds
***REMOVED***/ sharedInstace's audioVideoManager.
@interface GADAudioVideoManager : NSObject

***REMOVED***/ Delegate for receiving video and audio updates.
@property(nonatomic, weak, nullable) id<GADAudioVideoManagerDelegate> delegate;

***REMOVED***/ Indicates whether the application wishes to manage audio session. If set as YES, the Google
***REMOVED***/ Mobile Ads SDK will stop managing AVAudioSession during the video playback lifecycle. If set as
***REMOVED***/ NO, the Google Mobile Ads SDK will control AVAudioSession. That may include: setting
***REMOVED***/ AVAudioSession's category to AVAudioSessionCategoryAmbient when all videos are muted, setting
***REMOVED***/ AVAudioSession's category to AVAudioSessionCategorySoloAmbient when any playing video becomes
***REMOVED***/ unmuted, and allowing background apps to continue playing sound when all videos rendered by
***REMOVED***/ Google Mobile Ads SDK are muted or have stopped playing.
@property(nonatomic, assign) BOOL audioSessionIsApplicationManaged;

***REMOVED***

GAD_ASSUME_NONNULL_END
