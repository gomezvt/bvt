***REMOVED***
***REMOVED***  BVTYelpContactTableViewCell.m
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/23/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import "BVTYelpContactTableViewCell.h"

@interface BVTYelpContactTableViewCell ()

@property (nonatomic, weak) IBOutlet UIView *backView;
@property (nonatomic, weak) IBOutlet UILabel *phoneNumberLabel;

***REMOVED***

@implementation BVTYelpContactTableViewCell

- (void)awakeFromNib ***REMOVED***
    
    self.backView.layer.cornerRadius = 15.f;
    
    [super awakeFromNib];
    ***REMOVED*** Initialization code
***REMOVED***

- (void)setSelectedBusiness:(YLPBusiness *)selectedBusiness
***REMOVED***
    _selectedBusiness = selectedBusiness;
    
    self.phoneNumberLabel.text = self.selectedBusiness.phone;
***REMOVED***

- (void)setSelected:(BOOL)selected animated:(BOOL)animated ***REMOVED***
    [super setSelected:selected animated:animated];

    ***REMOVED*** Configure the view for the selected state
***REMOVED***

***REMOVED***
