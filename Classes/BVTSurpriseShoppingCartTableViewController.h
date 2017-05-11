***REMOVED***
***REMOVED***  BVTSurpriseShoppingCartTableViewController.h
***REMOVED***  bvt
***REMOVED***
***REMOVED***  Created by Greg on 2/23/17.
***REMOVED***  Copyright © 2017 gms. All rights reserved.
***REMOVED***

#import <UIKit/UIKit.h>

@protocol BVTSurpriseShoppingCartTableViewControllerDelegate <NSObject>

- (void)didTapBackWithCategories:(NSMutableDictionary *)categories ;
- (void)didClearShoppingCart;
- (void)didTapBackWithDetails:(NSMutableArray *)details ;

***REMOVED***

@interface BVTSurpriseShoppingCartTableViewController : UIViewController

@property (nonatomic, strong) NSMutableDictionary *catDict;
@property(nonatomic, weak)id <BVTSurpriseShoppingCartTableViewControllerDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *cachedDetails;

***REMOVED***
