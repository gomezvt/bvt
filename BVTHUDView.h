***REMOVED***
***REMOVED***  BVTHUDView.h
***REMOVED***  bvt
***REMOVED***
***REMOVED***  Created by Greg on 2/19/17.
***REMOVED***  Copyright © 2017 gms. All rights reserved.
***REMOVED***

#import <UIKit/UIKit.h>

@interface BVTHUDView : UIView

@property (nonatomic, weak) IBOutlet UILabel *label;

***REMOVED***+ (instancetype)configureHUDWithView:(UIView *)view animated:(BOOL)animated;
+ (instancetype)hudWithView:(UIView *)view;

***REMOVED***
