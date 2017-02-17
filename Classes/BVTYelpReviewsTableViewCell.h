***REMOVED***
***REMOVED***  BVTYelpReviewsTableViewCell.h
***REMOVED***  bvt
***REMOVED***
***REMOVED***  Created by Greg on 2/16/17.
***REMOVED***  Copyright © 2017 gms. All rights reserved.
***REMOVED***

#import <UIKit/UIKit.h>

#import "YLPBusiness.h"

@interface BVTYelpReviewsTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *reviewLabel;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;
@property (nonatomic, weak) IBOutlet UIImageView *ratingView;
@property (nonatomic, weak) IBOutlet UIImageView *userImageView;

@property (nonatomic, strong) YLPBusiness *business;

***REMOVED***
