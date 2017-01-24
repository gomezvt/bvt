***REMOVED***
***REMOVED***  BVTYelpAddressTableViewCell.m
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/30/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import "BVTYelpAddressTableViewCell.h"

#import "YLPLocation.h"

@interface BVTYelpAddressTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *addressLabel;
@property (nonatomic, weak) IBOutlet UILabel *addressLabel2;

***REMOVED***

@implementation BVTYelpAddressTableViewCell

- (void)setSelectedBusiness:(YLPBusiness *)selectedBusiness
***REMOVED***
    _selectedBusiness = selectedBusiness;
    
    YLPLocation *location = self.selectedBusiness.location;
    if (location.address.count > 0)
    ***REMOVED***
        self.addressLabel.text = location.address[0];
        self.addressLabel2.text = [NSString stringWithFormat:@"%@, %@ %@", location.city, location.stateCode, location.postalCode];
    ***REMOVED***
    else
    ***REMOVED***
        self.addressLabel.text = nil;
        self.addressLabel2.text = nil;

        self.textLabel.text = [NSString stringWithFormat:@"%@, %@ %@", location.city, location.stateCode, location.postalCode];
        
    ***REMOVED***
***REMOVED***

- (void)setSelected:(BOOL)selected animated:(BOOL)animated ***REMOVED***
    [super setSelected:selected animated:animated];

    ***REMOVED*** Configure the view for the selected state
***REMOVED***

***REMOVED***
