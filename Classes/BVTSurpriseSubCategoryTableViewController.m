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
#import "BVTPresentationTableViewController.h"

@interface BVTSurpriseSubCategoryTableViewController ()
    <BVTSurpriseShoppingCartTableViewControllerDelegate,
     UIPopoverPresentationControllerDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIButton *goButton;
@property (nonatomic, strong) NSMutableArray *mut;

***REMOVED***

static NSArray *categories;

static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";
static NSString *const kShowShoppingCartSegue = @"ShowShoppingCart";
static NSString *const kCheckMarkGraphic = @"green_check";

@implementation BVTSurpriseSubCategoryTableViewController

- (void)didRemoveObjectsFromArray:(NSArray *)array
***REMOVED***
    self.mut = [array mutableCopy];
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

- (void)prepareForPopoverPresentation:(UIPopoverPresentationController *)popoverPresentationController;
***REMOVED***
    ***REMOVED***
***REMOVED***

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController: (UIPresentationController * ) controller
***REMOVED***
    return UIModalPresentationNone;
***REMOVED***

- (void)viewWillAppear:(BOOL)animated
***REMOVED***
    [super viewWillAppear:animated];
    
    NSArray *previousValues = [self.catDict objectForKey:self.categoryTitle];
    if (previousValues.count > 0)
    ***REMOVED***
        self.mut = [previousValues mutableCopy];
    ***REMOVED***
    
    ***REMOVED*** Reload table either way, especially in the case if we come back from
    ***REMOVED*** shopping cart after all items have been deleted and we need to clear checkmarks
    [self.tableView reloadData];
    
    [self.goButton setEnabled:[self evaluateButtonState]];
    if (self.goButton.enabled)
    ***REMOVED***
        [self.goButton.layer setBorderColor:[[BVTStyles iconGreen] CGColor]];
    ***REMOVED***
    else
    ***REMOVED***
        [self.goButton.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    ***REMOVED***
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
    ***REMOVED***
    
    if ([self.delegate respondsToSelector:@selector(didTapBackWithDetails:)])
    ***REMOVED***
        [self.delegate didTapBackWithDetails:self.cachedDetails];
    ***REMOVED***
    
    [self.navigationController popViewControllerAnimated:YES];
***REMOVED***

- (void)didTapBackWithCategories:(NSMutableDictionary *)categories
***REMOVED***
    self.catDict = categories;
***REMOVED***

- (void)viewDidLoad
***REMOVED***
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 50.f, 0);

    self.tableView.tableFooterView = [UIView new];

    CALayer * layer = [self.goButton layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:10.0];
    [layer setBorderWidth:1.0];
    [layer setBorderColor:[[BVTStyles iconGreen] CGColor]];
    
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
    
    if ([self.categoryTitle isEqualToString:@"Arts, Museums, & Music"])
    ***REMOVED***
        categories = kArtsMuseums;
    ***REMOVED***
    else if ([self.categoryTitle isEqualToString:@"Coffee, Sweets, & Bakeries"])
    ***REMOVED***
        categories = kCoffeeSweetsBakeries;
    ***REMOVED***
***REMOVED***    else if ([self.categoryTitle isEqualToString:@"Music"])
***REMOVED***    ***REMOVED***
***REMOVED***        categories = kMusic;
***REMOVED***    ***REMOVED***
    else if ([self.categoryTitle isEqualToString:@"Hotels, Hostels, Bed & Breakfast"])
    ***REMOVED***
        categories = kHotelsHostelsBB;
    ***REMOVED***
    else if ([self.categoryTitle isEqualToString:@"Entertainment & Recreation"])
    ***REMOVED***
        categories = kEntertainmentRecreation;
    ***REMOVED***
    else if ([self.categoryTitle isEqualToString:@"Bars & Lounges"])
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
    else if ([self.categoryTitle isEqualToString:@"Tours & Festivals"])
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
    if (self.goButton.enabled)
    ***REMOVED***
        [self.goButton.layer setBorderColor:[[BVTStyles iconGreen] CGColor]];
    ***REMOVED***
    else
    ***REMOVED***
        [self.goButton.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    ***REMOVED***
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

- (void)didTapBackWithDetails:(NSMutableArray *)details
***REMOVED***
    
    self.cachedDetails = details;
***REMOVED***

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
***REMOVED***
    ***REMOVED*** Get destination view
    BVTSurpriseShoppingCartTableViewController *vc = [segue destinationViewController];
    vc.catDict = self.catDict;
    vc.delegate = self;
    vc.cachedDetails = self.cachedDetails;
***REMOVED***

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSString *title = [categories objectAtIndex:indexPath.row];
    cell.textLabel.text = title;
    cell.textLabel.numberOfLines = 0;
    
    NSArray *array = [self.catDict valueForKey:self.categoryTitle];
    NSString *btitle = [[array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self == %@", title]] lastObject];
    if (!btitle)
    ***REMOVED***
        cell.accessoryView = nil;
    ***REMOVED***
    else
    ***REMOVED***
        UIImageView *checkView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:kCheckMarkGraphic]];
        cell.accessoryView = checkView;
    ***REMOVED***
    
    return cell;
***REMOVED***
***REMOVED***
