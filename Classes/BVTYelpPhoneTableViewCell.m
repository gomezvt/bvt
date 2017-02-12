***REMOVED***
***REMOVED***  BVTYelpContactTableViewCell.m
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/23/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import "BVTYelpPhoneTableViewCell.h"

@interface BVTYelpPhoneTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *phoneNumberLabel;

***REMOVED***

@implementation BVTYelpPhoneTableViewCell

- (void)awakeFromNib ***REMOVED***
    [super awakeFromNib];
    ***REMOVED*** Initialization code
***REMOVED***

- (void)setSelectedBusiness:(YLPBusiness *)selectedBusiness
***REMOVED***
    _selectedBusiness = selectedBusiness;
    
    NSString *phone = [self formattedPhoneString];

    self.phoneNumberLabel.text = phone;
***REMOVED***

- (NSString *)formattedPhoneString
***REMOVED***
    NSString *phone = self.selectedBusiness.phone;
    if ([phone hasPrefix:@"+1"] && ![phone containsString:@"-"] && phone.length == 12)
    ***REMOVED***
        NSMutableString *mutablePhone = [[NSMutableString alloc] initWithString:phone];
        [mutablePhone insertString:@" (" atIndex:2];
        [mutablePhone insertString:@") " atIndex:7];
        [mutablePhone insertString:@"-" atIndex:12];
        
        phone = mutablePhone;
    ***REMOVED***
    
    return phone;
***REMOVED***

- (IBAction)didTapPhoneNumberButton:(id)sender
***REMOVED***
    NSString *phoneString = [NSString stringWithFormat:@"telprompt:%@", self.selectedBusiness.phone];
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
