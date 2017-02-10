***REMOVED***
***REMOVED***  BVTYelpHoursTableViewCell.m
***REMOVED***  bvt
***REMOVED***
***REMOVED***  Created by Greg on 2/6/17.
***REMOVED***  Copyright © 2017 gms. All rights reserved.
***REMOVED***

#import "BVTYelpHoursTableViewCell.h"

#import "BVTStyles.h"

@implementation BVTYelpHoursTableViewCell

- (void)awakeFromNib ***REMOVED***
    [super awakeFromNib];
    ***REMOVED*** Initialization code
***REMOVED***

- (void)setSelected:(BOOL)selected animated:(BOOL)animated ***REMOVED***
    [super setSelected:selected animated:animated];

    ***REMOVED*** Configure the view for the selected state
***REMOVED***

- (void)setSelectedBusiness:(YLPBusiness *)selectedBusiness
***REMOVED***
    _selectedBusiness = selectedBusiness;
    
    self.isOpenLabel.text = self.selectedBusiness.isOpenNow ? @"Open Now" : @"Closed Now";
    self.isOpenLabel.textColor = [UIColor redColor];
    if ([self.isOpenLabel.text isEqualToString:@"Open Now"])
    ***REMOVED***
        self.isOpenLabel.textColor = [BVTStyles moneyGreen];
    ***REMOVED***
    
***REMOVED***

***REMOVED***
