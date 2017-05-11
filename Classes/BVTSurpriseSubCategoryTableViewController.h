***REMOVED***
***REMOVED***  BVTSurpriseCategoryTableViewController.h
***REMOVED***  bvt
***REMOVED***
***REMOVED***  Created by Greg on 2/23/17.
***REMOVED***  Copyright © 2017 gms. All rights reserved.
***REMOVED***

#import <UIKit/UIKit.h>

@protocol BVTSurpriseSubCategoryTableViewControllerDelegate <NSObject>

- (void)didTapBackWithCategories:(NSMutableDictionary *)categories;
- (void)didTapBackWithDetails:(NSMutableArray *)details ;

***REMOVED***

@interface BVTSurpriseSubCategoryTableViewController : UIViewController

@property (nonatomic, copy) NSString *categoryTitle;
@property (nonatomic, strong) NSMutableDictionary *catDict;
@property (nonatomic, strong) NSMutableArray *cachedDetails;
@property(nonatomic, weak)id <BVTSurpriseSubCategoryTableViewControllerDelegate> delegate;

***REMOVED***
