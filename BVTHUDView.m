***REMOVED***
***REMOVED***  BVTHUDView.m
***REMOVED***  bvt
***REMOVED***
***REMOVED***  Created by Greg on 2/19/17.
***REMOVED***  Copyright © 2017 gms. All rights reserved.
***REMOVED***

#import "BVTHUDView.h"

@interface BVTHUDView ()

***REMOVED***

@implementation BVTHUDView

+ (instancetype)hudWithView:(UIView *)view
***REMOVED***
    CGRect rect = CGRectMake(0, 0, 80, 80);
    
    BVTHUDView *hud = [[self alloc] initWithFrame:rect];
    hud.center = view.center;
    [view addSubview:hud];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, -150, 80, 80)];
    label.text = @"Loading...";
    label.textAlignment = NSTextAlignmentCenter;
    [hud addSubview:label];

    return hud;
***REMOVED***

***REMOVED***
