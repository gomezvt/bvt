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

+ (instancetype)configureHUDWithView:(UIView *)view animated:(BOOL)animated
***REMOVED***
    BVTHUDView *hud = [[self alloc] initWithFrame:CGRectMake(0,0,70.f,70.f)];
    
    [view addSubview:hud];
 
    return hud;
***REMOVED***


***REMOVED***
