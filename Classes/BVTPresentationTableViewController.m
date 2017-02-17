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
        if ([button.titleLabel.text isEqualToString:@"Reviews"])
        ***REMOVED***
            return self.business.reviews.count;
        ***REMOVED***
        else if ([button.titleLabel.text isEqualToString:@"Photos"])
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
        if ([button.titleLabel.text isEqualToString:@"Reviews"])
        ***REMOVED***
            identifier = kReviewsCellID;
        ***REMOVED***
        else if ([button.titleLabel.text isEqualToString:@"Photos"])
        ***REMOVED***
            identifier = kPhotoCellID;
        ***REMOVED***
    ***REMOVED***
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    if ([identifier isEqualToString:kReviewsCellID])
    ***REMOVED***
        NSDictionary *reviewDict = [self.business.reviews objectAtIndex:indexPath.row];
        BVTYelpReviewsTableViewCell *reviewsCell = (BVTYelpReviewsTableViewCell *)cell;
        reviewsCell.reviewLabel.text = reviewDict[@"text"];
    ***REMOVED***
    else if ([identifier isEqualToString:kPhotoCellID])
    ***REMOVED***
        BVTYelpPhotoTableViewCell *photoCell = (BVTYelpPhotoTableViewCell *)cell;
        photoCell.photoView.image = [self.business.photos objectAtIndex:indexPath.row];
    ***REMOVED***
 
    return cell;
***REMOVED***

/*
***REMOVED*** Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath ***REMOVED***
    ***REMOVED*** Return NO if you do not want the specified item to be editable.
***REMOVED***
***REMOVED***
*/

/*
***REMOVED*** Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath ***REMOVED***
    if (editingStyle == UITableViewCellEditingStyleDelete) ***REMOVED***
        ***REMOVED*** Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    ***REMOVED*** else if (editingStyle == UITableViewCellEditingStyleInsert) ***REMOVED***
        ***REMOVED*** Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    ***REMOVED***   
***REMOVED***
*/

/*
***REMOVED*** Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath ***REMOVED***
***REMOVED***
*/

/*
***REMOVED*** Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath ***REMOVED***
    ***REMOVED*** Return NO if you do not want the item to be re-orderable.
***REMOVED***
***REMOVED***
*/

/*
#pragma mark - Navigation

***REMOVED*** In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender ***REMOVED***
    ***REMOVED*** Get the new view controller using [segue destinationViewController].
    ***REMOVED*** Pass the selected object to the new view controller.
***REMOVED***
*/

***REMOVED***
