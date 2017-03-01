***REMOVED***
***REMOVED***  BVTHUDView.h
***REMOVED***  bvt
***REMOVED***
***REMOVED***  Created by Greg on 2/19/17.
***REMOVED***  Copyright © 2017 gms. All rights reserved.
***REMOVED***

#import <UIKit/UIKit.h>

@protocol BVTHUDViewDelegate <NSObject>

- (void)didTapHUDCancelButton;

***REMOVED***

@interface BVTHUDView : UIView

+ (instancetype)hudWithView:(UIView *)view;
@property(nonatomic, weak)id <BVTHUDViewDelegate> delegate;

***REMOVED***
