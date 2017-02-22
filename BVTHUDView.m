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
    BVTHUDView *hud = [[self alloc] initWithFrame:CGRectMake(0, 0, 80.f, 80.f)];
    [view addSubview:hud];
    
    UIActivityIndicatorView *ai = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    ai.center = hud.center;
    [ai startAnimating];
    [hud addSubview:ai];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 80, 20)];
    label.text = @"Loading...";
    [hud addSubview:label];

    hud.center = view.center;

    return hud;
***REMOVED***

***REMOVED***
