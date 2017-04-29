***REMOVED***
***REMOVED***  BVTSurpriseRecommendationsTableViewCell.m
***REMOVED***  bvt
***REMOVED***
***REMOVED***  Created by Greg on 4/29/17.
***REMOVED***  Copyright © 2017 gms. All rights reserved.
***REMOVED***

#import "BVTSurpriseRecommendationsTableViewCell.h"
#import "YLPLocation.h"

#import "BVTStyles.h"

@interface BVTSurpriseRecommendationsTableViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *ratingStarsView;
@property (nonatomic, weak) IBOutlet UILabel *priceLabel;

***REMOVED***

@implementation BVTSurpriseRecommendationsTableViewCell

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
    NSMutableString *cityStateZipString = [[NSMutableString alloc] init];
    if (location.city)
    ***REMOVED***
        NSString *cityString = location.city;
        [cityStateZipString appendString:cityString];
    ***REMOVED***
    
    if (location.stateCode)
    ***REMOVED***
        NSString *stateString = [NSString stringWithFormat:@", %@", location.stateCode];
        [cityStateZipString appendString:stateString];
    ***REMOVED***
    
    if (location.postalCode)
    ***REMOVED***
        NSString *postalString = [NSString stringWithFormat:@" %@", location.postalCode];
        [cityStateZipString appendString:postalString];
    ***REMOVED***
    
    if (location.address.count == 0)
    ***REMOVED***
        self.addressLabel.text = cityStateZipString;
        
        [self.addressLabel2 removeFromSuperview];
        [self.addressLabel3 removeFromSuperview];
    ***REMOVED***
    else if (location.address.count == 1)
    ***REMOVED***
        self.addressLabel.text = location.address[0];
        self.addressLabel2.text = cityStateZipString;
        [self.addressLabel3 removeFromSuperview];
    ***REMOVED***
    else if (location.address.count == 2)
    ***REMOVED***
        self.addressLabel.text = location.address[0];
        self.addressLabel2.text = location.address[1];
        self.addressLabel3.text = cityStateZipString;
    ***REMOVED***
    else if (location.address.count == 3)
    ***REMOVED***
        self.addressLabel.text = location.address[0];
        self.addressLabel2.text = [NSString stringWithFormat:@"%@, %@", location.address[1], location.address[2]];
        self.addressLabel3.text = cityStateZipString;
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
    
    self.priceLabel.text = business.price;
***REMOVED***

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
***REMOVED***
    [super setSelected:selected animated:animated];
    
    ***REMOVED*** Configure the view for the selected state
***REMOVED***

***REMOVED***
