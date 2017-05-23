***REMOVED***
***REMOVED***  BVTThumbNailTableViewCell.m
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/20/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import "BVTThumbNailTableViewCell.h"

#import "YLPLocation.h"
***REMOVED***
#import "BVTStyles.h"
#import "YLPLocation.h"
#import "YLPCoordinate.h"

@interface BVTThumbNailTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *addressLabel;
@property (nonatomic, weak) IBOutlet UILabel *milesLabel;
@property (nonatomic, weak) IBOutlet UILabel *priceLabel;
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
    
    AppDelegate *appDel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if (!appDel.userLocation)
    ***REMOVED***
        self.milesLabel.hidden = YES;
    ***REMOVED***
    else
    ***REMOVED***
        self.milesLabel.hidden = NO;
        CLLocation *bizLocation = [[CLLocation alloc] initWithLatitude:business.location.coordinate.latitude longitude:business.location.coordinate.longitude];
        CLLocationDistance meters = [appDel.userLocation distanceFromLocation:bizLocation];
        
        double miles = meters / 1609.34;
        business.miles = miles;
        
        NSString *milesStr = [NSString stringWithFormat:@"%.2f mi.", self.business.miles];
        self.milesLabel.text = milesStr;
    ***REMOVED***


    self.priceLabel.text = business.price;
    
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
    ***REMOVED***
    else if (location.address.count == 1)
    ***REMOVED***
        self.addressLabel.text = [NSString stringWithFormat:@"%@\n%@", location.address[0], cityStateZipString];
    ***REMOVED***
    else if (location.address.count == 2)
    ***REMOVED***
        self.addressLabel.text = [NSString stringWithFormat:@"%@\n%@\n%@", location.address[0], location.address[1], cityStateZipString];
    ***REMOVED***
    else if (location.address.count == 3)
    ***REMOVED***
        self.addressLabel.text = [NSString stringWithFormat:@"%@\n%@, %@\n%@", location.address[0], location.address[1], location.address[2], cityStateZipString];
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

- (void)prepareForReuse
***REMOVED***
    self.openCloseLabel.text = @"";
    self.secondaryOpenCloseLabel.text = @"";
***REMOVED***

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
***REMOVED***
    [super setSelected:selected animated:animated];

    ***REMOVED*** Configure the view for the selected state
***REMOVED***

***REMOVED***
