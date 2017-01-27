***REMOVED***
***REMOVED***  BVTThumbNailTableViewCell.m
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/20/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import "BVTThumbNailTableViewCell.h"

#import "YLPLocation.h"

@implementation BVTThumbNailTableViewCell

- (void)awakeFromNib
***REMOVED***
    [super awakeFromNib];
    ***REMOVED*** Initialization code
***REMOVED***

- (void)setBusiness:(YLPBusiness *)business
***REMOVED***
    _business = business;
    
    NSData *imageData = [NSData dataWithContentsOfURL:business.imageURL];
    UIImage *image = [UIImage imageWithData:imageData];
    
    self.thumbNailView.image = image;
    self.titleLabel.text = business.name;
    
    YLPLocation *location = business.location;
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
***REMOVED***

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
***REMOVED***
    [super setSelected:selected animated:animated];

    ***REMOVED*** Configure the view for the selected state
***REMOVED***

***REMOVED***
