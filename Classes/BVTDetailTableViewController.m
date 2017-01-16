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
#import "BVTYelpContactTableViewCell.h"
#import "BVTYelpRatingTableViewCell.h"
#import "BVTYelpMapTableViewCell.h"
#import "BVTSplitTableViewCell.h"
#import "BVTStyles.h"
#import "YLPClient+Business.h"
#import "YLPBusiness.h"

@interface BVTDetailTableViewController ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) BVTHeaderTitleView *headerTitleView;

***REMOVED***

static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";
static NSString *const kYelpAddressCellNib = @"BVTYelpAddressTableViewCell";
static NSString *const kYelpContactCellNib = @"BVTYelpContactTableViewCell";
static NSString *const kYelpRatingCellNib = @"BVTYelpRatingTableViewCell";
static NSString *const kYelpMapCellNib = @"BVTYelpMapTableViewCell";
static NSString *const kSplitCellNib = @"BVTSplitTableViewCell";

static NSString *const kYelpMapCellIdentifier = @"YelpMapCell";
static NSString *const kYelpAddressCellIdentifier = @"YelpAddressCell";
static NSString *const kYelpContactCellIdentifier = @"YelpContactCell";
static NSString *const kYelpRatingCellIdentifier = @"YelpRatingCell";
static NSString *const kSplitCellIdentifier = @"SplitCell";

@implementation BVTDetailTableViewController

#pragma mark - View Life Cycle

- (void)awakeFromNib
***REMOVED***
    [super awakeFromNib];
    
    UINib *nibTitleView = [UINib nibWithNibName:kHeaderTitleViewNib bundle:nil];
    self.headerTitleView = [[nibTitleView instantiateWithOwner:self options:nil] objectAtIndex:0];
    self.navigationItem.titleView = self.headerTitleView;
***REMOVED***

- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
    self.titleLabel.text = self.detailTitle;

    UINib *yelpMapCellNib = [UINib nibWithNibName:kYelpMapCellNib bundle:nil];
    [self.tableView registerNib:yelpMapCellNib forCellReuseIdentifier:kYelpMapCellIdentifier];
    
    UINib *yelpAddressCellNib = [UINib nibWithNibName:kYelpAddressCellNib bundle:nil];
    [self.tableView registerNib:yelpAddressCellNib forCellReuseIdentifier:kYelpAddressCellIdentifier];
    
    UINib *yelpContactCellNib = [UINib nibWithNibName:kYelpContactCellNib bundle:nil];
    [self.tableView registerNib:yelpContactCellNib forCellReuseIdentifier:kYelpContactCellIdentifier];
    
    UINib *yelpRatingCellNib = [UINib nibWithNibName:kYelpRatingCellNib bundle:nil];
    [self.tableView registerNib:yelpRatingCellNib forCellReuseIdentifier:kYelpRatingCellIdentifier];
    
    UINib *splitCellNib = [UINib nibWithNibName:kSplitCellNib bundle:nil];
    [self.tableView registerNib:splitCellNib forCellReuseIdentifier:kSplitCellIdentifier];
        
    self.tableView.estimatedRowHeight = 44.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.tableView.backgroundColor = [UIColor colorWithRed:(249/255.0) green:(249/255.0) blue:(249/255.0) alpha:1];
    
    self.tableView.tableFooterView = [UIView new];
***REMOVED***

- (void)viewWillAppear:(BOOL)animated
***REMOVED***
    [super viewWillAppear:animated];
    
    self.headerTitleView.centerXConstraint.constant = [self _adjustTitleViewCenter];
***REMOVED***

#pragma mark - TableView Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
***REMOVED***
    return 1;
***REMOVED***

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
***REMOVED***
    return 6;
***REMOVED***

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    NSString *identifier = @"";
    if (indexPath.row == 0)
    ***REMOVED***
        identifier = kYelpRatingCellIdentifier;
    ***REMOVED***
    else if (indexPath.row == 1)
    ***REMOVED***
        identifier = kYelpContactCellIdentifier;
    ***REMOVED***
    else if (indexPath.row == 2)
    ***REMOVED***
        identifier = kYelpAddressCellIdentifier;
    ***REMOVED***
    else if (indexPath.row == 3)
    ***REMOVED***
        identifier = kYelpMapCellIdentifier;
    ***REMOVED***
    else if (indexPath.row == 4 || indexPath.row == 5)
    ***REMOVED***
        identifier = kSplitCellIdentifier;
    ***REMOVED***
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row == 0)
    ***REMOVED***
        BVTYelpRatingTableViewCell *ratingCell = (BVTYelpRatingTableViewCell *)cell;
        ratingCell.reviewsCountLabel.text = [NSString stringWithFormat:@"%ld Reviews", self.business.reviewCount];
        
***REMOVED***        NSString *catString;
        ***REMOVED*** TODO: make sure there arent more than three categories per place or fix code accordingly for more
        
***REMOVED***        NSArray *categories = self.business.categories;
        
***REMOVED***        if (self.business.categories.count == 1)
***REMOVED***        ***REMOVED***
***REMOVED***            catString = categories[0];
***REMOVED***        ***REMOVED***
***REMOVED***        else if (self.business.categories.count == 2)
***REMOVED***        ***REMOVED***
***REMOVED***            catString = [NSString stringWithFormat:@"%@, %@", categories[0], categories[1]];
***REMOVED***        ***REMOVED***
***REMOVED***        else if (self.business.categories.count == 3)
***REMOVED***        ***REMOVED***
***REMOVED***            catString = [NSString stringWithFormat:@"%@, %@, %@", categories[0], categories[1], categories[2]];
***REMOVED***        ***REMOVED***
***REMOVED***
***REMOVED***        ratingCell.yelpCategoryLabel.text = catString;
        
        NSString *ratingString;
        if (self.business.rating == 0)
        ***REMOVED***
            ratingString = star_zero;
        ***REMOVED***
        else if (self.business.rating == 1)
        ***REMOVED***
            ratingString = star_one;
        ***REMOVED***
        else if (self.business.rating == 1.5)
        ***REMOVED***
            ratingString = star_one_half;
        ***REMOVED***
        else if (self.business.rating == 2)
        ***REMOVED***
            ratingString = star_two;
        ***REMOVED***
        else if (self.business.rating == 2.5)
        ***REMOVED***
            ratingString = star_two_half;
        ***REMOVED***
        else if (self.business.rating == 3)
        ***REMOVED***
            ratingString = star_three;
        ***REMOVED***
        else if (self.business.rating == 3.5)
        ***REMOVED***
            ratingString = star_three_half;
        ***REMOVED***
        else if (self.business.rating == 4)
        ***REMOVED***
            ratingString = star_four;
        ***REMOVED***
        else if (self.business.rating == 4.5)
        ***REMOVED***
            ratingString = star_four_half;
        ***REMOVED***
        else if (self.business.rating == 5)
        ***REMOVED***
            ratingString = star_five;
        ***REMOVED***
        
        [ratingCell.ratingStarsView setImage:[UIImage imageNamed:ratingString]];
    ***REMOVED***
    else if (indexPath.row == 1)
    ***REMOVED***
                BVTYelpContactTableViewCell *defaultCell = (BVTYelpContactTableViewCell *)cell;
        defaultCell.phoneNumberLabel.text = self.business.phone;
    ***REMOVED***
    else if (indexPath.row == 2)
    ***REMOVED***
***REMOVED***                BVTYelpAddressTableViewCell *defaultCell = (BVTYelpAddressTableViewCell *)cell;
***REMOVED***        NSDictionary *address = self.business[@"location"];
***REMOVED***
***REMOVED***        defaultCell.addressLabel.text = address[@"display_address"][0];
***REMOVED***        defaultCell.addressLabel2.text = address[@"display_address"][1];

    ***REMOVED***
    else if (indexPath.row == 3)
    ***REMOVED***
***REMOVED***        BVTYelpContactTableViewCell *defaultCell = (BVTYelpContactTableViewCell *)cell;
    ***REMOVED***
    else if (indexPath.row == 4 || indexPath.row == 5)
    ***REMOVED***
        BVTSplitTableViewCell *splitCell = (BVTSplitTableViewCell *)cell;
        if (indexPath.row == 4)
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

    return cell;
***REMOVED***

#pragma mark - IBActions

- (IBAction)didTapBack:(id)sender
***REMOVED***
    [self.navigationController popViewControllerAnimated:YES];
***REMOVED***

#pragma mark - Private Methods

- (CGFloat)_adjustTitleViewCenter
***REMOVED***
    BOOL deviceIsPortrait = [[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait;
    
    return deviceIsPortrait ? -20.f : 0.f;
***REMOVED***

#pragma mark - Device Orientation

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id)coordinator
***REMOVED***
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [coordinator animateAlongsideTransition:^(id  _Nonnull context) ***REMOVED***
        self.headerTitleView.centerXConstraint.constant = -20.f;
        [self.tableView reloadData];
    ***REMOVED*** completion:^(id  _Nonnull context) ***REMOVED***
    ***REMOVED***];
***REMOVED***

***REMOVED***
