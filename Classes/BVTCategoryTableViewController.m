***REMOVED***
***REMOVED***  BVTCategoryTableViewController.m
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/20/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import "BVTCategoryTableViewController.h"

#import "BVTHeaderTitleView.h"
#import "BVTSubCategoryTableViewController.h"
#import "BVTStyles.h"
***REMOVED***

#import "YLPClient+Search.h"
#import "YLPSortType.h"
#import "YLPSearch.h"
#import "YLPBusiness.h"
#import "BVTHUDView.h"
#import "BVTStyles.h"


@interface BVTCategoryTableViewController ()
<BVTHUDViewDelegate, BVTSubCategoryTableViewControllerDelegate>

@property (nonatomic, strong) BVTHUDView *hud;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *backChevron;
@property (nonatomic) BOOL didCancelRequest;


***REMOVED***

static NSArray *categories;
static NSArray *businessesToDisplay;
static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";
static NSString *const kShowSubCategorySegue = @"ShowSubCategory";

@implementation BVTCategoryTableViewController

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

- (void)didTapBackWithDetails:(NSMutableDictionary *)details
***REMOVED***
    self.cachedDetails = details;
***REMOVED***

- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 50.f, 0);
    
    self.tableView.tableFooterView = [UIView new];
    
    categories = @[ ];
    
    self.titleLabel.text = self.categoryTitle;
    
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
***REMOVED***

- (void)didTapHUDCancelButton
***REMOVED***
    self.didCancelRequest = YES;
    self.backChevron.enabled = YES;
    self.tableView.userInteractionEnabled = YES;
    self.tabBarController.tabBar.userInteractionEnabled = YES;
    [self.hud removeFromSuperview];
***REMOVED***

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
***REMOVED***
    self.hud = [BVTHUDView hudWithView:self.navigationController.view];
    self.hud.delegate = self;
    self.didCancelRequest = NO;
    
    self.tableView.userInteractionEnabled = NO;
    self.tabBarController.tabBar.userInteractionEnabled = NO;

    self.backChevron.enabled = NO;
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *selectionTitle = cell.textLabel.text;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    __weak typeof(self) weakSelf = self;
    [[AppDelegate yelp] searchWithLocation:@"Burlington, VT" term:selectionTitle limit:50 offset:0 sort:YLPSortTypeDistance completionHandler:^
     (YLPSearch *searchResults, NSError *error)***REMOVED***
         dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
             ***REMOVED*** code here
             NSString *string = error.userInfo[@"NSLocalizedDescription"];
             
             if ([string isEqualToString:@"The Internet connection appears to be offline."])
             ***REMOVED***
                 [weakSelf _hideHUD];
                 
                 UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"No Internet" message:@"Check your connection and try again" preferredStyle:UIAlertControllerStyleAlert];
                 
                 UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                 [alertController addAction:ok];
                 
                 [weakSelf presentViewController:alertController animated:YES completion:nil];
                 
             ***REMOVED***
             else if (searchResults.businesses.count == 0)
             ***REMOVED***
                 [weakSelf _hideHUD];
                 
                 UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"No search results found" message:@"Please select another category" preferredStyle:UIAlertControllerStyleAlert];
                 
                 UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                 [alertController addAction:ok];
                 
                 [weakSelf presentViewController:alertController animated:YES completion:nil];
                 
             ***REMOVED***
             else if (searchResults.businesses.count > 0)
             ***REMOVED***
                 NSMutableArray *filteredArray = [NSMutableArray array];
                 for (YLPBusiness *biz in searchResults.businesses)
                 ***REMOVED***
                     if ([[biz.categories filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"name = %@", selectionTitle]] lastObject] && biz.closed == NO)
                     ***REMOVED***
                         if (filteredArray.count > 0)
                         ***REMOVED***
                             if (![filteredArray containsObject:biz])
                             ***REMOVED***
                                 [filteredArray addObject:biz];
                             ***REMOVED***
                         ***REMOVED***
                         else
                         ***REMOVED***
                             [filteredArray addObject:biz];

                         ***REMOVED***
                     ***REMOVED***
                 ***REMOVED***
                 
                 if (filteredArray.count > 0)
                 ***REMOVED***
                     NSArray *descriptor = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
                     NSArray *sortedArray = [filteredArray sortedArrayUsingDescriptors:descriptor];
                    
                     BVTSubCategoryTableViewController *subCat = [weakSelf.storyboard instantiateViewControllerWithIdentifier:@"SubCat"];
                     subCat.subCategoryTitle = selectionTitle;
                     subCat.filteredResults = sortedArray;
                     subCat.cachedDetails = weakSelf.cachedDetails;
                     subCat.delegate = weakSelf;
                     
                     if (!weakSelf.didCancelRequest)
                     ***REMOVED***
                         [weakSelf _hideHUD];

                         [weakSelf.navigationController pushViewController:subCat animated:YES];
                     ***REMOVED***
                 ***REMOVED***
                 else
                 ***REMOVED***
                     [weakSelf _hideHUD];
                     
                     UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"No results match the selected category" message:@"Please select another category" preferredStyle:UIAlertControllerStyleAlert];
                     
                     UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                     [alertController addAction:ok];
                     
                     [weakSelf presentViewController:alertController animated:YES completion:nil];
                 ***REMOVED***
             ***REMOVED***
         ***REMOVED***);
     ***REMOVED***];
***REMOVED***

- (void)_hideHUD
***REMOVED***
    self.backChevron.enabled = YES;
    self.tableView.userInteractionEnabled = YES;
    self.tabBarController.tabBar.userInteractionEnabled = YES;

    [self.hud removeFromSuperview];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [categories objectAtIndex:indexPath.row];
    
    return cell;
***REMOVED***

#pragma mark - IBActions

- (IBAction)didTapBack:(id)sender
***REMOVED***
    if ([self.delegate respondsToSelector:@selector(didTapBackWithDetails:)])
    ***REMOVED***
        [self.delegate didTapBackWithDetails:self.cachedDetails];
    ***REMOVED***
    [self.navigationController popViewControllerAnimated:YES];
***REMOVED***

***REMOVED***
