***REMOVED***
***REMOVED***  BVTYelpRatingTableViewCell.m
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/27/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import "BVTYelpRatingTableViewCell.h"

#import "BVTStyles.h"



@implementation BVTYelpRatingTableViewCell

- (void)awakeFromNib
***REMOVED***
    [super awakeFromNib];
    ***REMOVED*** Initialization code
***REMOVED***

- (void)setSelectedBusiness:(YLPBusiness *)selectedBusiness
***REMOVED***
    _selectedBusiness = selectedBusiness;
    
    self.reviewsCountLabel.text = [NSString stringWithFormat:@"Based on (%ld) reviews", (unsigned long)self.selectedBusiness.reviewCount];
    
    self.yelpPriceLabel.text = self.selectedBusiness.price;
    
    NSString *ratingString;
    if (self.selectedBusiness.rating == 0)
    ***REMOVED***
        ratingString = star_zero;
    ***REMOVED***
    else if (self.selectedBusiness.rating == 1)
    ***REMOVED***
        ratingString = star_one;
    ***REMOVED***
    else if (self.selectedBusiness.rating == 1.5)
    ***REMOVED***
        ratingString = star_one_half;
    ***REMOVED***
    else if (self.selectedBusiness.rating == 2)
    ***REMOVED***
        ratingString = star_two;
    ***REMOVED***
    else if (self.selectedBusiness.rating == 2.5)
    ***REMOVED***
        ratingString = star_two_half;
    ***REMOVED***
    else if (self.selectedBusiness.rating == 3)
    ***REMOVED***
        ratingString = star_three;
    ***REMOVED***
    else if (self.selectedBusiness.rating == 3.5)
    ***REMOVED***
        ratingString = star_three_half;
    ***REMOVED***
    else if (self.selectedBusiness.rating == 4)
    ***REMOVED***
        ratingString = star_four;
    ***REMOVED***
    else if (self.selectedBusiness.rating == 4.5)
    ***REMOVED***
        ratingString = star_four_half;
    ***REMOVED***
    else
    ***REMOVED***
        ***REMOVED*** 5 star rating
        ratingString = star_five;
    ***REMOVED***
    
    [self.ratingStarsView setImage:[UIImage imageNamed:ratingString]];
***REMOVED***

- (void)setSelected:(BOOL)selected animated:(BOOL)animated ***REMOVED***
    [super setSelected:selected animated:animated];

    ***REMOVED*** Configure the view for the selected state
***REMOVED***

***REMOVED***
