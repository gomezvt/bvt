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
#import "BVTStyles.h"



@interface BVTExploreViewController () <BVTCategoryTableViewControllerDelegate>

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic) BOOL isLargePhone;

***REMOVED***

static NSArray *businessesToDisplay;
static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";
static NSString *const kCollectionViewCellNib = @"BVTExploreCollectionViewCell";
static NSString *const kShowCategorySegue = @"ShowCategory";
static NSString *const kShowSubCategorySegue = @"ShowSubCategory";

@implementation BVTExploreViewController

- (void)didTapBackWithDetails:(NSMutableDictionary *)details
***REMOVED***
    self.cachedDetails = details;
***REMOVED***

#pragma mark - View Life Cycle

- (void)awakeFromNib
***REMOVED***
    [super awakeFromNib];
    
    UINib *nibTitleView = [UINib nibWithNibName:kHeaderTitleViewNib bundle:nil];
    BVTHeaderTitleView *headerTitleView = [[nibTitleView instantiateWithOwner:self options:nil] objectAtIndex:0];
    headerTitleView.titleViewLabelConstraint.constant = 0.f;
    self.navigationItem.titleView = headerTitleView;
    self.navigationController.navigationBar.barTintColor = [BVTStyles iconGreen];
***REMOVED***

- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
    UINib *cellNib = [UINib nibWithNibName:kCollectionViewCellNib bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"Cell"];
    
    CGRect mainScreen = [[UIScreen mainScreen] bounds];
    if (mainScreen.size.width > 375.f)
    ***REMOVED***
        self.isLargePhone = YES;
        
        [self.collectionView setContentInset:UIEdgeInsetsMake(50.f,10.f,50.f,10.f)];
    ***REMOVED***
    else if (mainScreen.size.width == 375.f)
    ***REMOVED***
        self.isLargePhone = NO;
        
        [self.collectionView setContentInset:UIEdgeInsetsMake(50.f, 5.f, 50.f, 5.f)];
    ***REMOVED***
    else
    ***REMOVED***
        self.isLargePhone = NO;
        
        [self.collectionView setContentInset:UIEdgeInsetsZero];
    ***REMOVED***
***REMOVED***

#pragma mark - CollectionView Delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
***REMOVED***
    return 1;
***REMOVED***

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
***REMOVED***
    return kBVTCategories.count;
***REMOVED***

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    CGSize size;
    if (self.isLargePhone)
    ***REMOVED***
        size = CGSizeMake(100, 150);
    ***REMOVED***
    else
    ***REMOVED***
        size = CGSizeMake(80, 120);
    ***REMOVED***
    return size;
***REMOVED***

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    BVTExploreCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.titleLabel.text = [kBVTCategories objectAtIndex:indexPath.row];
    

    if (self.isLargePhone)
    ***REMOVED***
        cell.imageWidth.constant = 84.f;
        cell.imageHeight.constant = 84.f;
        cell.titleLabel.font = [UIFont systemFontOfSize:15.f];
        [cell.titleLabel sizeToFit];
        
        if (indexPath.row == 0)
        ***REMOVED***
            cell.menuItemView.image = [UIImage imageNamed:@"iMuseum"];
        ***REMOVED***
        else if (indexPath.row == 1)
        ***REMOVED***
            cell.menuItemView.image = [UIImage imageNamed:@"iCoffee"];
        ***REMOVED***
***REMOVED***        else if (indexPath.row == 2)
***REMOVED***        ***REMOVED***
***REMOVED***            cell.menuItemView.image = [UIImage imageNamed:@"iMusic"];
***REMOVED***        ***REMOVED***
        else if (indexPath.row == 2)
        ***REMOVED***
            cell.menuItemView.image = [UIImage imageNamed:@"iHotels"];
        ***REMOVED***
        else if (indexPath.row == 3)
        ***REMOVED***
            cell.menuItemView.image = [UIImage imageNamed:@"iRecreation"];
        ***REMOVED***
        else if (indexPath.row == 4)
        ***REMOVED***
            cell.menuItemView.image = [UIImage imageNamed:@"iBars"];
        ***REMOVED***
        else if (indexPath.row == 5)
        ***REMOVED***
            cell.menuItemView.image = [UIImage imageNamed:@"iEat"];
        ***REMOVED***
        else if (indexPath.row == 6)
        ***REMOVED***
            cell.menuItemView.image = [UIImage imageNamed:@"iShopping"];
        ***REMOVED***
        else if (indexPath.row == 7)
        ***REMOVED***
            cell.menuItemView.image = [UIImage imageNamed:@"iTours"];
        ***REMOVED***
        else if (indexPath.row == 8)
        ***REMOVED***
            cell.menuItemView.image = [UIImage imageNamed:@"iTravel"];
        ***REMOVED***
    ***REMOVED***
    else
    ***REMOVED***
        cell.imageWidth.constant = 64.f;
        cell.imageHeight.constant = 64.f;
        cell.titleLabel.font = [UIFont systemFontOfSize:12.f];
        [cell.titleLabel sizeToFit];
        
        if (indexPath.row == 0)
        ***REMOVED***
            cell.menuItemView.image = [UIImage imageNamed:@"isMuseum"];
        ***REMOVED***
        else if (indexPath.row == 1)
        ***REMOVED***
            cell.menuItemView.image = [UIImage imageNamed:@"isCoffee"];
        ***REMOVED***
***REMOVED***        else if (indexPath.row == 2)
***REMOVED***        ***REMOVED***
***REMOVED***            cell.menuItemView.image = [UIImage imageNamed:@"isMusic"];
***REMOVED***        ***REMOVED***
        else if (indexPath.row == 2)
        ***REMOVED***
            cell.menuItemView.image = [UIImage imageNamed:@"isHotels"];
        ***REMOVED***
        else if (indexPath.row == 3)
        ***REMOVED***
            cell.menuItemView.image = [UIImage imageNamed:@"isRecreation"];
        ***REMOVED***
        else if (indexPath.row == 4)
        ***REMOVED***
            cell.menuItemView.image = [UIImage imageNamed:@"isBars"];
        ***REMOVED***
        else if (indexPath.row == 5)
        ***REMOVED***
            cell.menuItemView.image = [UIImage imageNamed:@"isEat"];
        ***REMOVED***
        else if (indexPath.row == 6)
        ***REMOVED***
            cell.menuItemView.image = [UIImage imageNamed:@"isShopping"];
        ***REMOVED***
        else if (indexPath.row == 7)
        ***REMOVED***
            cell.menuItemView.image = [UIImage imageNamed:@"isTours"];
        ***REMOVED***
        else if (indexPath.row == 8)
        ***REMOVED***
            cell.menuItemView.image = [UIImage imageNamed:@"isTravel"];
        ***REMOVED***
    ***REMOVED***

    
    
    return cell;
***REMOVED***

***REMOVED***- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
***REMOVED******REMOVED***
***REMOVED***    return CGSizeMake(CGRectGetWidth(collectionView.frame), (CGRectGetHeight(collectionView.frame)));
***REMOVED******REMOVED***

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    BVTExploreCollectionViewCell *cell = (BVTExploreCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSString *selectionTitle = cell.titleLabel.text;
    
    [self performSegueWithIdentifier:kShowCategorySegue sender:selectionTitle];
***REMOVED***

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
***REMOVED***
    BVTCategoryTableViewController *vc = [segue destinationViewController];
    vc.categoryTitle = sender;
    vc.delegate = self;
    vc.cachedDetails = self.cachedDetails;
***REMOVED***

***REMOVED***
