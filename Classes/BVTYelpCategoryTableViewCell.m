***REMOVED***
***REMOVED***  BVTYelpCategoryTableViewCell.m
***REMOVED***  bvt
***REMOVED***
***REMOVED***  Created by Greg on 2/6/17.
***REMOVED***  Copyright © 2017 gms. All rights reserved.
***REMOVED***

#import "BVTYelpCategoryTableViewCell.h"

#import "YLPCategory.h"


@implementation BVTYelpCategoryTableViewCell

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
    
    NSMutableString *catString = [[NSMutableString alloc] initWithString:@"Place categories: "];
    for (YLPCategory *category in self.selectedBusiness.categories)
    ***REMOVED***
        [catString appendString:[NSString stringWithFormat:@"%@, ", category.name]];
    ***REMOVED***
    
    self.categoryLabel.text = [catString substringToIndex:[catString length] -2];
***REMOVED***
***REMOVED***
