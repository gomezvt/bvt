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
    
    YLPCategory *categoryOne;
    YLPCategory *categoryTwo;
    YLPCategory *categoryThree;
    
    NSString *catString;
    NSArray *categories = self.selectedBusiness.categories;
    
    if (self.selectedBusiness.categories.count == 1)
    ***REMOVED***
        categoryOne = categories[0];
        catString = [NSString stringWithFormat:@"Place category: %@", categoryOne.name];
    ***REMOVED***
    else if (self.selectedBusiness.categories.count == 2)
    ***REMOVED***
        categoryOne = categories[0];
        categoryTwo = categories[1];
        
        catString = [NSString stringWithFormat:@"Place categories: %@, %@", categoryOne.name, categoryTwo.name];
    ***REMOVED***
    else if (self.selectedBusiness.categories.count == 3)
    ***REMOVED***
        categoryOne = categories[0];
        categoryTwo = categories[1];
        categoryThree = categories[2];
        
        catString = [NSString stringWithFormat:@"Place categories: %@, %@, %@", categoryOne.name, categoryTwo.name, categoryThree.name];
    ***REMOVED***
    
    self.categoryLabel.text = catString;
***REMOVED***
***REMOVED***
