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
@property (nonatomic, weak) IBOutlet UILabel *addressLabel2;
@property (nonatomic, weak) IBOutlet UILabel *addressLabel3;

***REMOVED***

@implementation BVTYelpAddressTableViewCell

- (void)setSelectedBusiness:(YLPBusiness *)selectedBusiness
***REMOVED***
    _selectedBusiness = selectedBusiness;
    
    NSMutableString *cityStateZipString = [[NSMutableString alloc] init];
    if (self.selectedBusiness.location.city)
    ***REMOVED***
        NSString *cityString = self.selectedBusiness.location.city;
        [cityStateZipString appendString:cityString];
    ***REMOVED***
    
    if (self.selectedBusiness.location.stateCode)
    ***REMOVED***
        NSString *stateString = [NSString stringWithFormat:@", %@", self.selectedBusiness.location.stateCode];
        [cityStateZipString appendString:stateString];
    ***REMOVED***
    
    if (self.selectedBusiness.location.postalCode)
    ***REMOVED***
        NSString *postalString = [NSString stringWithFormat:@" %@", self.selectedBusiness.location.postalCode];
        [cityStateZipString appendString:postalString];
    ***REMOVED***
    
    if (self.selectedBusiness.location.address.count == 1)
    ***REMOVED***
        NSString *addressString = self.selectedBusiness.location.address[0];
        self.addressLabel.text = addressString;
        self.addressLabel2.text = cityStateZipString;
        [self.addressLabel3 removeFromSuperview];
    ***REMOVED***
    else if (self.selectedBusiness.location.address.count == 2)
    ***REMOVED***
        NSString *addressString = self.selectedBusiness.location.address[0];
        NSString *addressString1 = self.selectedBusiness.location.address[1];

        self.addressLabel.text = addressString;
        self.addressLabel2.text = addressString1;
        self.addressLabel3.text = cityStateZipString;
    ***REMOVED***
    else
    ***REMOVED***
        self.textLabel.text = cityStateZipString;
        
        [self.addressLabel removeFromSuperview];
        [self.addressLabel2 removeFromSuperview];
        [self.addressLabel3 removeFromSuperview];
    ***REMOVED***
    
    self.mapsQueryString = [NSString stringWithFormat:@"http:***REMOVED***maps.apple.com/?q=%@&s11=%f,%f&z=10&t=s", self.selectedBusiness.name, self.selectedBusiness.location.coordinate.latitude, self.selectedBusiness.location.coordinate.longitude];
***REMOVED***

- (void)setSelected:(BOOL)selected animated:(BOOL)animated ***REMOVED***
    [super setSelected:selected animated:animated];

    ***REMOVED*** Configure the view for the selected state
***REMOVED***

***REMOVED***
