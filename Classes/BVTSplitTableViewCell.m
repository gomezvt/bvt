***REMOVED***
***REMOVED***  BVTSplitTableViewCell.m
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/21/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import "BVTSplitTableViewCell.h"

@implementation BVTSplitTableViewCell

- (void)awakeFromNib
***REMOVED***
    [super awakeFromNib];
    ***REMOVED*** Initialization code
***REMOVED***

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
***REMOVED***
    [super setSelected:selected animated:animated];

    ***REMOVED*** Configure the view for the selected state
***REMOVED***

***REMOVED***- (void)setSelectedBusiness:(YLPBusiness *)selectedBusiness
***REMOVED******REMOVED***
***REMOVED***    _selectedBusiness = selectedBusiness;
***REMOVED***    
***REMOVED***    if (self.selectedBusiness.imageURL)
***REMOVED***    ***REMOVED***
***REMOVED***        
***REMOVED***    ***REMOVED***
***REMOVED***    
***REMOVED***    if (self.selectedBusiness.photos.count > 0)
***REMOVED***    ***REMOVED***
***REMOVED***        
***REMOVED***    ***REMOVED***
***REMOVED***    else if (self.selectedBusiness.imageURL)
***REMOVED***    ***REMOVED***
***REMOVED***        
***REMOVED***    ***REMOVED***
***REMOVED***    else
***REMOVED***    ***REMOVED***
***REMOVED***        
***REMOVED***    ***REMOVED***
***REMOVED******REMOVED***

***REMOVED***
