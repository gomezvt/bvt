***REMOVED***
***REMOVED***  RootViewController.h
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/23/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface RootViewController : UIViewController <UIPageViewControllerDataSource>

- (IBAction)startWalkthrough:(id)sender;

@property (nonatomic, weak) IBOutlet UIButton *start;
@property (strong, nonatomic) UIPageViewController *pageViewController;

@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *images;

***REMOVED***
