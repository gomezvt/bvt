***REMOVED***
***REMOVED***  BVTAboutTableViewCell.m
***REMOVED***  bvt
***REMOVED***
***REMOVED***  Created by Greg on 6/1/17.
***REMOVED***  Copyright © 2017 gms. All rights reserved.
***REMOVED***

#import "BVTAboutTableViewCell.h"

@implementation BVTAboutTableViewCell

- (void)awakeFromNib ***REMOVED***
    [super awakeFromNib];
    ***REMOVED*** Initialization code
***REMOVED***

- (IBAction)didTapYelpButton:(id)sender
***REMOVED***
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http:***REMOVED***yelp.com"]  options:@***REMOVED******REMOVED*** completionHandler:^(BOOL success) ***REMOVED***
        NSLog(@"");
    ***REMOVED***];
***REMOVED***

- (IBAction)didTapFBButton:(id)sender
***REMOVED***
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http:***REMOVED***www.facebook.com/theburlingtonian"]  options:@***REMOVED******REMOVED*** completionHandler:^(BOOL success) ***REMOVED***
        NSLog(@"");
    ***REMOVED***];
***REMOVED***

- (void)setSelected:(BOOL)selected animated:(BOOL)animated ***REMOVED***
    [super setSelected:selected animated:animated];

    ***REMOVED*** Configure the view for the selected state
***REMOVED***

***REMOVED***
