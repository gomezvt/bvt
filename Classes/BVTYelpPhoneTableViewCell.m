***REMOVED***
***REMOVED***  BVTYelpContactTableViewCell.m
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/23/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import "BVTYelpPhoneTableViewCell.h"

@interface BVTYelpPhoneTableViewCell ()

@property (nonatomic, weak) IBOutlet UIButton *phoneNumberButton;
@property (nonatomic, weak) IBOutlet UIImageView *PhoneImageView;

***REMOVED***

@implementation BVTYelpPhoneTableViewCell

- (void)awakeFromNib ***REMOVED***
    [super awakeFromNib];
    ***REMOVED*** Initialization code
***REMOVED***

- (void)setSelectedBusiness:(YLPBusiness *)selectedBusiness
***REMOVED***
    _selectedBusiness = selectedBusiness;
    
    [self.phoneNumberButton setTitle:selectedBusiness.phone forState:UIControlStateNormal];
***REMOVED***

- (IBAction)didTapPhoneNumberButton:(id)sender
***REMOVED***
    NSString *phoneNumber;
    if ([self.selectedBusiness.phone hasPrefix:@"+"])
    ***REMOVED***
        phoneNumber = [self.selectedBusiness.phone substringFromIndex:1];
    ***REMOVED***
    else
    ***REMOVED***
        phoneNumber = self.selectedBusiness.phone;
    ***REMOVED***
    
    NSString *phoneString = [NSString stringWithFormat:@"telprompt:%@", phoneNumber];
    NSURL *phoneURL = [NSURL URLWithString:phoneString];
    
    [[UIApplication sharedApplication] openURL:phoneURL options:@***REMOVED******REMOVED*** completionHandler:^(BOOL success) ***REMOVED***
        NSLog(@"");
    ***REMOVED***];
***REMOVED***

- (void)setSelected:(BOOL)selected animated:(BOOL)animated ***REMOVED***
    [super setSelected:selected animated:animated];

    ***REMOVED*** Configure the view for the selected state
***REMOVED***

***REMOVED***
