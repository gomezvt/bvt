***REMOVED***
***REMOVED***  BVTCategoryTableViewController.h
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/20/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import <UIKit/UIKit.h>

***REMOVED***@protocol BVTCategoryTableViewControllerDelegate <NSObject>
***REMOVED***
***REMOVED***- (void)didTapBackWithDetails:(NSMutableArray *)details ;
***REMOVED***
***REMOVED******REMOVED***

@interface BVTCategoryTableViewController : UIViewController

@property (nonatomic, copy) NSString *categoryTitle;
***REMOVED***@property (nonatomic, strong) NSMutableArray *cachedDetails;

***REMOVED***@property(nonatomic, weak)id <BVTCategoryTableViewControllerDelegate> delegate;

***REMOVED***
