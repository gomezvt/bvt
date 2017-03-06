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
    <BVTSurpriseShoppingCartTableViewControllerDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIButton *goButton;
@property (nonatomic, strong) NSMutableArray *mut;

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
    self.mut = [NSMutableArray array];
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
    if (self.subCats.count > 0)
    ***REMOVED***
        isEnabled = YES;
    ***REMOVED***
***REMOVED***    NSArray *selectedCats = [self.selectedCategories allValues];
    
***REMOVED***    for (NSArray *array in selectedCats)
***REMOVED***    ***REMOVED***
***REMOVED***        if (array.count > 0)
***REMOVED***        ***REMOVED***
***REMOVED***            isEnabled = YES;
***REMOVED***            
***REMOVED***            break;
***REMOVED***        ***REMOVED***
***REMOVED***    ***REMOVED***
    
    return isEnabled;
***REMOVED***

#pragma mark - IBActions

- (IBAction)didTapBack:(id)sender
***REMOVED***
    if ([self.delegate respondsToSelector:@selector(didTapBackWithSubCategories:withCategories:)])
    ***REMOVED***
        [self.delegate didTapBackWithSubCategories:self.subCats withCategories:self.selectedCategories];
        [self.navigationController popViewControllerAnimated:YES];
    ***REMOVED***
***REMOVED***

- (void)didTapBackWithSubCategories:(NSMutableArray *)array withCategories:(NSMutableDictionary *)categories
***REMOVED***
    self.subCats = array;
    self.selectedCategories = categories;
***REMOVED***

- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
    if (!self.subCats)
    ***REMOVED***
        self.subCats = [NSMutableArray array];

    ***REMOVED***

    
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
    
    if (cell.accessoryView)
    ***REMOVED***
        if ([self.mut containsObject:category])
        ***REMOVED***
            [self.mut removeObject:category];

        ***REMOVED***
        
        if ([self.subCats containsObject:category])
        ***REMOVED***
            [self.subCats removeObject:category];

        ***REMOVED***
        cell.accessoryView = nil;
    ***REMOVED***
    else
    ***REMOVED***
        UIImageView *checkView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:kCheckMarkGraphic]];
        cell.accessoryView = checkView;
        [self.mut addObject:category];
        [self.subCats addObject:category];
    ***REMOVED***

    
    
    NSDictionary *dict = [NSDictionary dictionaryWithObject:self.mut forKey:self.categoryTitle];
    [self.selectedCategories addEntriesFromDictionary:dict];

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
    vc.selectedCategories = self.selectedCategories;
    vc.subCats = self.subCats;
    vc.delegate = self;
***REMOVED***

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSString *title = [categories objectAtIndex:indexPath.row];
    cell.textLabel.text = title;
    cell.textLabel.numberOfLines = 0;
    
    NSArray *array = [self.selectedCategories allValues];
    NSString *btitle = [[array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self CONTAINS[c] %@", title]] lastObject];
    if (!btitle)
    ***REMOVED***
        cell.accessoryView = nil;
    ***REMOVED***
    else
    ***REMOVED***
        UIImageView *checkView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green_check"]];
        cell.accessoryView = checkView;
    ***REMOVED***
    

    return cell;
***REMOVED***
***REMOVED***
