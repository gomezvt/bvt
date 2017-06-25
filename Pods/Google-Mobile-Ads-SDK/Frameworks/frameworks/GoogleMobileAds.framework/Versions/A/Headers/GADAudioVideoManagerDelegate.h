***REMOVED***
***REMOVED***  GADAudioVideoManagerDelegate.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2016 Google Inc. All rights reserved.
***REMOVED***

#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

@class GADAudioVideoManager;

GAD_ASSUME_NONNULL_BEGIN

@protocol GADAudioVideoManagerDelegate<NSObject>

@optional

***REMOVED***/ Tells the delegate that the Google Mobile Ads SDK will start playing a video. This method isn't
***REMOVED***/ called if another video rendered by Google Mobile Ads SDK is already playing.
- (void)audioVideoManagerWillPlayVideo:(GADAudioVideoManager *)audioVideoManager;

***REMOVED***/ Tells the delegate that the Google Mobile Ads SDK has paused/stopped all video playback.
- (void)audioVideoManagerDidPauseAllVideo:(GADAudioVideoManager *)audioVideoManager;

***REMOVED***/ Tells the delegate that at least one video rendered by the Google Mobile Ads SDK will play
***REMOVED***/ sound. Your app should stop playing sound when this method is called.
- (void)audioVideoManagerWillPlayAudio:(GADAudioVideoManager *)audioVideoManager;

***REMOVED***/ Tells the delegate that all the video rendered by the Google Mobile Ads SDK has stopped playing
***REMOVED***/ sound. Your app can now resume any music playback or produce any kind of sound. Note that this
***REMOVED***/ message doesn't mean that all the video has stopped playing, just audio, so you shouldn't
***REMOVED***/ deactivate AVAudioSession's instance. Doing so can lead to unexpected video playback behavior.
***REMOVED***/ You may deactivate AVAudioSession only when all rendered video ads are paused or have finished
***REMOVED***/ playing, and 'audioVideoDidPauseAllVideo:' is called.
- (void)audioVideoManagerDidStopPlayingAudio:(GADAudioVideoManager *)audioVideoManager;

***REMOVED***

GAD_ASSUME_NONNULL_END
