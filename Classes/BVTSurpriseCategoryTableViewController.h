***REMOVED***
***REMOVED***  BVTSurpriseCategoryTableViewController.h
***REMOVED***  bvt
***REMOVED***
***REMOVED***  Created by Greg on 2/23/17.
***REMOVED***  Copyright © 2017 gms. All rights reserved.
***REMOVED***

#import <UIKit/UIKit.h>

@protocol BVTSurpriseCategoryTableViewControllerDelegate <NSObject>

- (void)didTapBackChevron:(id)sender withCategories:(NSMutableArray *)categories;

***REMOVED***

@interface BVTSurpriseCategoryTableViewController : UIViewController

@property (nonatomic, copy) NSString *categoryTitle;
@property (nonatomic, strong) NSMutableArray *selectedCategories;
@property(nonatomic, weak)id <BVTSurpriseCategoryTableViewControllerDelegate> delegate;

***REMOVED***
