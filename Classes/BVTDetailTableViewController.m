***REMOVED***
***REMOVED***  BVTDetailTableViewController.m
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/20/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import "BVTDetailTableViewController.h"

#import "BVTHeaderTitleView.h"
#import "BVTYelpAddressTableViewCell.h"
#import "BVTYelpHoursTableViewCell.h"
#import "BVTYelpPhoneTableViewCell.h"
#import "BVTYelpRatingTableViewCell.h"
#import "BVTYelpMapTableViewCell.h"
#import "BVTSplitTableViewCell.h"
#import "BVTYelpCategoryTableViewCell.h"

#import "BVTStyles.h"

@interface BVTDetailTableViewController ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

***REMOVED***

static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";
static NSString *const kYelpAddressCellNib = @"BVTYelpAddressTableViewCell";
static NSString *const kYelpPhoneCellNib = @"BVTYelpPhoneTableViewCell";
static NSString *const kYelpRatingCellNib = @"BVTYelpRatingTableViewCell";
static NSString *const kYelpMapCellNib = @"BVTYelpMapTableViewCell";
static NSString *const kYelpCategoryCellNib = @"BVTYelpCategoryTableViewCell";
static NSString *const kYelpHoursCellNib = @"BVTYelpHoursTableViewCell";

static NSString *const kSplitCellNib = @"BVTSplitTableViewCell";
static NSString *const kYelpHoursCellIdentifier = @"YelpHoursCell";

static NSString *const kYelpMapCellIdentifier = @"YelpMapCell";
static NSString *const kYelpCategoryCellIdentifier = @"YelpCategoryCell";
static NSString *const kYelpAddressCellIdentifier = @"YelpAddressCell";
static NSString *const kYelpPhoneCellIdentifier = @"YelpContactCell";
static NSString *const kYelpRatingCellIdentifier = @"YelpRatingCell";
static NSString *const kSplitCellIdentifier = @"SplitCell";

@implementation BVTDetailTableViewController

#pragma mark - View Life Cycle

- (void)awakeFromNib
***REMOVED***
    [super awakeFromNib];
    
    UINib *nibTitleView = [UINib nibWithNibName:kHeaderTitleViewNib bundle:nil];
    BVTHeaderTitleView *headerTitleView = [[nibTitleView instantiateWithOwner:self options:nil] objectAtIndex:0];
    headerTitleView.titleViewLabelConstraint.constant = -20.f;
    self.navigationItem.titleView = headerTitleView;
    self.navigationController.navigationBar.barTintColor = [BVTStyles iconGreen];

***REMOVED***

- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
    self.titleLabel.text = self.selectedBusiness.name;

    UINib *yelpMapCellNib = [UINib nibWithNibName:kYelpMapCellNib bundle:nil];
    [self.tableView registerNib:yelpMapCellNib forCellReuseIdentifier:kYelpMapCellIdentifier];
    
    UINib *yelpHoursCellNib = [UINib nibWithNibName:kYelpHoursCellNib bundle:nil];
    [self.tableView registerNib:yelpHoursCellNib forCellReuseIdentifier:kYelpHoursCellIdentifier];
    
    
    UINib *yelpAddressCellNib = [UINib nibWithNibName:kYelpAddressCellNib bundle:nil];
    [self.tableView registerNib:yelpAddressCellNib forCellReuseIdentifier:kYelpAddressCellIdentifier];
    
    UINib *yelpPhoneCellNib = [UINib nibWithNibName:kYelpPhoneCellNib bundle:nil];
    [self.tableView registerNib:yelpPhoneCellNib forCellReuseIdentifier:kYelpPhoneCellIdentifier];
    
    UINib *yelpRatingCellNib = [UINib nibWithNibName:kYelpRatingCellNib bundle:nil];
    [self.tableView registerNib:yelpRatingCellNib forCellReuseIdentifier:kYelpRatingCellIdentifier];
    
    UINib *yelpCategoryCellNib = [UINib nibWithNibName:kYelpCategoryCellNib bundle:nil];
    [self.tableView registerNib:yelpCategoryCellNib forCellReuseIdentifier:kYelpCategoryCellIdentifier];
    
    UINib *splitCellNib = [UINib nibWithNibName:kSplitCellNib bundle:nil];
    [self.tableView registerNib:splitCellNib forCellReuseIdentifier:kSplitCellIdentifier];
    
    self.tableView.estimatedRowHeight = 44.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.tableView.tableFooterView = [UIView new];
***REMOVED***

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
***REMOVED***
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([cell isKindOfClass:[BVTYelpAddressTableViewCell class]])
    ***REMOVED***
        BVTYelpAddressTableViewCell *addressCell = (BVTYelpAddressTableViewCell *)cell;
        NSString *filteredString = [addressCell.mapsQueryString stringByReplacingOccurrencesOfString:@" " withString:@"+"];
        NSURL *url = [NSURL URLWithString:filteredString];
        [[UIApplication sharedApplication] openURL:url options:@***REMOVED******REMOVED*** completionHandler:^(BOOL success) ***REMOVED***
            NSLog(@"");
        ***REMOVED***];
    ***REMOVED***
    else if ([cell isKindOfClass:[BVTYelpPhoneTableViewCell class]])
    ***REMOVED***
        BVTYelpPhoneTableViewCell *phoneCell = (BVTYelpPhoneTableViewCell *)cell;
        [phoneCell didTapPhoneNumberButton:indexPath];
    ***REMOVED***
***REMOVED***

#pragma mark - TableView Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
***REMOVED***
    return 1;
***REMOVED***

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
***REMOVED***
    if (!self.selectedBusiness.phone)
    ***REMOVED***
        return 7;
    ***REMOVED***
    return 8;
***REMOVED***

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    NSString *identifier = @"";
    if (!self.selectedBusiness.phone)
    ***REMOVED***
        if (indexPath.row == 0)
        ***REMOVED***
            identifier = kYelpRatingCellIdentifier;
        ***REMOVED***
        else if (indexPath.row == 1)
        ***REMOVED***
            identifier = kYelpCategoryCellIdentifier;
        ***REMOVED***
        else if (indexPath.row == 2)
        ***REMOVED***
            identifier = kYelpHoursCellIdentifier;
        ***REMOVED***
        else if (indexPath.row == 3)
        ***REMOVED***
            identifier = kYelpAddressCellIdentifier;
        ***REMOVED***
        else if (indexPath.row == 4)
        ***REMOVED***
            identifier = kYelpMapCellIdentifier;
        ***REMOVED***
        else if (indexPath.row == 5 || indexPath.row == 6)
        ***REMOVED***
            identifier = kSplitCellIdentifier;
        ***REMOVED***
    ***REMOVED***
    else
    ***REMOVED***
        if (indexPath.row == 0)
        ***REMOVED***
            identifier = kYelpRatingCellIdentifier;
        ***REMOVED***
        else if (indexPath.row == 1)
        ***REMOVED***
            identifier = kYelpCategoryCellIdentifier;
        ***REMOVED***
        else if (indexPath.row == 2)
        ***REMOVED***
            identifier = kYelpHoursCellIdentifier;
        ***REMOVED***
        else if (indexPath.row == 3)
        ***REMOVED***
            identifier = kYelpPhoneCellIdentifier;
        ***REMOVED***
        else if (indexPath.row == 4)
        ***REMOVED***
            identifier = kYelpAddressCellIdentifier;
        ***REMOVED***
        else if (indexPath.row == 5)
        ***REMOVED***
            identifier = kYelpMapCellIdentifier;
        ***REMOVED***
        else if (indexPath.row == 6 || indexPath.row == 7)
        ***REMOVED***
            identifier = kSplitCellIdentifier;
        ***REMOVED***
    ***REMOVED***
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (!self.selectedBusiness.phone)
    ***REMOVED***
        if (indexPath.row == 0)
        ***REMOVED***
            BVTYelpRatingTableViewCell *ratingCell = (BVTYelpRatingTableViewCell *)cell;
            ratingCell.selectedBusiness = self.selectedBusiness;
        ***REMOVED***
        else if (indexPath.row == 1)
        ***REMOVED***
            BVTYelpCategoryTableViewCell *defaultCell = (BVTYelpCategoryTableViewCell *)cell;
            defaultCell.selectedBusiness = self.selectedBusiness;
            
        ***REMOVED***
        else if (indexPath.row == 2)
        ***REMOVED***
            BVTYelpHoursTableViewCell *defaultCell = (BVTYelpHoursTableViewCell *)cell;
            defaultCell.isOpenLabel.text = self.selectedBusiness.isOpenNow ? @"Open" : @"Closed";
            defaultCell.isOpenLabel.textColor = [UIColor redColor];
            if ([defaultCell.isOpenLabel.text isEqualToString:@"Open"])
            ***REMOVED***
                defaultCell.isOpenLabel.textColor = [UIColor greenColor];
            ***REMOVED***
            
        ***REMOVED***
        else if (indexPath.row == 3)
        ***REMOVED***
            BVTYelpAddressTableViewCell *defaultCell = (BVTYelpAddressTableViewCell *)cell;
            defaultCell.selectedBusiness = self.selectedBusiness;
            
        ***REMOVED***
        else if (indexPath.row == 4)
        ***REMOVED***
            BVTYelpMapTableViewCell *defaultCell = (BVTYelpMapTableViewCell *)cell;
            defaultCell.selectedBusiness = self.selectedBusiness;
        ***REMOVED***
        else if (indexPath.row == 5 || indexPath.row == 6)
        ***REMOVED***
            BVTSplitTableViewCell *splitCell = (BVTSplitTableViewCell *)cell;
            if (indexPath.row == 5)
            ***REMOVED***
                [splitCell.leftButton setTitle:@"Deals" forState:UIControlStateNormal];
                [splitCell.rightButton setTitle:@"Reviews" forState:UIControlStateNormal];
            ***REMOVED***
            else
            ***REMOVED***
                [splitCell.leftButton setTitle:@"Map" forState:UIControlStateNormal];
                [splitCell.rightButton setTitle:@"Photos" forState:UIControlStateNormal];
            ***REMOVED***
        ***REMOVED***
    ***REMOVED***
    else
    ***REMOVED***
        if (indexPath.row == 0)
        ***REMOVED***
            BVTYelpRatingTableViewCell *ratingCell = (BVTYelpRatingTableViewCell *)cell;
            ratingCell.selectedBusiness = self.selectedBusiness;
        ***REMOVED***
        else if (indexPath.row == 1)
        ***REMOVED***
            BVTYelpCategoryTableViewCell *defaultCell = (BVTYelpCategoryTableViewCell *)cell;
            defaultCell.selectedBusiness = self.selectedBusiness;
        ***REMOVED***
        else if (indexPath.row == 2)
        ***REMOVED***
            BVTYelpHoursTableViewCell *defaultCell = (BVTYelpHoursTableViewCell *)cell;
            defaultCell.isOpenLabel.text = self.selectedBusiness.isOpenNow ? @"Open" : @"Closed";
            defaultCell.isOpenLabel.textColor = [UIColor redColor];
            if ([defaultCell.isOpenLabel.text isEqualToString:@"Open"])
            ***REMOVED***
                defaultCell.isOpenLabel.textColor = [UIColor greenColor];
            ***REMOVED***
        ***REMOVED***
        else if (indexPath.row == 3)
        ***REMOVED***
            BVTYelpPhoneTableViewCell *defaultCell = (BVTYelpPhoneTableViewCell *)cell;
            defaultCell.selectedBusiness = self.selectedBusiness;
        ***REMOVED***
        else if (indexPath.row == 4)
        ***REMOVED***
            BVTYelpAddressTableViewCell *defaultCell = (BVTYelpAddressTableViewCell *)cell;
            defaultCell.selectedBusiness = self.selectedBusiness;
        ***REMOVED***
        else if (indexPath.row == 5)
        ***REMOVED***
            BVTYelpMapTableViewCell *defaultCell = (BVTYelpMapTableViewCell *)cell;
            defaultCell.selectedBusiness = self.selectedBusiness;
        ***REMOVED***
        else if (indexPath.row == 6 || indexPath.row == 7)
        ***REMOVED***
            BVTSplitTableViewCell *splitCell = (BVTSplitTableViewCell *)cell;
            if (indexPath.row == 6)
            ***REMOVED***
                [splitCell.leftButton setTitle:@"Deals" forState:UIControlStateNormal];
                [splitCell.rightButton setTitle:@"Reviews" forState:UIControlStateNormal];
            ***REMOVED***
            else
            ***REMOVED***
                [splitCell.leftButton setTitle:@"Map" forState:UIControlStateNormal];
                [splitCell.rightButton setTitle:@"Photos" forState:UIControlStateNormal];
            ***REMOVED***
        ***REMOVED***
    ***REMOVED***
    
    return cell;
***REMOVED***

#pragma mark - IBActions

- (IBAction)didTapBack:(id)sender
***REMOVED***
    [self.navigationController popViewControllerAnimated:YES];
***REMOVED***

***REMOVED***
