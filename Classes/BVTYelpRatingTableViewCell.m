***REMOVED***
***REMOVED***  BVTYelpRatingTableViewCell.m
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/27/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import "BVTYelpRatingTableViewCell.h"

#import "YLPCategory.h"

NSString *const star_zero       = @"star_zero.png";
NSString *const star_one        = @"star_one.png";
NSString *const star_one_half   = @"star_one_half.png";
NSString *const star_two        = @"star_two.png";
NSString *const star_two_half   = @"star_two_half.png";
NSString *const star_three      = @"star_three.png";
NSString *const star_three_half = @"star_three_half.png";
NSString *const star_four       = @"star_four.png";
NSString *const star_four_half  = @"star_four_half.png";
NSString *const star_five       = @"star_five.png";

@implementation BVTYelpRatingTableViewCell

- (void)awakeFromNib
***REMOVED***
    [super awakeFromNib];
    ***REMOVED*** Initialization code
***REMOVED***

- (void)setSelectedBusiness:(YLPBusiness *)selectedBusiness
***REMOVED***
    _selectedBusiness = selectedBusiness;
    
    self.reviewsCountLabel.text = [NSString stringWithFormat:@"%ld Review(s) in Yelp", self.selectedBusiness.reviewCount];
    
    self.yelpPriceLabel.text = self.selectedBusiness.price;
    
    YLPCategory *categoryOne;
    YLPCategory *categoryTwo;
    YLPCategory *categoryThree;
    
    NSString *catString;
    NSArray *categories = self.selectedBusiness.categories;
    
    if (self.selectedBusiness.categories.count == 1)
    ***REMOVED***
        categoryOne = categories[0];
        catString = categoryOne.name;
    ***REMOVED***
    else if (self.selectedBusiness.categories.count == 2)
    ***REMOVED***
        categoryOne = categories[0];
        categoryTwo = categories[1];
        
        catString = [NSString stringWithFormat:@"%@, %@", categoryOne.name, categoryTwo.name];
    ***REMOVED***
    else if (self.selectedBusiness.categories.count == 3)
    ***REMOVED***
        categoryOne = categories[0];
        categoryTwo = categories[1];
        categoryThree = categories[2];
        
        catString = [NSString stringWithFormat:@"%@, %@, %@", categoryOne.name, categoryTwo.name, categoryThree.name];
    ***REMOVED***
    
    self.yelpCategoryLabel.text = catString;
    
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
