***REMOVED***
***REMOVED***  BVTHUDView.m
***REMOVED***  bvt
***REMOVED***
***REMOVED***  Created by Greg on 2/19/17.
***REMOVED***  Copyright © 2017 gms. All rights reserved.
***REMOVED***

#import "BVTHUDView.h"

#import "BVTStyles.h"

@interface BVTHUDView ()

***REMOVED***

@implementation BVTHUDView

+ (instancetype)hudWithView:(UIView *)view
***REMOVED***
    UIColor *green = [BVTStyles iconGreen];
    
    BVTHUDView *hud = [[self alloc] initWithFrame:CGRectMake(0.f, 0.f, 110.f, 175.f)];
    [view addSubview:hud];
    
    ***REMOVED*** Build back plate for HUD components
    UIView *backDrop = [[UIView alloc] initWithFrame:CGRectMake(0.f, 0.f, 110.f, 110.f)];
    backDrop.backgroundColor = green;
    backDrop.layer.cornerRadius = 20.f;
    backDrop.alpha = .9f;
    [hud addSubview:backDrop];

    ***REMOVED*** Get activity indicator and add to hud plate
    UIActivityIndicatorView *ai = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    ai.center = CGPointMake(hud.center.x, 40.f);
    [ai startAnimating];
    [hud addSubview:ai];
    
    ***REMOVED*** Get "loading" label and add to hud place
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 0.f, 80.f, 20.f)];
    label.textColor = [UIColor whiteColor];
    label.center = CGPointMake(hud.center.x, 80.f);
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:16.f weight:UIFontWeightBold];
    label.text = @"Loading...";
    [hud addSubview:label];

    ***REMOVED*** Build plate to contain cancel button and add to hud place
    UIView *cancelView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 0.f, 110.f, 50.f)];
    cancelView.backgroundColor = green;
    cancelView.layer.cornerRadius = 20.f;
    cancelView.center = CGPointMake(hud.center.x, 140.f);
    cancelView.alpha = .9f;
    
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(0.f, 0.f, 110.f, 30.f)];
    [cancelButton setTitle:@"Tap to Cancel" forState:UIControlStateNormal];
    [cancelButton.titleLabel setFont:[UIFont systemFontOfSize:13.f]];
    [cancelButton addTarget:nil action:@selector(didTapHUDCancel:) forControlEvents:UIControlEventTouchUpInside];
    cancelButton.center = CGPointMake(cancelView.center.x, 25.f);
    [cancelView addSubview:cancelButton];
    [hud addSubview:cancelView];

    ***REMOVED*** Center hud plate to view
    hud.center = view.center;
    
    return hud;
***REMOVED***

- (void)didTapHUDCancel:(id)sender
***REMOVED***
    if ([self.delegate respondsToSelector:@selector(didTapHUDCancelButton)])
    ***REMOVED***
        [self.delegate didTapHUDCancelButton];
    ***REMOVED***
***REMOVED***

***REMOVED***
