//
//  BVTDetailTableViewController.m
//  burlingtonian
//
//  Created by Greg on 12/20/16.
//  Copyright © 2016 gomez. All rights reserved.
//

#import "BVTDetailTableViewController.h"

#import "BVTHeaderTitleView.h"
#import "BVTYelpAddressTableViewCell.h"
#import "BVTYelpPhoneTableViewCell.h"
#import "BVTYelpRatingTableViewCell.h"
#import "BVTYelpMapTableViewCell.h"
#import "BVTSplitTableViewCell.h"

@interface BVTDetailTableViewController ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) BVTHeaderTitleView *headerTitleView;

@end

static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";
static NSString *const kYelpAddressCellNib = @"BVTYelpAddressTableViewCell";
static NSString *const kYelpPhoneCellNib = @"BVTYelpPhoneTableViewCell";
static NSString *const kYelpRatingCellNib = @"BVTYelpRatingTableViewCell";
static NSString *const kYelpMapCellNib = @"BVTYelpMapTableViewCell";
static NSString *const kSplitCellNib = @"BVTSplitTableViewCell";

static NSString *const kYelpMapCellIdentifier = @"YelpMapCell";
static NSString *const kYelpAddressCellIdentifier = @"YelpAddressCell";
static NSString *const kYelpPhoneCellIdentifier = @"YelpContactCell";
static NSString *const kYelpRatingCellIdentifier = @"YelpRatingCell";
static NSString *const kSplitCellIdentifier = @"SplitCell";

@implementation BVTDetailTableViewController

#pragma mark - View Life Cycle

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    UINib *nibTitleView = [UINib nibWithNibName:kHeaderTitleViewNib bundle:nil];
    self.headerTitleView = [[nibTitleView instantiateWithOwner:self options:nil] objectAtIndex:0];
    self.navigationItem.titleView = self.headerTitleView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.titleLabel.text = self.selectedBusiness.name;

    UINib *yelpMapCellNib = [UINib nibWithNibName:kYelpMapCellNib bundle:nil];
    [self.tableView registerNib:yelpMapCellNib forCellReuseIdentifier:kYelpMapCellIdentifier];
    
    UINib *yelpAddressCellNib = [UINib nibWithNibName:kYelpAddressCellNib bundle:nil];
    [self.tableView registerNib:yelpAddressCellNib forCellReuseIdentifier:kYelpAddressCellIdentifier];
    
    UINib *yelpPhoneCellNib = [UINib nibWithNibName:kYelpPhoneCellNib bundle:nil];
    [self.tableView registerNib:yelpPhoneCellNib forCellReuseIdentifier:kYelpPhoneCellIdentifier];
    
    UINib *yelpRatingCellNib = [UINib nibWithNibName:kYelpRatingCellNib bundle:nil];
    [self.tableView registerNib:yelpRatingCellNib forCellReuseIdentifier:kYelpRatingCellIdentifier];
    
    UINib *splitCellNib = [UINib nibWithNibName:kSplitCellNib bundle:nil];
    [self.tableView registerNib:splitCellNib forCellReuseIdentifier:kSplitCellIdentifier];
        
    self.tableView.estimatedRowHeight = 44.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.tableView.tableFooterView = [UIView new];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.headerTitleView.centerXConstraint.constant = [self _adjustTitleViewCenter];
}

#pragma mark - TableView Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (!self.selectedBusiness.phone)
    {
        return 5;
    }
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"";
    if (!self.selectedBusiness.phone)
    {
        if (indexPath.row == 0)
        {
            identifier = kYelpRatingCellIdentifier;
        }
        else if (indexPath.row == 1)
        {
            identifier = kYelpAddressCellIdentifier;
        }
        else if (indexPath.row == 2)
        {
            identifier = kYelpMapCellIdentifier;
        }
        else if (indexPath.row == 3 || indexPath.row == 4)
        {
            identifier = kSplitCellIdentifier;
        }
    }
    else
    {
        if (indexPath.row == 0)
        {
            identifier = kYelpRatingCellIdentifier;
        }
        else if (indexPath.row == 1)
        {
            identifier = kYelpPhoneCellIdentifier;
        }
        else if (indexPath.row == 2)
        {
            identifier = kYelpAddressCellIdentifier;
        }
        else if (indexPath.row == 3)
        {
            identifier = kYelpMapCellIdentifier;
        }
        else if (indexPath.row == 4 || indexPath.row == 5)
        {
            identifier = kSplitCellIdentifier;
        }
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (!self.selectedBusiness.phone)
    {
        if (indexPath.row == 0)
        {
            BVTYelpRatingTableViewCell *ratingCell = (BVTYelpRatingTableViewCell *)cell;
            ratingCell.selectedBusiness = self.selectedBusiness;
        }
        else if (indexPath.row == 1)
        {
            BVTYelpAddressTableViewCell *defaultCell = (BVTYelpAddressTableViewCell *)cell;
            defaultCell.selectedBusiness = self.selectedBusiness;
        }
        else if (indexPath.row == 2)
        {
            // Map
        }
        else if (indexPath.row == 3 || indexPath.row == 4)
        {
            BVTSplitTableViewCell *splitCell = (BVTSplitTableViewCell *)cell;
            if (indexPath.row == 3)
            {
                [splitCell.leftButton setTitle:@"Deals" forState:UIControlStateNormal];
                [splitCell.rightButton setTitle:@"Reviews" forState:UIControlStateNormal];
            }
            else
            {
                [splitCell.leftButton setTitle:@"Map" forState:UIControlStateNormal];
                [splitCell.rightButton setTitle:@"Photos" forState:UIControlStateNormal];
            }
        }
    }
    else
    {
        if (indexPath.row == 0)
        {
            BVTYelpRatingTableViewCell *ratingCell = (BVTYelpRatingTableViewCell *)cell;
            ratingCell.selectedBusiness = self.selectedBusiness;
        }
        else if (indexPath.row == 1)
        {
            BVTYelpPhoneTableViewCell *defaultCell = (BVTYelpPhoneTableViewCell *)cell;
            defaultCell.selectedBusiness = self.selectedBusiness;
        }
        else if (indexPath.row == 2)
        {
            BVTYelpAddressTableViewCell *defaultCell = (BVTYelpAddressTableViewCell *)cell;
            defaultCell.selectedBusiness = self.selectedBusiness;
        }
        else if (indexPath.row == 3)
        {
            // Map
        }
        else if (indexPath.row == 4 || indexPath.row == 5)
        {
            BVTSplitTableViewCell *splitCell = (BVTSplitTableViewCell *)cell;
            if (indexPath.row == 4)
            {
                [splitCell.leftButton setTitle:@"Deals" forState:UIControlStateNormal];
                [splitCell.rightButton setTitle:@"Reviews" forState:UIControlStateNormal];
            }
            else
            {
                [splitCell.leftButton setTitle:@"Map" forState:UIControlStateNormal];
                [splitCell.rightButton setTitle:@"Photos" forState:UIControlStateNormal];
            }
        }
    }
    

    
    

    return cell;
}

#pragma mark - IBActions

- (IBAction)didTapBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Private Methods

- (CGFloat)_adjustTitleViewCenter
{
    BOOL deviceIsPortrait = [[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait;
    
    return deviceIsPortrait ? -20.f : 0.f;
}

#pragma mark - Device Orientation

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [coordinator animateAlongsideTransition:^(id  _Nonnull context) {
        self.headerTitleView.centerXConstraint.constant = -20.f;
        [self.tableView reloadData];
    } completion:^(id  _Nonnull context) {
    }];
}

@end
