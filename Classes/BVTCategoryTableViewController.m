***REMOVED***
***REMOVED***  BVTCategoryTableViewController.m
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/20/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import "BVTCategoryTableViewController.h"

#import "BVTHeaderTitleView.h"
#import "BVTThumbNailTableViewCell.h"
#import "BVTSubCategoryTableViewController.h"
#import "BVTStyles.h"
***REMOVED***

#import "YLPClient+Search.h"
#import "YLPSortType.h"
#import "YLPSearch.h"
#import "YLPBusiness.h"

@interface BVTCategoryTableViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) BVTHeaderTitleView *headerTitleView;

***REMOVED***

static NSArray *categories;
static NSArray *businessesToDisplay;
static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";
static NSString *const kThumbNailCell = @"BVTThumbNailTableViewCell";
static NSString *const kDefaultCellIdentifier = @"Cell";
static NSString *const kShowSubCategorySegue = @"ShowSubCategory";

@implementation BVTCategoryTableViewController

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
    
    categories = @[ ];
    
    self.titleLabel.text = self.categoryTitle;
    
    if ([self.categoryTitle isEqualToString:@"Arts and Museums"])
    ***REMOVED***
        categories = kArtsMuseums;
    ***REMOVED***
    else if ([self.categoryTitle isEqualToString:@"Coffee, Sweets, and Bakeries"])
    ***REMOVED***
        categories = kCoffeeSweetsBakeries;
    ***REMOVED***
    else if ([self.categoryTitle isEqualToString:@"Music"])
    ***REMOVED***
        categories = kMusic;
    ***REMOVED***
    else if ([self.categoryTitle isEqualToString:@"Hotels, Hostels, Bed & Breakfast"])
    ***REMOVED***
        categories = kHotelsHostelsBB;
    ***REMOVED***
    else if ([self.categoryTitle isEqualToString:@"Entertainment and Recreation"])
    ***REMOVED***
        categories = kEntertainmentRecreation;
    ***REMOVED***
    else if ([self.categoryTitle isEqualToString:@"Bars and Lounges"])
    ***REMOVED***
        categories = kBarsLounges;
    ***REMOVED***
    else if ([self.categoryTitle isEqualToString:@"Restaurants"])
    ***REMOVED***
        categories = kRestaurants;
    ***REMOVED***
    else if ([self.categoryTitle isEqualToString:@"Shopping"])
    ***REMOVED***
        categories = kShopping;
    ***REMOVED***
    else if ([self.categoryTitle isEqualToString:@"Tours and Festivals"])
    ***REMOVED***
        categories = kToursFestivals;
    ***REMOVED***
    else
    ***REMOVED***
        ***REMOVED*** Travel
        categories = kTravel;
    ***REMOVED***
    
    UINib *cellNib = [UINib nibWithNibName:kThumbNailCell bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:kDefaultCellIdentifier];
    
    self.tableView.estimatedRowHeight = 44.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
***REMOVED***

- (void)viewWillAppear:(BOOL)animated
***REMOVED***
    [super viewWillAppear:animated];
    
    self.headerTitleView.centerXConstraint.constant = [self _adjustTitleViewCenter];
***REMOVED***

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
***REMOVED***
    BVTThumbNailTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *selectionTitle = cell.titleLabel.text;
    [self performSegueWithIdentifier:kShowSubCategorySegue sender:nil];

***REMOVED***    [[AppDelegate sharedClient] searchWithLocation:@"Burlington, VT" term:selectionTitle limit:30 offset:0 sort:YLPSortTypeDistance completionHandler:^
***REMOVED***     (YLPSearch *searchResults, NSError *error) ***REMOVED***
***REMOVED***         dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
***REMOVED***             if (searchResults.businesses.count > 0) ***REMOVED***
***REMOVED***                 NSMutableArray *filteredArray = [NSMutableArray array];
***REMOVED***                 for (YLPBusiness *biz in searchResults.businesses)
***REMOVED***                 ***REMOVED***
***REMOVED***                     if ([[biz.categories filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"name = %@", selectionTitle]] lastObject])
***REMOVED***                     ***REMOVED***
***REMOVED***                         [filteredArray addObject:biz];
***REMOVED***                     ***REMOVED***
***REMOVED***                 ***REMOVED***
***REMOVED***                 [self performSegueWithIdentifier:kShowSubCategorySegue sender:@[ selectionTitle, filteredArray ]];
***REMOVED***             ***REMOVED***
***REMOVED***             else if (error) ***REMOVED***
***REMOVED***                 NSLog(@"An error happened during the request: %@", error);
***REMOVED***             ***REMOVED***
***REMOVED***             else ***REMOVED***
***REMOVED***                 NSLog(@"No business was found");
***REMOVED***             ***REMOVED***
***REMOVED***         ***REMOVED***);
***REMOVED***     ***REMOVED***];
***REMOVED***

#pragma mark - TableView Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
***REMOVED***
    return 1;
***REMOVED***

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
***REMOVED***
    return categories.count;
***REMOVED***

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    BVTThumbNailTableViewCell *cell = (BVTThumbNailTableViewCell *)[tableView dequeueReusableCellWithIdentifier:kDefaultCellIdentifier forIndexPath:indexPath];
    
    cell.titleLabel.text = [categories objectAtIndex:indexPath.row];

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

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
***REMOVED***
***REMOVED***    NSArray *info = sender;
***REMOVED***    if ([[segue identifier] isEqualToString:kShowSubCategorySegue])
***REMOVED***    ***REMOVED***
***REMOVED***        ***REMOVED*** Get destination view
***REMOVED***        BVTSubCategoryTableViewController *vc = [segue destinationViewController];
***REMOVED***        vc.subCategoryTitle = [info firstObject];
***REMOVED***        vc.searchResults = [info lastObject];
***REMOVED***    ***REMOVED***
***REMOVED***

***REMOVED***
