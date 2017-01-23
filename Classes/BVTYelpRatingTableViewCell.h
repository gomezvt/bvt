//
//  BVTYelpRatingTableViewCell.h
//  burlingtonian
//
//  Created by Greg on 12/27/16.
//  Copyright © 2016 gomez. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YLPBusiness.h"

@interface BVTYelpRatingTableViewCell : UITableViewCell

extern NSString *const star_zero;
extern NSString *const star_one;
extern NSString *const star_one_half;
extern NSString *const star_two;
extern NSString *const star_two_half;
extern NSString *const star_three;
extern NSString *const star_three_half;
extern NSString *const star_four;
extern NSString *const star_four_half;
extern NSString *const star_five;

@property (nonatomic, weak) IBOutlet UILabel *yelpPriceLabel;
@property (nonatomic, weak) IBOutlet UILabel *yelpCategoryLabel;
@property (nonatomic, weak) IBOutlet UILabel *reviewsCountLabel;
@property (nonatomic, weak) IBOutlet UIImageView *ratingStarsView;
//@property (nonatomic, strong) NSDictionary *businessDetail;
@property (nonatomic, strong) YLPBusiness *selectedBusiness;

@end
