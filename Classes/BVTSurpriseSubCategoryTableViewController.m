//
//  BVTSurpriseCategoryTableViewController.m
//  bvt
//
//  Created by Greg on 2/23/17.
//  Copyright © 2017 gms. All rights reserved.
//

#import "BVTSurpriseSubCategoryTableViewController.h"

#import "BVTSurpriseShoppingCartTableViewController.h"
#import "BVTHeaderTitleView.h"
#import "BVTStyles.h"
#import "BVTPresentationTableViewController.h"
@import GoogleMobileAds;

@interface BVTSurpriseSubCategoryTableViewController ()
    <BVTSurpriseShoppingCartTableViewControllerDelegate,
     UIPopoverPresentationControllerDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIButton *goButton;
@property (nonatomic, strong) NSMutableArray *mut;

@end

static NSArray *categories;

static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";
static NSString *const kShowShoppingCartSegue = @"ShowShoppingCart";
static NSString *const kCheckMarkGraphic = @"green_check";

@implementation BVTSurpriseSubCategoryTableViewController

- (void)didRemoveObjectsFromArray:(NSArray *)array
{
    self.mut = [array mutableCopy];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    UINib *nibTitleView = [UINib nibWithNibName:kHeaderTitleViewNib bundle:nil];
    BVTHeaderTitleView *headerTitleView = [[nibTitleView instantiateWithOwner:self options:nil] objectAtIndex:0];
    headerTitleView.titleViewLabelConstraint.constant = -20.f;
    self.navigationItem.titleView = headerTitleView;
    self.navigationController.navigationBar.barTintColor = [BVTStyles iconGreen];
}

- (void)prepareForPopoverPresentation:(UIPopoverPresentationController *)popoverPresentationController;
{
    //
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController: (UIPresentationController * ) controller
{
    return UIModalPresentationNone;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSArray *previousValues = [self.catDict objectForKey:self.categoryTitle];
    if (previousValues.count > 0)
    {
        self.mut = [previousValues mutableCopy];
    }
    
    // Reload table either way, especially in the case if we come back from
    // shopping cart after all items have been deleted and we need to clear checkmarks
    [self.tableView reloadData];
    
    [self.goButton setEnabled:[self evaluateButtonState]];
    if (self.goButton.enabled)
    {
        [self.goButton.layer setBorderColor:[[BVTStyles iconGreen] CGColor]];
    }
    else
    {
        [self.goButton.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    }
}

- (BOOL)evaluateButtonState
{
    BOOL isEnabled = NO;
    NSArray *allValues = [self.catDict allValues];
    for (NSArray *array in allValues)
    {
        if (array.count > 0)
        {
            isEnabled = YES;
            break;
        }
    }
    
    return isEnabled;
}

#pragma mark - IBActions

- (IBAction)didTapBack:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(didTapBackWithCategories:)])
    {
        [self.delegate didTapBackWithCategories:self.catDict];
    }
    
    if ([self.delegate respondsToSelector:@selector(didTapBackWithDetails:)])
    {
        [self.delegate didTapBackWithDetails:self.cachedDetails];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didTapBackWithCategories:(NSMutableDictionary *)categories
{
    self.catDict = categories;
}

- (void)viewDidLoad
{

    self.tableView.tableFooterView = [UIView new];

    CALayer * layer = [self.goButton layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:10.0];
    [layer setBorderWidth:1.0];
    [layer setBorderColor:[[BVTStyles iconGreen] CGColor]];
    
    [super viewDidLoad];
    
    if (!self.mut)
    {
        self.mut = [NSMutableArray array];
    }
    
    if (!self.catDict)
    {
        self.catDict = [[NSMutableDictionary alloc] init];
    }
    
    categories = @[ ];
    
    if ([self.categoryTitle isEqualToString:@"Arts, Museums, & Music"])
    {
        categories = kArtsMuseums;
    }
    else if ([self.categoryTitle isEqualToString:@"Coffee, Sweets, & Bakeries"])
    {
        categories = kCoffeeSweetsBakeries;
    }
//    else if ([self.categoryTitle isEqualToString:@"Music"])
//    {
//        categories = kMusic;
//    }
    else if ([self.categoryTitle isEqualToString:@"Hotels, Hostels, Bed & Breakfast"])
    {
        categories = kHotelsHostelsBB;
    }
    else if ([self.categoryTitle isEqualToString:@"Entertainment & Recreation"])
    {
        categories = kEntertainmentRecreation;
    }
    else if ([self.categoryTitle isEqualToString:@"Bars & Lounges"])
    {
        categories = kBarsLounges;
    }
    else if ([self.categoryTitle isEqualToString:@"Restaurants"])
    {
        categories = kRestaurants;
    }
    else if ([self.categoryTitle isEqualToString:@"Shopping"])
    {
        categories = kShopping;
    }
    else if ([self.categoryTitle isEqualToString:@"Tours & Festivals"])
    {
        categories = kToursFestivals;
    }
    else
    {
        // Travel
        categories = kTravel;
    }
    
    self.tableView.estimatedRowHeight = 44.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.goButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    

    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *category = [categories objectAtIndex:indexPath.row];
    if (cell.accessoryView)
    {
        [self.mut removeObject:category];
        cell.accessoryView = nil;
    }
    else
    {
        UIImageView *checkView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:kCheckMarkGraphic]];
        cell.accessoryView = checkView;
        [self.mut addObject:category];
    }
    
    self.catDict[self.categoryTitle] = self.mut;
    [self.goButton setEnabled:[self evaluateButtonState]];
    if (self.goButton.enabled)
    {
        [self.goButton.layer setBorderColor:[[BVTStyles iconGreen] CGColor]];
    }
    else
    {
        [self.goButton.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    }
}

- (IBAction)didTapButton:(id)sender
{
    // Not wired directly from button as this will cause a double presentation
    [self performSegueWithIdentifier:kShowShoppingCartSegue sender:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return categories.count;
}

- (void)didTapBackWithDetails:(NSMutableArray *)details
{
    
    self.cachedDetails = details;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get destination view
    BVTSurpriseShoppingCartTableViewController *vc = [segue destinationViewController];
    vc.catDict = self.catDict;
    vc.delegate = self;
    vc.cachedDetails = self.cachedDetails;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSString *title = [categories objectAtIndex:indexPath.row];
    cell.textLabel.text = title;
    cell.textLabel.numberOfLines = 0;
    
    NSArray *array = [self.catDict valueForKey:self.categoryTitle];
    NSString *btitle = [[array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self == %@", title]] lastObject];
    if (!btitle)
    {
        cell.accessoryView = nil;
    }
    else
    {
        UIImageView *checkView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:kCheckMarkGraphic]];
        cell.accessoryView = checkView;
    }
    
    return cell;
}
@end
