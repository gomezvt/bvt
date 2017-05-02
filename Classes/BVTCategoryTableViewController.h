***REMOVED***
***REMOVED***  BVTCategoryTableViewController.h
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/20/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import <UIKit/UIKit.h>

@protocol BVTCategoryTableViewControllerDelegate <NSObject>

- (void)didTapBackWithDetails:(NSMutableArray *)details ;

***REMOVED***

@interface BVTCategoryTableViewController : UIViewController

@property (nonatomic, copy) NSString *categoryTitle;
@property (nonatomic, strong) NSMutableArray *cachedDetails;

@property(nonatomic, weak)id <BVTCategoryTableViewControllerDelegate> delegate;

***REMOVED***
