***REMOVED***
***REMOVED***  BVTSurpriseShoppingCartTableViewController.h
***REMOVED***  bvt
***REMOVED***
***REMOVED***  Created by Greg on 2/23/17.
***REMOVED***  Copyright © 2017 gms. All rights reserved.
***REMOVED***

#import <UIKit/UIKit.h>

@protocol BVTSurpriseShoppingCartTableViewControllerDelegate <NSObject>

- (void)didTapBackWithSubCategories:(NSMutableArray *)array withCategories:(NSMutableDictionary *)categories;

***REMOVED***

@interface BVTSurpriseShoppingCartTableViewController : UIViewController

@property (nonatomic, strong) NSMutableDictionary *selectedCategories;
@property (nonatomic, strong) NSMutableArray *subCats;
@property(nonatomic, weak)id <BVTSurpriseShoppingCartTableViewControllerDelegate> delegate;

***REMOVED***
