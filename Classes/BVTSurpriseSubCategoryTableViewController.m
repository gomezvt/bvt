***REMOVED***
***REMOVED***  BVTSurpriseCategoryTableViewController.m
***REMOVED***  bvt
***REMOVED***
***REMOVED***  Created by Greg on 2/23/17.
***REMOVED***  Copyright © 2017 gms. All rights reserved.
***REMOVED***

#import "BVTSurpriseSubCategoryTableViewController.h"

#import "BVTSurpriseShoppingCartTableViewController.h"
#import "BVTHeaderTitleView.h"
#import "BVTStyles.h"

@interface BVTSurpriseSubCategoryTableViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIButton *goButton;
***REMOVED***@property (nonatomic, strong) NSDictionary *dict;
@property (nonatomic, strong) NSMutableArray *subCats;

***REMOVED***

static NSArray *categories;

static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";
static NSString *const kShowShoppingCartSegue = @"ShowShoppingCart";
static NSString *const kCheckMarkGraphic = @"green_check";

@implementation BVTSurpriseSubCategoryTableViewController

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
    
***REMOVED***    self.dict = [NSDictionary dictionary];
    
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
***REMOVED***        self.dict = [NSDictionary dictionaryWithObject:self.subCats forKey:self.categoryTitle];
***REMOVED***        [self.selectedCategories addEntriesFromDictionary:self.dict];

        
        [self.delegate didTapBackChevron:sender withCategories:self.selectedCategories];
        [self.navigationController popViewControllerAnimated:YES];
    ***REMOVED***
***REMOVED***

- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
    self.subCats = [NSMutableArray array];

    
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
***REMOVED***    if (!cell.accessoryView)
***REMOVED***    ***REMOVED***
        checkView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:kCheckMarkGraphic]];
        [self.subCats addObject:category];
***REMOVED***    ***REMOVED***
***REMOVED***    else
***REMOVED***    ***REMOVED***
***REMOVED***        [self.subCats removeObject:category];
***REMOVED***        cell.accessoryView = nil;
***REMOVED***    ***REMOVED***
    cell.accessoryView = checkView;
    
    
    NSDictionary *dict = [NSDictionary dictionaryWithObject:self.subCats forKey:self.categoryTitle];
    [self.selectedCategories addEntriesFromDictionary:dict];

    [self.goButton setEnabled:[self evaluateButtonState]];
***REMOVED***

- (IBAction)didTapButton:(id)sender
***REMOVED***
***REMOVED***    self.dict = [NSDictionary dictionaryWithObject:self.subCats forKey:self.categoryTitle];
***REMOVED***    [self.selectedCategories addEntriesFromDictionary:self.dict];


***REMOVED***    [self.selectedCategories addObject:self.dict];
    
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
    

***REMOVED***    [self.selectedCategories addObject:self.dict];
    
    vc.selectedCategories = self.selectedCategories;
***REMOVED***

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSString *title = [categories objectAtIndex:indexPath.row];
    cell.textLabel.text = title;
    cell.textLabel.numberOfLines = 0;
    
    UIImageView *checkView;
    if (![self.selectedCategories objectForKey:title])
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
