***REMOVED***
***REMOVED***  BVTExploreViewController.m
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/20/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import "BVTExploreViewController.h"

#import "BVTCategoryTableViewController.h"
#import "BVTExploreCollectionViewCell.h"
#import "BVTHeaderTitleView.h"
#import "BVTSubCategoryTableViewController.h"
***REMOVED***
#import "YLPClient+Search.h"
#import "YLPSearch.h"

@interface BVTExploreViewController ()

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

***REMOVED***

static NSArray *cellTitles;
static NSArray *businessesToDisplay;
static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";
static NSString *const kCollectionViewCellNib = @"BVTExploreCollectionViewCell";
static NSString *const kDefaultCellIdentifier = @"Cell";
static NSString *const kShowCategorySegue = @"ShowCategory";
static NSString *const kShowSubCategorySegue = @"ShowSubCategory";

@implementation BVTExploreViewController

#pragma mark - View Life Cycle

- (void)awakeFromNib
***REMOVED***
    [super awakeFromNib];
    
    UINib *nibTitleView = [UINib nibWithNibName:kHeaderTitleViewNib bundle:nil];
    BVTHeaderTitleView *headerTitleView = [[nibTitleView instantiateWithOwner:self options:nil] objectAtIndex:0];
    headerTitleView.centerXConstraint.constant = 0.f;
    
    self.navigationItem.titleView = headerTitleView;
    
    
   
***REMOVED***

- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
    UINib *cellNib = [UINib nibWithNibName:kCollectionViewCellNib bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:kDefaultCellIdentifier];
    
    cellTitles = @[ @"Arts and Museums", @"Cafes and Bakeries", @"Music", @"Hotels, Hostels, Bed & Breakfast", @"Recreation and Attractions", @"Bars and Lounges", @"Restaurants", @"Shopping", @"Tours and Festivals", @"Travel" ];
***REMOVED***

#pragma mark - CollectionView Delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
***REMOVED***
    return 1;
***REMOVED***

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
***REMOVED***
    return cellTitles.count;
***REMOVED***

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    BVTExploreCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kDefaultCellIdentifier forIndexPath:indexPath];
    
    cell.titleLabel.text = [cellTitles objectAtIndex:indexPath.row];
    
    return cell;
***REMOVED***

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    BVTExploreCollectionViewCell *cell = (BVTExploreCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSString *selectionTitle = cell.titleLabel.text;
    
    [self performSegueWithIdentifier:kShowCategorySegue sender:selectionTitle];
***REMOVED***

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
***REMOVED***
    ***REMOVED*** Get destination view
    if ([sender isKindOfClass:[NSString class]])
    ***REMOVED***
        BVTCategoryTableViewController *vc = [segue destinationViewController];
        vc.categoryTitle = sender;
    ***REMOVED***
    else if ([sender isKindOfClass:[NSArray class]])
    ***REMOVED***
        BVTSubCategoryTableViewController *vc = [segue destinationViewController];

        NSArray *array = sender;
        vc.subCategoryTitle = [array firstObject];
        vc.searchResults = [array lastObject];
    ***REMOVED***
***REMOVED***

***REMOVED***
