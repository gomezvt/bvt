***REMOVED***
***REMOVED***  BVTSurpriseRecommendationsTableViewController.h
***REMOVED***  bvt
***REMOVED***
***REMOVED***  Created by Greg on 4/8/17.
***REMOVED***  Copyright © 2017 gms. All rights reserved.
***REMOVED***

#import <UIKit/UIKit.h>

@protocol BVTSurpriseRecommendationsTableViewControllerDelegate <NSObject>

- (void)didTapBackWithDetails:(NSMutableArray *)details ;

***REMOVED***

@interface BVTSurpriseRecommendationsTableViewController : UIViewController

@property (nonatomic, strong) NSMutableDictionary *businessOptions;
@property(nonatomic, weak)id <BVTSurpriseRecommendationsTableViewControllerDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *cachedDetails;

***REMOVED***
