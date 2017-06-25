***REMOVED***
***REMOVED***  BVTTabBarController.m
***REMOVED***  bvt
***REMOVED***
***REMOVED***  Created by Greg on 5/14/17.
***REMOVED***  Copyright © 2017 gms. All rights reserved.
***REMOVED***

#import "BVTTabBarController.h"

#import "BVTStyles.h"

@interface BVTTabBarController ()

***REMOVED***

@implementation BVTTabBarController

- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    CGRect mainScreen = [[UIScreen mainScreen] bounds];
    CGFloat tabBarVertical = mainScreen.size.height - 100.f;
    
    [self.tabBar setFrame:CGRectMake(0, tabBarVertical, self.tabBar.frame.size.width, self.tabBar.frame.size.height)];

    [self.tabBar setTintColor:[BVTStyles tabBarTint]];
***REMOVED***

***REMOVED***
