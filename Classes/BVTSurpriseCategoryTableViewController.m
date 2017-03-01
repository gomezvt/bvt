***REMOVED***
***REMOVED***  BVTSurpriseCategoryTableViewController.m
***REMOVED***  bvt
***REMOVED***
***REMOVED***  Created by Greg on 2/23/17.
***REMOVED***  Copyright © 2017 gms. All rights reserved.
***REMOVED***

#import "BVTSurpriseCategoryTableViewController.h"

#import "BVTSurpriseShoppingCartTableViewController.h"
#import "BVTHeaderTitleView.h"
#import "BVTStyles.h"

@interface BVTSurpriseCategoryTableViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIButton *goButton;

***REMOVED***

static NSArray *categories;

static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";
static NSString *const kShowShoppingCartSegue = @"ShowShoppingCart";
static NSString *const kCheckMarkGraphic = @"green_check";

@implementation BVTSurpriseCategoryTableViewController

- (void)awakeFromNib
***REMOVED***
    [super awakeFromNib];
    
    UINib *nibTitleView = [UINib nibWithNibName:kHeaderTitleViewNib bundle:nil];
    BVTHeaderTitleView *headerTitleView = [[nibTitleView instantiateWithOwner:self options:nil] objectAtIndex:0];
    headerTitleView.titleViewLabelConstraint.constant = -20.f;
    self.navigationItem.titleView = headerTitleView;
    self.navigationController.navigationBar.barTintColor = [BVTStyles iconGreen];
***REMOVED***

- (void)viewWillAppear:(BOOL)animated
***REMOVED***
    [super viewWillAppear:animated];
    
    [self.goButton setEnabled:[self evaluateButtonState]];
***REMOVED***

- (BOOL)evaluateButtonState
***REMOVED***
    BOOL isEnabled = NO;
    
    if (self.selectedCategories.count > 0)
    ***REMOVED***
        isEnabled = YES;
    ***REMOVED***
    
    return isEnabled;
***REMOVED***

#pragma mark - IBActions

- (IBAction)didTapBack:(id)sender
***REMOVED***
    if ([self.delegate respondsToSelector:@selector(didTapBackChevron:withCategories:)])
    ***REMOVED***
        [self.delegate didTapBackChevron:sender withCategories:self.selectedCategories];
        [self.navigationController popViewControllerAnimated:YES];
    ***REMOVED***
***REMOVED***

- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
    categories = @[ ];
        
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
    
    self.tableView.estimatedRowHeight = 44.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
***REMOVED***

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSString *category = [categories objectAtIndex:indexPath.row];
    UIImageView *checkView;
***REMOVED***    NSString *fullCat = [NSString stringWithFormat:@"%@: %@", self.categoryTitle, category];
    if (!cell.accessoryView)
    ***REMOVED***
        checkView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:kCheckMarkGraphic]];
        [self.selectedCategories addObject:category];
    ***REMOVED***
    else
    ***REMOVED***
        [self.selectedCategories removeObject:category];
        cell.accessoryView = nil;
    ***REMOVED***
    cell.accessoryView = checkView;

    [self.goButton setEnabled:[self evaluateButtonState]];
***REMOVED***

- (IBAction)didTapButton:(id)sender
***REMOVED***
    ***REMOVED*** Not wired directly from button as this will cause a double presentation
    [self performSegueWithIdentifier:kShowShoppingCartSegue sender:nil];
***REMOVED***

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
***REMOVED***
    return 1;
***REMOVED***

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
***REMOVED***
    return categories.count;
***REMOVED***

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
***REMOVED***
    ***REMOVED*** Get destination view
    BVTSurpriseShoppingCartTableViewController *vc = [segue destinationViewController];
    
    NSDictionary *selectedCategories = [NSDictionary dictionaryWithObject:self.selectedCategories forKey:self.categoryTitle];
    vc.selectedCategories = selectedCategories;
***REMOVED***

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSString *title = [categories objectAtIndex:indexPath.row];
    cell.textLabel.text = title;
    cell.textLabel.numberOfLines = 0;
    
    UIImageView *checkView;
***REMOVED***    NSString *fullCat = [NSString stringWithFormat:@"%@: %@", self.categoryTitle, title];

    if (![self.selectedCategories containsObject:title])
    ***REMOVED***
        checkView = nil;
    ***REMOVED***
    else
    ***REMOVED***
        checkView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green_check"]];
    ***REMOVED***
    
    cell.accessoryView = checkView;

    return cell;
***REMOVED***
***REMOVED***
