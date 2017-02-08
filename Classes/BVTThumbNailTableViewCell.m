***REMOVED***
***REMOVED***  BVTThumbNailTableViewCell.m
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/20/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import "BVTThumbNailTableViewCell.h"

#import "YLPLocation.h"

NSString *const star_zero_mini          = @"star_zero_mini.png";
NSString *const star_one_mini           = @"star_one_mini.png";
NSString *const star_one_half_mini      = @"star_one_half_mini.png";
NSString *const star_two_mini           = @"star_two_mini.png";
NSString *const star_two_half_mini      = @"star_two_half_mini.png";
NSString *const star_three_mini         = @"star_three_mini.png";
NSString *const star_three_half_mini    = @"star_three_half_mini.png";
NSString *const star_four_mini          = @"star_four_mini.png";
NSString *const star_four_half_mini     = @"star_four_half_mini.png";
NSString *const star_five_mini          = @"star_five_mini.png";

@interface BVTThumbNailTableViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *ratingStarsView;

***REMOVED***

@implementation BVTThumbNailTableViewCell

- (void)awakeFromNib
***REMOVED***
    [super awakeFromNib];
    ***REMOVED*** Initialization code
***REMOVED***

- (void)setBusiness:(YLPBusiness *)business
***REMOVED***
    _business = business;
    
    YLPLocation *location = business.location;
    self.titleLabel.text = business.name;
    
    if (location.address.count > 0)
    ***REMOVED***
        self.addressLabel.text = location.address[0];
        self.addressLabel2.text = [NSString stringWithFormat:@"%@, %@ %@", location.city, location.stateCode, location.postalCode];
    ***REMOVED***
    else
    ***REMOVED***
        self.addressLabel.text = [NSString stringWithFormat:@"%@, %@ %@", location.city, location.stateCode, location.postalCode];
        [self.addressLabel2 removeFromSuperview];
    ***REMOVED***
    
    NSString *ratingString;
    if (self.business.rating == 0)
    ***REMOVED***
        ratingString = star_zero_mini;
    ***REMOVED***
    else if (self.business.rating == 1)
    ***REMOVED***
        ratingString = star_one_mini;
    ***REMOVED***
    else if (self.business.rating == 1.5)
    ***REMOVED***
        ratingString = star_one_half_mini;
    ***REMOVED***
    else if (self.business.rating == 2)
    ***REMOVED***
        ratingString = star_two_mini;
    ***REMOVED***
    else if (self.business.rating == 2.5)
    ***REMOVED***
        ratingString = star_two_half_mini;
    ***REMOVED***
    else if (self.business.rating == 3)
    ***REMOVED***
        ratingString = star_three_mini;
    ***REMOVED***
    else if (self.business.rating == 3.5)
    ***REMOVED***
        ratingString = star_three_half_mini;
    ***REMOVED***
    else if (self.business.rating == 4)
    ***REMOVED***
        ratingString = star_four_mini;
    ***REMOVED***
    else if (self.business.rating == 4.5)
    ***REMOVED***
        ratingString = star_four_half_mini;
    ***REMOVED***
    else
    ***REMOVED***
        ***REMOVED*** 5 star rating
        ratingString = star_five_mini;
    ***REMOVED***
    
    [self.ratingStarsView setImage:[UIImage imageNamed:ratingString]];
***REMOVED***

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
***REMOVED***
    [super setSelected:selected animated:animated];

    ***REMOVED*** Configure the view for the selected state
***REMOVED***

***REMOVED***
