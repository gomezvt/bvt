***REMOVED***
***REMOVED***  BVTCategoryTableViewController.m
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/20/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import "BVTSearchTableViewController.h"

#import "BVTHeaderTitleView.h"
#import "BVTSubCategoryTableViewController.h"
#import "BVTStyles.h"
***REMOVED***
#import "YLPBusinessReviews.h"
#import "YLPClient+Reviews.h"
#import "YLPReview.h"
#import "YLPUser.h"
#import "YLPClient+Search.h"
#import "YLPSortType.h"
#import "YLPSearch.h"
#import "YLPBusiness.h"
#import "BVTHUDView.h"
#import "BVTStyles.h"
#import "BVTThumbNailTableViewCell.h"
#import "YLPClient+Business.h"
#import "BVTDetailTableViewController.h"

***REMOVED***#import "BVTHeaderTitleView.h"
***REMOVED***#import "BVTStyles.h"
***REMOVED***#import "YLPBusiness.h"
***REMOVED***#import "BVTThumbNailTableViewCell.h"
***REMOVED***#import "BVTHUDView.h"
***REMOVED******REMOVED***
***REMOVED***#import "YLPReview.h"
***REMOVED***#import "YLPUser.h"
***REMOVED***#import "YLPBusinessReviews.h"
***REMOVED***#import "YLPClient+Reviews.h"
***REMOVED***#import "YLPClient+Business.h"
***REMOVED***#import "BVTDetailTableViewController.h"
***REMOVED***#import "BVTTableViewSectionHeaderView.h"
***REMOVED***#import "BVTThumbNailTableViewCell.h"

@interface BVTSearchTableViewController ()
<BVTHUDViewDelegate>

@property (nonatomic, strong) BVTHUDView *hud;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic) BOOL didCancelRequest;
@property (nonatomic, strong) NSMutableArray *recentSearches;
@property (nonatomic, weak) IBOutlet UILabel *label;
@property (nonatomic, weak) IBOutlet UISearchBar *searchBar;
@property (nonatomic, weak) IBOutlet UIView *titleView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIView *sortView;
@property (nonatomic, weak) IBOutlet UIButton *starButton;

@property (nonatomic, weak) IBOutlet UIButton *priceButton;
@property (nonatomic, weak) IBOutlet UIButton *distanceButton;
@property (nonatomic, weak) IBOutlet UIButton *openNowButton;
@property (nonatomic) double milesKeyValue;
@property (nonatomic, strong) NSString *priceKeyValue;
@property (nonatomic, strong) NSString *openCloseKeyValue;
@property (nonatomic) BOOL gotDetails;
***REMOVED***@property (nonatomic, strong) NSArray *arrayForSorting;
@property (nonatomic, strong) NSMutableArray *originalDetailsArray;
@property (nonatomic) BOOL isLargePhone;
@property (nonatomic) BOOL didSelectBiz;

@property (nonatomic, strong) NSMutableArray *cachedBiz;
***REMOVED***@property (nonatomic, strong) NSOperationQueue *queue;
***REMOVED***@property (nonatomic, strong) NSBlockOperation *block;
***REMOVED***

static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";
static NSString *const kThumbNailCell = @"BVTThumbNailTableViewCell";
static NSString *const kShowDetailSegue = @"ShowDetail";
static NSString *const kTableViewSectionHeaderView = @"BVTTableViewSectionHeaderView";

@implementation BVTSearchTableViewController

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

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar;
***REMOVED***
    searchBar.showsCancelButton = YES;
    
***REMOVED***

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar;
***REMOVED***
    searchBar.showsCancelButton = NO;
***REMOVED***

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar;
***REMOVED***
    searchBar.showsCancelButton = NO;
    searchBar.text = @"";
    [searchBar resignFirstResponder];
***REMOVED***

- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
***REMOVED***    self.queue = [[NSOperationQueue alloc] init];
    self.cachedBiz = [[NSMutableArray alloc] init];
***REMOVED***    self.block = [[NSBlockOperation alloc] init];
***REMOVED***    [self.queue addOperation:self.block];



    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;

    
    CGRect mainScreen = [[UIScreen mainScreen] bounds];
    NSLog(@"HEIGHT %f. WIDTH %f", mainScreen.size.height, mainScreen.size.width);
    
    if (mainScreen.size.width > 375.f)
    ***REMOVED***
        self.isLargePhone = YES;
    ***REMOVED***
    else
    ***REMOVED***
        self.isLargePhone = NO;
    ***REMOVED***

    
    AppDelegate *appDel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if (!appDel.userLocation)
    ***REMOVED***
        [self.distanceButton setHidden:YES];
    ***REMOVED***
    else
    ***REMOVED***
        [self.distanceButton setHidden:NO];
    ***REMOVED***
    
    CALayer * layer = [self.priceButton layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:10.0];
    [layer setBorderWidth:1.0];
    [layer setBorderColor:[[BVTStyles iconGreen] CGColor]];
    
    CALayer * layer2 = [self.distanceButton layer];
    [layer2 setMasksToBounds:YES];
    [layer2 setCornerRadius:10.0];
    [layer2 setBorderWidth:1.0];
    [layer2 setBorderColor:[[BVTStyles iconGreen] CGColor]];
    
    CALayer * layer3 = [self.openNowButton layer];
    [layer3 setMasksToBounds:YES];
    [layer3 setCornerRadius:10.0];
    [layer3 setBorderWidth:1.0];
    [layer3 setBorderColor:[[BVTStyles iconGreen] CGColor]];

    
    self.starButton.hidden = YES;
    self.sortView.hidden = YES;
    self.titleView.hidden = YES;
    [self.view bringSubviewToFront:self.label];
    
    UINib *cellNib = [UINib nibWithNibName:kThumbNailCell bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"Cell"];
    
    self.tableView.estimatedRowHeight = 44.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    if (self.recentSearches.count == 0)
    ***REMOVED***
        self.label.text = @"Go ahead, search away...";
    ***REMOVED***
 
    self.tableView.estimatedRowHeight = 44.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.tableFooterView = [UIView new];
***REMOVED***

- (void)didTapHUDCancelButton
***REMOVED***
    dispatch_async(dispatch_get_main_queue(), ^***REMOVED***

    self.didCancelRequest = YES;
    self.searchBar.userInteractionEnabled = YES;
    self.tableView.userInteractionEnabled = YES;
    self.tabBarController.tabBar.userInteractionEnabled = YES;


    [self.hud removeFromSuperview];
    ***REMOVED***);
***REMOVED***

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
***REMOVED***
    self.didSelectBiz = NO;
    if ([segue.identifier isEqualToString:kShowDetailSegue])
    ***REMOVED***
        ***REMOVED*** Get destination view
        BVTDetailTableViewController *vc = [segue destinationViewController];
        vc.selectedBusiness = sender;
    ***REMOVED***
***REMOVED***


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;
***REMOVED***
    self.hud = [BVTHUDView hudWithView:self.navigationController.view];
    self.hud.delegate = self;
    self.gotDetails = NO;
    
    dispatch_async(dispatch_get_main_queue(), ^***REMOVED***

    self.tableView.userInteractionEnabled = NO;
    self.tabBarController.tabBar.userInteractionEnabled = NO;
    self.searchBar.userInteractionEnabled = NO;
        
        [searchBar resignFirstResponder];
        searchBar.showsCancelButton = NO;
    ***REMOVED***);

    __weak typeof(self) weakSelf = self;
    [[AppDelegate sharedClient] searchWithLocation:@"Burlington, VT" term:searchBar.text limit:50 offset:0 sort:YLPSortTypeDistance completionHandler:^
     (YLPSearch *searchResults, NSError *error)***REMOVED***
         dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
             ***REMOVED*** code here
             NSString *string = error.userInfo[@"NSLocalizedDescription"];
             
             if ([string isEqualToString:@"The Internet connection appears to be offline."])
             ***REMOVED***
                 [weakSelf _hideHUD];
                 
                 UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
                 
                 UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                 [alertController addAction:ok];
                 
                 [weakSelf presentViewController:alertController animated:YES completion:nil];
                 
             ***REMOVED***
             else if (searchResults.businesses.count == 0)
             ***REMOVED***
                 [weakSelf _hideHUD];
                 
                 [weakSelf.recentSearches removeAllObjects];
                 [weakSelf.tableView reloadData];
                 weakSelf.label.text = @"No search results found.";
                 weakSelf.titleLabel.text = [NSString stringWithFormat:@"Recent Search Results (0)"];
                 
             ***REMOVED***
             else if (searchResults.businesses.count > 0)
             ***REMOVED***
                 [weakSelf _hideHUD];
                 
                 weakSelf.label.text = @"";
                 weakSelf.titleLabel.text = [NSString stringWithFormat:@"Recent Search Results (%lu)", (unsigned long)searchResults.businesses.count];
                 
                 weakSelf.starButton.hidden = NO;
                 weakSelf.sortView.hidden = NO;
                 weakSelf.titleView.hidden = NO;
                 
                 NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
                 NSArray *sortedArray = [searchResults.businesses sortedArrayUsingDescriptors: @[descriptor]];
                 
                 weakSelf.recentSearches = [sortedArray mutableCopy];
                 weakSelf.originalDetailsArray = weakSelf.recentSearches;
                 
                 [weakSelf.tableView reloadData];
             ***REMOVED***
         ***REMOVED***);
     ***REMOVED***];
***REMOVED***



- (IBAction)didTapStarSortIcon:(id)sender
***REMOVED***
    self.starButton.selected = ![self.starButton isSelected];
    
    if (self.starButton.isSelected)
    ***REMOVED***
        NSSortDescriptor *nameDescriptor =  [NSSortDescriptor sortDescriptorWithKey:@"rating" ascending:YES];
        self.recentSearches = [[self.recentSearches sortedArrayUsingDescriptors: @[nameDescriptor]] mutableCopy];
        
    ***REMOVED***
    else
    ***REMOVED***
        NSSortDescriptor *nameDescriptor =  [NSSortDescriptor sortDescriptorWithKey:@"rating" ascending:NO];
        self.recentSearches = [[self.recentSearches sortedArrayUsingDescriptors: @[nameDescriptor]] mutableCopy];
    ***REMOVED***
    
    [self.tableView reloadData];
***REMOVED***

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
***REMOVED***

    self.hud = [BVTHUDView hudWithView:self.navigationController.view];
    self.hud.delegate = self;
    self.didCancelRequest = NO;
    self.didSelectBiz = YES;
    self.tableView.userInteractionEnabled = NO;
    self.tabBarController.tabBar.userInteractionEnabled = NO;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    YLPBusiness *selectedBusiness = [self.recentSearches objectAtIndex:indexPath.row];
    YLPBusiness *cachedBiz = [[self.cachedBiz filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"identifier = %@", selectedBusiness.identifier]] lastObject];
    __weak typeof(self) weakSelf = self;

    if (cachedBiz)
    ***REMOVED***
        
        [[AppDelegate sharedClient] reviewsForBusinessWithId:cachedBiz.identifier
                                           completionHandler:^(YLPBusinessReviews * _Nullable reviews, NSError * _Nullable error) ***REMOVED***
                                               dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                                                   NSString *string = error.userInfo[@"NSLocalizedDescription"];
                                                   
                                                   if ([string isEqualToString:@"The Internet connection appears to be offline."])
                                                   ***REMOVED***
                                                       [weakSelf _hideHUD];
                                                       
                                                       UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
                                                       
                                                       UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                                                       [alertController addAction:ok];
                                                       
                                                       [weakSelf presentViewController:alertController animated:YES completion:nil];
                                                       
                                                   ***REMOVED***
                                                   else
                                                   ***REMOVED***
                                                       ***REMOVED*** *** Get review user photos in advance if they exist, to display from Presentation VC
                                                       NSMutableArray *userPhotos = [NSMutableArray array];
                                                       for (YLPReview *review in reviews.reviews)
                                                       ***REMOVED***
                                                           YLPUser *user = review.user;
                                                           if (user.imageURL)
                                                           ***REMOVED***
                                                               NSData *imageData = [NSData dataWithContentsOfURL:user.imageURL];
                                                               UIImage *image = [UIImage imageNamed:@"user"];
                                                               if (imageData)
                                                               ***REMOVED***
                                                                   image = [UIImage imageWithData:imageData];
                                                               ***REMOVED***
                                                               [userPhotos addObject:[NSDictionary dictionaryWithObject:image forKey:user.imageURL]];                                                                ***REMOVED***
                                                       ***REMOVED***
                                                       cachedBiz.reviews = reviews.reviews;
                                                       cachedBiz.userPhotosArray = userPhotos;
                                                       
                                                       if (!weakSelf.didCancelRequest)
                                                       ***REMOVED***
                                                           [weakSelf _hideHUD];
                                                           
                                                           [weakSelf performSegueWithIdentifier:kShowDetailSegue sender:cachedBiz];
                                                       ***REMOVED***
                                                   ***REMOVED***
                                                   
                                               ***REMOVED***);
                                           ***REMOVED***];
    ***REMOVED***
    else
    ***REMOVED***
        [[AppDelegate sharedClient] businessWithId:selectedBusiness.identifier completionHandler:^
         (YLPBusiness *business, NSError *error) ***REMOVED***
             dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                 NSString *string = error.userInfo[@"NSLocalizedDescription"];
                 
                 if ([string isEqualToString:@"The Internet connection appears to be offline."])
                 ***REMOVED***
                     [weakSelf _hideHUD];
                     
                     UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
                     
                     UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                     [alertController addAction:ok];
                     
                     [weakSelf presentViewController:alertController animated:YES completion:nil];
                     
                 ***REMOVED***
                 else
                 ***REMOVED***
                     ***REMOVED*** *** Get business photos in advance if they exist, to display from Presentation VC
                     if (business.photos.count > 0)
                     ***REMOVED***
                         NSMutableArray *photosArray = [NSMutableArray array];
                         for (NSString *photoStr in business.photos)
                         ***REMOVED***
                             NSURL *url = [NSURL URLWithString:photoStr];
                             NSData *imageData = [NSData dataWithContentsOfURL:url];
                             UIImage *image = [UIImage imageWithData:imageData];
                             
                             if (imageData)
                             ***REMOVED***
                                 [photosArray addObject:image];
                             ***REMOVED***
                         ***REMOVED***
                         
                         business.photos = photosArray;
                     ***REMOVED***
                     
                     [[AppDelegate sharedClient] reviewsForBusinessWithId:business.identifier
                                                        completionHandler:^(YLPBusinessReviews * _Nullable reviews, NSError * _Nullable error) ***REMOVED***
                                                            dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                                                                NSString *string = error.userInfo[@"NSLocalizedDescription"];
                                                                
                                                                if ([string isEqualToString:@"The Internet connection appears to be offline."])
                                                                ***REMOVED***
                                                                    [weakSelf _hideHUD];
                                                                    
                                                                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
                                                                    
                                                                    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                                                                    [alertController addAction:ok];
                                                                    
                                                                    [weakSelf presentViewController:alertController animated:YES completion:nil];
                                                                    
                                                                ***REMOVED***
                                                                else
                                                                ***REMOVED***
                                                                    ***REMOVED*** *** Get review user photos in advance if they exist, to display from Presentation VC
                                                                    NSMutableArray *userPhotos = [NSMutableArray array];
                                                                    for (YLPReview *review in reviews.reviews)
                                                                    ***REMOVED***
                                                                        YLPUser *user = review.user;
                                                                        if (user.imageURL)
                                                                        ***REMOVED***
                                                                            NSData *imageData = [NSData dataWithContentsOfURL:user.imageURL];
                                                                            UIImage *image = [UIImage imageNamed:@"user"];
                                                                            if (imageData)
                                                                            ***REMOVED***
                                                                                image = [UIImage imageWithData:imageData];
                                                                            ***REMOVED***
                                                                            [userPhotos addObject:[NSDictionary dictionaryWithObject:image forKey:user.imageURL]];                                                                ***REMOVED***
                                                                    ***REMOVED***
                                                                    business.reviews = reviews.reviews;
                                                                    business.userPhotosArray = userPhotos;
                                                                    
                                                                    if (!weakSelf.didCancelRequest)
                                                                    ***REMOVED***
                                                                        [weakSelf _hideHUD];
                                                                        
                                                                        [weakSelf performSegueWithIdentifier:kShowDetailSegue sender:business];
                                                                    ***REMOVED***
                                                                ***REMOVED***
                                                                
                                                            ***REMOVED***);
                                                        ***REMOVED***];
                 ***REMOVED***
                 
             ***REMOVED***);
             
         ***REMOVED***];
    ***REMOVED***
    
    
***REMOVED***

- (void)_hideHUD
***REMOVED***
    self.tableView.userInteractionEnabled = YES;
    self.tabBarController.tabBar.userInteractionEnabled = YES;
    self.searchBar.userInteractionEnabled = YES;

    [self.hud removeFromSuperview];
***REMOVED***


#pragma mark - TableView Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
***REMOVED***
    return 1;
***REMOVED***

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
***REMOVED***
    return self.recentSearches.count;
***REMOVED***

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    BVTThumbNailTableViewCell *cell = (BVTThumbNailTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.tag = indexPath.row;
    cell.openCloseLabel.text = @"";
    cell.secondaryOpenCloseLabel.text = @"";
    
    YLPBusiness *biz = [self.recentSearches objectAtIndex:indexPath.row];
    YLPBusiness *cachedBiz = [[self.cachedBiz filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"identifier = %@", biz.identifier]] lastObject];
    
    if (cachedBiz)
    ***REMOVED***
        biz = cachedBiz;
        
        cell.thumbNailView.image = cachedBiz.bizThumbNail;
        
        dispatch_async(dispatch_get_main_queue(), ^(void)***REMOVED***
            
            if (!self.isLargePhone)
            ***REMOVED***
                if (cachedBiz.isOpenNow)
                ***REMOVED***
                    cell.secondaryOpenCloseLabel.text = @"Open Now";
                    cell.secondaryOpenCloseLabel.textColor = [BVTStyles iconGreen];
                ***REMOVED***
                else if (cachedBiz.hoursItem && !cachedBiz.isOpenNow)
                ***REMOVED***
                    cell.secondaryOpenCloseLabel.text = @"Closed Now";
                    cell.secondaryOpenCloseLabel.textColor = [UIColor redColor];
                ***REMOVED***
            ***REMOVED***
            else
            ***REMOVED***
                if (cachedBiz.isOpenNow)
                ***REMOVED***
                    cell.openCloseLabel.text = @"Open Now";
                    cell.openCloseLabel.textColor = [BVTStyles iconGreen];
                ***REMOVED***
                else if (cachedBiz.hoursItem && !cachedBiz.isOpenNow)
                ***REMOVED***
                    cell.openCloseLabel.text = @"Closed Now";
                    cell.openCloseLabel.textColor = [UIColor redColor];
                ***REMOVED***
            ***REMOVED***
        ***REMOVED***);
    ***REMOVED***
    else
    ***REMOVED***
        cell.thumbNailView.image = [UIImage imageNamed:@"placeholder"];
        __weak typeof(self) weakSelf = self;
        
        if (!self.didSelectBiz)
        ***REMOVED***
            [[AppDelegate sharedClient] businessWithId:biz.identifier completionHandler:^
             (YLPBusiness *business, NSError *error) ***REMOVED***
                 
                 NSString *string = error.userInfo[@"NSLocalizedDescription"];
                 
                 if ([string isEqualToString:@"The Internet connection appears to be offline."])
                 ***REMOVED***
                     dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                         
                         [weakSelf _hideHUD];
                         
                         UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
                         
                         UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                         [alertController addAction:ok];
                         
                         [weakSelf presentViewController:alertController animated:YES completion:nil];
                     ***REMOVED***);
                 ***REMOVED***
                 else
                 ***REMOVED***
                     if (business)
                     ***REMOVED***
                         business.didGetDetails = YES;
                         
                         dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void)***REMOVED***
                             ***REMOVED*** Your Background work
                             if (cell.tag == indexPath.row)
                             ***REMOVED***
                                 NSData *imageData = [NSData dataWithContentsOfURL:business.imageURL];
                                 if (imageData)
                                 ***REMOVED***
                                     UIImage *image = [UIImage imageWithData:imageData];
                                     business.bizThumbNail = image;
                                     cell.thumbNailView.image = image;
                                 ***REMOVED***
                                 else
                                 ***REMOVED***
                                     business.bizThumbNail = [UIImage imageNamed:@"placeholder"];
                                 ***REMOVED***
                                 
                                 if (business.photos.count > 0)
                                 ***REMOVED***
                                     NSMutableArray *photosArray = [NSMutableArray array];
                                     for (NSString *photoStr in business.photos)
                                     ***REMOVED***
                                         NSURL *url = [NSURL URLWithString:photoStr];
                                         NSData *imageData = [NSData dataWithContentsOfURL:url];
                                         
                                         UIImage *image = [UIImage imageWithData:imageData];
                                         
                                         if (imageData)
                                         ***REMOVED***
                                             [photosArray addObject:image];
                                         ***REMOVED***
                                     ***REMOVED***
                                     
                                     business.photos = photosArray;
                                     
                                     [weakSelf.cachedBiz addObject:business];
                                     
                                     YLPBusiness *match = [[weakSelf.originalDetailsArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"identifier = %@", business.identifier]] lastObject];
                                     
                                     if (match)
                                     ***REMOVED***
                                         NSInteger index = [weakSelf.originalDetailsArray indexOfObject:match];
                                         
                                         if (index)
                                         ***REMOVED***
                                             [weakSelf.originalDetailsArray replaceObjectAtIndex:index withObject:business];
                                         ***REMOVED***
                                     ***REMOVED***
                                 ***REMOVED***
                             ***REMOVED***
                             
                             dispatch_async(dispatch_get_main_queue(), ^(void)***REMOVED***
                                 ***REMOVED*** Update your UI
                                 if (cell.tag == indexPath.row)
                                 ***REMOVED***
                                     if (!weakSelf.isLargePhone)
                                     ***REMOVED***
                                         if (business.isOpenNow)
                                         ***REMOVED***
                                             cell.secondaryOpenCloseLabel.text = @"Open Now";
                                             cell.secondaryOpenCloseLabel.textColor = [BVTStyles iconGreen];
                                         ***REMOVED***
                                         else if (business.hoursItem && !business.isOpenNow)
                                         ***REMOVED***
                                             cell.secondaryOpenCloseLabel.text = @"Closed Now";
                                             cell.secondaryOpenCloseLabel.textColor = [UIColor redColor];
                                         ***REMOVED***
                                     ***REMOVED***
                                     else
                                     ***REMOVED***
                                         if (business.isOpenNow)
                                         ***REMOVED***
                                             cell.openCloseLabel.text = @"Open Now";
                                             cell.openCloseLabel.textColor = [BVTStyles iconGreen];
                                         ***REMOVED***
                                         else if (business.hoursItem && !business.isOpenNow)
                                         ***REMOVED***
                                             cell.openCloseLabel.text = @"Closed Now";
                                             cell.openCloseLabel.textColor = [UIColor redColor];
                                         ***REMOVED***
                                     ***REMOVED***
                                 ***REMOVED***
                             ***REMOVED***);
                         ***REMOVED***);
                     ***REMOVED***
                 ***REMOVED***
             ***REMOVED***];
        ***REMOVED***
    ***REMOVED***
    
    cell.business = biz;
    
    return cell;
***REMOVED***

- (IBAction)didTapPriceButton:(id)sender
***REMOVED***
    if ([self.priceButton.titleLabel.text isEqualToString:@"Any $"])
    ***REMOVED***
        self.priceKeyValue = @"$";
        [self.priceButton setTitle:@"$" forState:UIControlStateNormal];
    ***REMOVED***
    else if ([self.priceButton.titleLabel.text isEqualToString:@"$"])
    ***REMOVED***
        self.priceKeyValue = @"$$";
        [self.priceButton setTitle:@"$$" forState:UIControlStateNormal];
    ***REMOVED***
    else if ([self.priceButton.titleLabel.text isEqualToString:@"$$"])
    ***REMOVED***
        self.priceKeyValue = @"$$$";
        [self.priceButton setTitle:@"$$$" forState:UIControlStateNormal];
    ***REMOVED***
    else if ([self.priceButton.titleLabel.text isEqualToString:@"$$$"])
    ***REMOVED***
        self.priceKeyValue = @"$$$$";
        [self.priceButton setTitle:@"$$$$" forState:UIControlStateNormal];
    ***REMOVED***
    else if ([self.priceButton.titleLabel.text isEqualToString:@"$$$$"])
    ***REMOVED***
        self.priceKeyValue = @"Any $";
        [self.priceButton setTitle:@"Any $" forState:UIControlStateNormal];
    ***REMOVED***
    
    [self sortArrayWithPredicates];
***REMOVED***

- (void)sortArrayWithPredicates
***REMOVED***
    NSPredicate *pricePredicate;
    
    NSMutableArray *arrayPred = [NSMutableArray array];
    if (!self.priceKeyValue)
    ***REMOVED***
        self.priceKeyValue = @"Any $";
    ***REMOVED***
    
    if ([self.priceKeyValue isEqualToString:@"Any $"])
    ***REMOVED***
        pricePredicate = [NSPredicate predicateWithFormat:@"price = %@ OR price = %@ OR price = %@ OR price = %@ OR price = %@", nil, @"$", @"$$", @"$$$", @"$$$$"];
    ***REMOVED***
    else
    ***REMOVED***
        pricePredicate = [NSPredicate predicateWithFormat:@"price = %@", self.priceKeyValue];
    ***REMOVED***
    
    [arrayPred addObject:pricePredicate];
    
    NSPredicate *distancePredicate;
    AppDelegate *appDel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if (appDel.userLocation)
    ***REMOVED***
        self.distanceButton.hidden = NO;
        if (self.milesKeyValue == 0)
        ***REMOVED***
            distancePredicate = [NSPredicate predicateWithFormat:@"miles >= 0"];
        ***REMOVED***
        else
        ***REMOVED***
            distancePredicate = [NSPredicate predicateWithFormat:@"miles <= %g", self.milesKeyValue];
        ***REMOVED***
        
        [arrayPred addObject:distancePredicate];
    ***REMOVED***
    else
    ***REMOVED***
        self.distanceButton.hidden = YES;
    ***REMOVED***
    
    NSPredicate *openClosePredicate;
***REMOVED***    if (self.openNowButton.hidden == NO)
***REMOVED***    ***REMOVED***
        if (!self.openCloseKeyValue)
        ***REMOVED***
            self.openCloseKeyValue = @"Open/Closed";
        ***REMOVED***
        
        if ([self.openCloseKeyValue isEqualToString:@"Open"])
        ***REMOVED***
            openClosePredicate = [NSPredicate predicateWithFormat:@"isOpenNow = %@", @(YES)];
        ***REMOVED***
        else if ([self.openCloseKeyValue isEqualToString:@"Closed"])
        ***REMOVED***
            openClosePredicate = [NSPredicate predicateWithFormat:@"isOpenNow = %@ && hoursItem != %@", @(NO), nil];
        ***REMOVED***
        else if ([self.openCloseKeyValue isEqualToString:@"Open/Closed"])
        ***REMOVED***
            openClosePredicate = [NSPredicate predicateWithFormat:@"isOpenNow = %@ OR isOpenNow = %@", @(NO), @(YES)];
        ***REMOVED***
        
        if (openClosePredicate)
        ***REMOVED***
            [arrayPred addObject:openClosePredicate];
        ***REMOVED***
***REMOVED***    ***REMOVED***
    
    NSPredicate *comboPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:arrayPred];
        self.recentSearches  = [[self.originalDetailsArray filteredArrayUsingPredicate:comboPredicate] mutableCopy];

        if (self.recentSearches.count == 0)
        ***REMOVED***
            self.titleLabel.text = [NSString stringWithFormat:@"Recent Search Results (0)"];
            self.label.text = @"No sorted results found.";
        ***REMOVED***
        else
        ***REMOVED***
            self.titleLabel.text = [NSString stringWithFormat:@"Recent Search Results (%lu)", (unsigned long)self.recentSearches.count];
            self.label.text = @"";
        ***REMOVED***
    
    
    [self.tableView reloadData];
***REMOVED***

- (IBAction)didTapDistanceButton:(id)sender
***REMOVED***
    if ([self.distanceButton.titleLabel.text isEqualToString:@"5 Miles"])
    ***REMOVED***
        self.milesKeyValue = 10;
        [self.distanceButton setTitle:@"10 Miles" forState:UIControlStateNormal];
    ***REMOVED***
    else if ([self.distanceButton.titleLabel.text isEqualToString:@"10 Miles"])
    ***REMOVED***
        self.milesKeyValue = 25;
        [self.distanceButton setTitle:@"25 Miles" forState:UIControlStateNormal];
    ***REMOVED***
    else if ([self.distanceButton.titleLabel.text isEqualToString:@"25 Miles"])
    ***REMOVED***
        self.milesKeyValue = 50;
        [self.distanceButton setTitle:@"50 Miles" forState:UIControlStateNormal];
    ***REMOVED***
    else if ([self.distanceButton.titleLabel.text isEqualToString:@"50 Miles"])
    ***REMOVED***
        self.milesKeyValue = 100;
        [self.distanceButton setTitle:@"100 Miles" forState:UIControlStateNormal];
    ***REMOVED***
    else if ([self.distanceButton.titleLabel.text isEqualToString:@"100 Miles"])
    ***REMOVED***
        self.milesKeyValue = 0;
        [self.distanceButton setTitle:@"Any Miles" forState:UIControlStateNormal];
    ***REMOVED***
    else if ([self.distanceButton.titleLabel.text isEqualToString:@"Any Miles"])
    ***REMOVED***
        self.milesKeyValue = 5;
        [self.distanceButton setTitle:@"5 Miles" forState:UIControlStateNormal];
    ***REMOVED***
    
    [self sortArrayWithPredicates];
***REMOVED***

- (IBAction)didTapOpenButton:(id)sender
***REMOVED***
    if ([self.openNowButton.titleLabel.text isEqualToString:@"Closed"])
    ***REMOVED***
        self.openCloseKeyValue = @"Open";
        [self.openNowButton setTitle:@"Open" forState:UIControlStateNormal];
    ***REMOVED***
    else if ([self.openNowButton.titleLabel.text isEqualToString:@"Open"])
    ***REMOVED***
        self.openCloseKeyValue = @"Open/Closed";
        [self.openNowButton setTitle:@"Open/Closed" forState:UIControlStateNormal];
    ***REMOVED***
    else if ([self.openNowButton.titleLabel.text isEqualToString:@"Open/Closed"])
    ***REMOVED***
        self.openCloseKeyValue = @"Closed";
        [self.openNowButton setTitle:@"Closed" forState:UIControlStateNormal];
    ***REMOVED***
    
    [self sortArrayWithPredicates];
***REMOVED***

***REMOVED***
