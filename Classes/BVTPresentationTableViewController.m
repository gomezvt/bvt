***REMOVED***
***REMOVED***  BVTPresentationTableViewController.m
***REMOVED***  bvt
***REMOVED***
***REMOVED***  Created by Greg on 2/15/17.
***REMOVED***  Copyright © 2017 gms. All rights reserved.
***REMOVED***

#import "BVTPresentationTableViewController.h"

#import "BVTYelpPhotoTableViewCell.h"
#import "BVTYelpReviewsTableViewCell.h"

@interface BVTPresentationTableViewController ()

***REMOVED***

static NSString *const kPhotoNib = @"BVTYelpPhotoTableViewCell";
static NSString *const kPhotoCellID = @"BVTYelpPhotoCellIdentifier";
static NSString *const kReviewsNib = @"BVTYelpReviewsTableViewCell";
static NSString *const kReviewsCellID = @"BVTReviewsPhotoCellIdentifier";

NSString *const kstar_zero_mini          = @"star_zero_mini.png";
NSString *const kstar_one_mini           = @"star_one_mini.png";
NSString *const kstar_one_half_mini      = @"star_one_half_mini.png";
NSString *const kstar_two_mini           = @"star_two_mini.png";
NSString *const kstar_two_half_mini      = @"star_two_half_mini.png";
NSString *const kstar_three_mini         = @"star_three_mini.png";
NSString *const kstar_three_half_mini    = @"star_three_half_mini.png";
NSString *const kstar_four_mini          = @"star_four_mini.png";
NSString *const kstar_four_half_mini     = @"star_four_half_mini.png";
NSString *const kstar_five_mini          = @"star_five_mini.png";

@implementation BVTPresentationTableViewController

- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = 44.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    UINib *yelpPhotoCellNib = [UINib nibWithNibName:kPhotoNib bundle:nil];
    [self.tableView registerNib:yelpPhotoCellNib forCellReuseIdentifier:kPhotoCellID];
    
    UINib *yelpReviewsCellNib = [UINib nibWithNibName:kReviewsNib bundle:nil];
    [self.tableView registerNib:yelpReviewsCellNib forCellReuseIdentifier:kReviewsCellID];
***REMOVED***

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
***REMOVED***
    return 1;
***REMOVED***

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
***REMOVED***
    if ([self.sender isKindOfClass:[UIButton class]])
    ***REMOVED***
        UIButton *button = (UIButton *)self.sender;
        if ([button.titleLabel.text containsString:@"Reviews"])
        ***REMOVED***
            return self.business.reviews.count;
        ***REMOVED***
        else if ([button.titleLabel.text containsString:@"Photos"])
        ***REMOVED***
            return self.business.photos.count;
        ***REMOVED***
    ***REMOVED***
    return 1;
***REMOVED***

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    NSString *identifier;

    if ([self.sender isKindOfClass:[UIButton class]])
    ***REMOVED***
        UIButton *button = (UIButton *)self.sender;
        if ([button.titleLabel.text containsString:@"Reviews"])
        ***REMOVED***
            identifier = kReviewsCellID;
        ***REMOVED***
        else if ([button.titleLabel.text containsString:@"Photos"])
        ***REMOVED***
            identifier = kPhotoCellID;
        ***REMOVED***
    ***REMOVED***
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    if ([identifier isEqualToString:kReviewsCellID])
    ***REMOVED***
        BVTYelpReviewsTableViewCell *reviewsCell = (BVTYelpReviewsTableViewCell *)cell;
        NSDateFormatter *dateFormatter;
        if (!dateFormatter)
        ***REMOVED***
            dateFormatter = [[NSDateFormatter alloc] init];
        ***REMOVED***
        [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd  HH':'mm':'ss"];
        NSDictionary *reviewDict = [self.business.reviews objectAtIndex:indexPath.row];
        NSDate *date = [dateFormatter dateFromString:reviewDict[@"time_created"]];
        [dateFormatter setDateFormat:@"MMM d, yyyy h:mm a"];
        reviewsCell.dateLabel.text = [dateFormatter stringFromDate:date];
        reviewsCell.reviewLabel.text = reviewDict[@"text"];

        NSDictionary *user = reviewDict[@"user"];
        reviewsCell.nameLabel.text = user[@"name"];
        
        reviewsCell.userImageView.image = [UIImage imageNamed:@"placeholder"];
        dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
            NSString *userStr = user[@"image_url"];
            NSURL *url = [NSURL URLWithString:userStr];
            NSData *imageData = [NSData dataWithContentsOfURL:url];
            UIImage *image = [UIImage imageWithData:imageData];
            if (image)
            ***REMOVED***
                reviewsCell.userImageView.image = image;
            ***REMOVED***
        ***REMOVED***);
        
        NSString *ratingString;
        NSNumber *rating = reviewDict[@"rating"];
        if ([rating integerValue] == 0)
        ***REMOVED***
            ratingString = kstar_zero_mini;
        ***REMOVED***
        else if ([rating integerValue] == 1)
        ***REMOVED***
            ratingString = kstar_one_mini;
        ***REMOVED***
        else if ([rating integerValue] == 1.5)
        ***REMOVED***
            ratingString = kstar_one_half_mini;
        ***REMOVED***
        else if ([rating integerValue] == 2)
        ***REMOVED***
            ratingString = kstar_two_mini;
        ***REMOVED***
        else if ([rating integerValue] == 2.5)
        ***REMOVED***
            ratingString = kstar_two_half_mini;
        ***REMOVED***
        else if ([rating integerValue] == 3)
        ***REMOVED***
            ratingString = kstar_three_mini;
        ***REMOVED***
        else if ([rating integerValue] == 3.5)
        ***REMOVED***
            ratingString = kstar_three_half_mini;
        ***REMOVED***
        else if ([rating integerValue] == 4)
        ***REMOVED***
            ratingString = kstar_four_mini;
        ***REMOVED***
        else if ([rating integerValue] == 4.5)
        ***REMOVED***
            ratingString = kstar_four_half_mini;
        ***REMOVED***
        else
        ***REMOVED***
            ***REMOVED*** 5 star rating
            ratingString = kstar_five_mini;
        ***REMOVED***
        
        [reviewsCell.ratingView setImage:[UIImage imageNamed:ratingString]];
    ***REMOVED***
    else if ([identifier isEqualToString:kPhotoCellID])
    ***REMOVED***
        BVTYelpPhotoTableViewCell *photoCell = (BVTYelpPhotoTableViewCell *)cell;
        photoCell.photoView.image = [self.business.photos objectAtIndex:indexPath.row];
    ***REMOVED***
 
    return cell;
***REMOVED***

***REMOVED***
