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
    BVTHUDView *hud = [[self alloc] initWithFrame:CGRectMake(0,0,70,70)];
    hud.backgroundColor = [UIColor redColor];
    
    [view addSubview:hud];
    
    return hud;
***REMOVED***+ (instancetype)configureHUDWithView:(UIView *)view animated:(BOOL)animated
***REMOVED******REMOVED***
***REMOVED***    BVTHUDView *hud = [[BVTHUDView alloc] initWithFrame:CGRectMake(0,0,70.f,70.f)];
***REMOVED***    
***REMOVED***    [view addSubview:hud];
***REMOVED*** 
***REMOVED***    return hud;
***REMOVED******REMOVED***
***REMOVED***


***REMOVED***
