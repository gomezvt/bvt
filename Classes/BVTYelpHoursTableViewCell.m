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
    
    self.openClosesLabel.text = @"";
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
    
    NSDateFormatter *dateFormatter;
    if (!dateFormatter)
    ***REMOVED***
        dateFormatter = [[NSDateFormatter alloc] init];
    ***REMOVED***
    
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"EDT"]];
    [dateFormatter setDateFormat:@"EEEE"];
    
    NSString *dayName = [dateFormatter stringFromDate:[NSDate date]];
    NSNumber *dayNum = [NSNumber numberWithInteger:0];
    if ([dayName isEqualToString:@"Tuesday"])
    ***REMOVED***
        dayNum = [NSNumber numberWithInteger:1];
    ***REMOVED***
    else if ([dayName isEqualToString:@"Wednesday"])
    ***REMOVED***
        dayNum = [NSNumber numberWithInteger:2];
    ***REMOVED***
    else if ([dayName isEqualToString:@"Thursday"])
    ***REMOVED***
        dayNum = [NSNumber numberWithInteger:3];
    ***REMOVED***
    else if ([dayName isEqualToString:@"Friday"])
    ***REMOVED***
        dayNum = [NSNumber numberWithInteger:4];
    ***REMOVED***
    else if ([dayName isEqualToString:@"Saturday"])
    ***REMOVED***
        dayNum = [NSNumber numberWithInteger:5];
    ***REMOVED***
    else if ([dayName isEqualToString:@"Sunday"])
    ***REMOVED***
        dayNum = [NSNumber numberWithInteger:6];
    ***REMOVED***
    
    NSDictionary *todayDict = [[selectedBusiness.businessHours filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"day == %@", dayNum]] lastObject];

    if (todayDict)
    ***REMOVED***
        NSString *timeStr;
        NSString *openCloseStr;
        if (self.selectedBusiness.isOpenNow)
        ***REMOVED***
            openCloseStr = @"Closes at";
            timeStr = todayDict[@"end"];
        ***REMOVED***
        else
        ***REMOVED***
            openCloseStr = @"Opens at";
            timeStr = todayDict[@"start"];
        ***REMOVED***
        
        NSDateFormatter *df;
        if (!df)
        ***REMOVED***
            df = [[NSDateFormatter alloc] init];

        ***REMOVED***
        
        df.dateFormat = @"HH:mm"; ***REMOVED*** The old format

        NSMutableString *mutableTime = [NSMutableString stringWithString:timeStr];
        [mutableTime insertString:@":" atIndex:2];

        NSString *time = mutableTime;
        NSDate *date = [df dateFromString:time];
        df.dateFormat = @"hh:mm a"; ***REMOVED*** The new format

        NSString *newStr = [df stringFromDate:date];
        self.openClosesLabel.text = [NSString stringWithFormat:@"%@ %@", openCloseStr, newStr];
    ***REMOVED***
***REMOVED***

***REMOVED***
