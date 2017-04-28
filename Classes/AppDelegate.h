***REMOVED***
***REMOVED***  AppDelegate.h
***REMOVED***  bvt
***REMOVED***
***REMOVED***  Created by Greg on 1/15/17.
***REMOVED***  Copyright © 2017 gms. All rights reserved.
***REMOVED***

@import UIKit;

@class YLPClient;
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) CLLocation *userLocation;

+ (YLPClient *)sharedClient;

***REMOVED***
