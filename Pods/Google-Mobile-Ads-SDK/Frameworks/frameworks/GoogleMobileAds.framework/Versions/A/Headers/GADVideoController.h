***REMOVED***
***REMOVED***  GADVideoController.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright (c) 2016 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

@protocol GADVideoControllerDelegate;

***REMOVED***/ The video controller class provides a way to get the video metadata and also manages video
***REMOVED***/ content of the ad rendered by the Google Mobile Ads SDK. You don't need to create an instance of
***REMOVED***/ this class. When the ad rendered by the Google Mobile Ads SDK loads video content, you may be
***REMOVED***/ able to get an instance of this class from the rendered ad object. Currently only native express
***REMOVED***/ ad view class exposes video controller.
@interface GADVideoController : NSObject

***REMOVED***/ Delegate for receiving video notifications.
@property(nonatomic, weak, GAD_NULLABLE) id<GADVideoControllerDelegate> delegate;

***REMOVED***/ Mute or unmute video. Set to YES to mute the video. Set to NO to allow the video to play sound.
- (void)setMute:(BOOL)mute;

***REMOVED***/ Play the video. Doesn't do anything if the video is already playing.
- (void)play;

***REMOVED***/ Pause the video. Doesn't do anything if the video is already paused.
- (void)pause;

***REMOVED***/ Returns a Boolean indicating if the receiver has video content.
- (BOOL)hasVideoContent;

***REMOVED***/ Returns the video's aspect ratio (width/height) or 0 if no video is present.
- (double)aspectRatio;

***REMOVED***/ Indicates if video custom controls (i.e. play/pause/mute/unmute) are enabled.
- (BOOL)customControlsEnabled;

***REMOVED***

GAD_ASSUME_NONNULL_END
