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

- (void)didClearShoppingCart
***REMOVED***
    [self.mut removeAllObjects];
***REMOVED***

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
    
    ***REMOVED*** Reload table either way, especially in the case if we come back from
    ***REMOVED*** shopping cart after all items have been deleted and we need to clear checkmarks
    [self.tableView reloadData];
    
    [self.goButton setEnabled:[self evaluateButtonState]];
***REMOVED***

- (BOOL)evaluateButtonState
***REMOVED***
    BOOL isEnabled = NO;
    NSArray *allValues = [self.catDict allValues];
    for (NSArray *array in allValues)
    ***REMOVED***
        if (array.count > 0)
        ***REMOVED***
            isEnabled = YES;
            break;
        ***REMOVED***
    ***REMOVED***

    return isEnabled;
***REMOVED***

#pragma mark - IBActions

- (IBAction)didTapBack:(id)sender
***REMOVED***
    if ([self.delegate respondsToSelector:@selector(didTapBackWithCategories:)])
    ***REMOVED***
        [self.delegate didTapBackWithCategories:self.catDict];
        [self.navigationController popViewControllerAnimated:YES];
    ***REMOVED***
***REMOVED***

- (void)didTapBackWithCategories:(NSMutableDictionary *)categories
***REMOVED***
    self.catDict = self.catDict;
***REMOVED***

- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
    if (!self.mut)
    ***REMOVED***
        self.mut = [NSMutableArray array];
    ***REMOVED***
    
    if (!self.catDict)
    ***REMOVED***
        self.catDict = [[NSMutableDictionary alloc] init];
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
    [self.goButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];

***REMOVED***

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSArray *previousValues = [self.catDict objectForKey:self.categoryTitle];
    if (previousValues.count > 0)
    ***REMOVED***
        self.mut = [previousValues mutableCopy];
    ***REMOVED***
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *category = [categories objectAtIndex:indexPath.row];    
    if (cell.accessoryView)
    ***REMOVED***
        [self.mut removeObject:category];
        cell.accessoryView = nil;
    ***REMOVED***
    else
    ***REMOVED***
        UIImageView *checkView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:kCheckMarkGraphic]];
        cell.accessoryView = checkView;
        [self.mut addObject:category];
    ***REMOVED***

    self.catDict[self.categoryTitle] = self.mut;
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
    vc.catDict = self.catDict;
    vc.delegate = self;
***REMOVED***

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSString *title = [categories objectAtIndex:indexPath.row];
    cell.textLabel.text = title;
    cell.textLabel.numberOfLines = 0;
    
    NSArray *array = [self.catDict allValues];
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
