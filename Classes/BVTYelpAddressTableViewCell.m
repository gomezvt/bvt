***REMOVED***
***REMOVED***  BVTYelpAddressTableViewCell.m
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/30/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import "BVTYelpAddressTableViewCell.h"

#import "YLPLocation.h"
#import "YLPCoordinate.h"

@interface BVTYelpAddressTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *addressLabel;

***REMOVED***

@implementation BVTYelpAddressTableViewCell

- (void)setSelectedBusiness:(YLPBusiness *)selectedBusiness
***REMOVED***
    _selectedBusiness = selectedBusiness;
    
    YLPLocation *location = self.selectedBusiness.location;
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

    self.mapsQueryString = [NSString stringWithFormat:@"http:***REMOVED***maps.apple.com/?q=%@&s11=%f,%f&z=10&t=s", self.selectedBusiness.name, location.coordinate.latitude, location.coordinate.longitude];
***REMOVED***

- (void)setSelected:(BOOL)selected animated:(BOOL)animated ***REMOVED***
    [super setSelected:selected animated:animated];

    ***REMOVED*** Configure the view for the selected state
***REMOVED***

***REMOVED***
