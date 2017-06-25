***REMOVED***
***REMOVED***  GADVideoOptions.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2016 Google Inc. All rights reserved.
***REMOVED***

#import <GoogleMobileAds/GADAdLoader.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Video ad options.
@interface GADVideoOptions : GADAdLoaderOptions

***REMOVED***/ Indicates if videos should start muted. By default this property value is YES.
@property(nonatomic, assign) BOOL startMuted;

***REMOVED***/ Indicates if the requested video should have custom controls enabled for play/pause/mute/unmute.
@property(nonatomic, assign) BOOL customControlsRequested;

***REMOVED***

GAD_ASSUME_NONNULL_END
