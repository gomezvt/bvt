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

@protocol BVTSubCategoryTableViewControllerDelegate <NSObject>

- (void)didTapBackWithDetails:(NSMutableDictionary *)details ;

***REMOVED***

@interface BVTSubCategoryTableViewController : UIViewController 

@property (nonatomic, copy) NSString *subCategoryTitle;
@property (nonatomic, strong) NSArray *filteredResults;
@property (nonatomic, strong) NSMutableDictionary *cachedDetails;
@property(nonatomic, weak)id <BVTSubCategoryTableViewControllerDelegate> delegate;

***REMOVED***
