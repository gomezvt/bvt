***REMOVED***
***REMOVED***  BVTSubCategoryTableViewController.h
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/20/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import <UIKit/UIKit.h>

***REMOVED***#import <CoreLocation/CoreLocation.h>

***REMOVED***@class CLLocationManager;

@class YLPSearch;

***REMOVED***@protocol BVTSubCategoryTableViewControllerDelegate <NSObject>
***REMOVED***
***REMOVED***- (void)didTapBackWithDetails:(NSMutableArray *)details ;
***REMOVED***
***REMOVED******REMOVED***

@interface BVTSubCategoryTableViewController : UIViewController 

@property (nonatomic, copy) NSString *subCategoryTitle;
@property (nonatomic, strong) NSArray *filteredResults;
***REMOVED***@property (nonatomic, strong) NSMutableArray *cachedDetails;
***REMOVED***@property(nonatomic, weak)id <BVTSubCategoryTableViewControllerDelegate> delegate;

***REMOVED***
