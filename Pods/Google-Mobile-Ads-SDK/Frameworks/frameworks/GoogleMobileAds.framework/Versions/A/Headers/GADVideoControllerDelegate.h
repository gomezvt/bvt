***REMOVED***
***REMOVED***  GADVideoControllerDelegate.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright (c) 2016 Google Inc. All rights reserved.
***REMOVED***

#import <GoogleMobileAds/GADVideoController.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ The GADVideoControllerDelegate protocol defines methods that are called by the video controller
***REMOVED***/ object in response to the video events that occured throught the lifetime of the video rendered
***REMOVED***/ by an ad.
@protocol GADVideoControllerDelegate<NSObject>

@optional

***REMOVED***/ Tells the delegate that the video controller has began or resumed playing a video.
- (void)videoControllerDidPlayVideo:(GADVideoController *)videoController;

***REMOVED***/ Tells the delegate that the video controller has paused video.
- (void)videoControllerDidPauseVideo:(GADVideoController *)videoController;

***REMOVED***/ Tells the delegate that the video controller's video playback has ended.
- (void)videoControllerDidEndVideoPlayback:(GADVideoController *)videoController;

***REMOVED***/ Tells the delegate that the video controller has muted video.
- (void)videoControllerDidMuteVideo:(GADVideoController *)videoController;

***REMOVED***/ Tells the delegate that the video controller has unmuted video.
- (void)videoControllerDidUnmuteVideo:(GADVideoController *)videoController;

***REMOVED***

GAD_ASSUME_NONNULL_END
