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
@property (nonatomic, strong) NSArray *recentSearches;
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
@property (nonatomic, strong) NSArray *originalDisplayResults;
@property (nonatomic) BOOL gotDetails;
@property (nonatomic, strong) NSArray *detailsArray;
@property (nonatomic, strong) NSArray *originalDetailsArray;
@property (nonatomic) BOOL didSelectBiz;
@property (nonatomic) BOOL isLargePhone;

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
        self.label.text = @"No recent search results.";
    ***REMOVED***
 
    self.tableView.estimatedRowHeight = 44.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.tableFooterView = [UIView new];
***REMOVED***

- (void)didTapHUDCancelButton
***REMOVED***
    self.didCancelRequest = YES;
    self.tableView.userInteractionEnabled = YES;
    self.tabBarController.tabBar.userInteractionEnabled = YES;

    [self.hud removeFromSuperview];
***REMOVED***

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath ***REMOVED***
    if (editingStyle == UITableViewCellEditingStyleDelete) ***REMOVED***
    ***REMOVED***
***REMOVED***

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
***REMOVED***
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
    self.tableView.userInteractionEnabled = NO;
    self.tabBarController.tabBar.userInteractionEnabled = NO;

    self.didSelectBiz = NO;
    
    __weak typeof(self) weakSelf = self;
    [[AppDelegate sharedClient] searchWithLocation:@"Burlington, VT" term:searchBar.text limit:50 offset:0 sort:YLPSortTypeDistance completionHandler:^
     (YLPSearch *searchResults, NSError *error)***REMOVED***
         dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
             ***REMOVED*** code here
             if (error)
             ***REMOVED***
                 [weakSelf _hideHUD];
                 
                 NSString *string = error.userInfo[@"NSDebugDescription"];
                 
                 if (![string isEqualToString:@"JSON text did not start with array or object and option to allow fragments not set."] && ![string isEqualToString:@"The data couldn't be read because it isn't in the correct format."])
                 ***REMOVED***
                     UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
                     
                     UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                     [alertController addAction:ok];
                     
                     [weakSelf presentViewController:alertController animated:YES completion:nil];
                 ***REMOVED***
             ***REMOVED***
             else if (searchResults.businesses.count == 0)
             ***REMOVED***
                 [weakSelf _hideHUD];
                 
                 weakSelf.label.hidden = NO;
                 weakSelf.recentSearches = @[];
                 weakSelf.detailsArray = @[];
                 [weakSelf.tableView reloadData];
                 weakSelf.label.text = @"No search results found.";
                 weakSelf.titleLabel.text = [NSString stringWithFormat:@"Recent Search Results (0)"];

             ***REMOVED***
             else if (searchResults.businesses.count > 0)
             ***REMOVED***
                 [weakSelf _hideHUD];
                 
                 weakSelf.label.hidden = YES;
                 weakSelf.titleLabel.text = [NSString stringWithFormat:@"Recent Search Results (%lu)", (unsigned long)searchResults.businesses.count];
                 
                 weakSelf.starButton.hidden = NO;
                 weakSelf.sortView.hidden = NO;
                 weakSelf.titleView.hidden = NO;
                 
                 weakSelf.originalDisplayResults = searchResults.businesses;
                 
                 NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
                 NSArray *sortedArray = [searchResults.businesses sortedArrayUsingDescriptors: @[descriptor]];
                 
                 weakSelf.recentSearches = sortedArray;
                 [weakSelf.tableView reloadData];
                 
                 if (self.recentSearches.count > 0)
                 ***REMOVED***
                     NSMutableArray *bizAdd = [NSMutableArray array];
                     for (YLPBusiness *selectedBusiness in self.recentSearches)
                     ***REMOVED***

                         [[AppDelegate sharedClient] businessWithId:selectedBusiness.identifier completionHandler:^
                          (YLPBusiness *business, NSError *error) ***REMOVED***
                              if (error)
                              ***REMOVED***
                                  [weakSelf _hideHUD];

                                  NSString *string = error.userInfo[@"NSDebugDescription"];
                                  
                                                   if (![string isEqualToString:@"JSON text did not start with array or object and option to allow fragments not set."] && ![string isEqualToString:@"The data couldn't be read because it isn't in the correct format."])
                                  ***REMOVED***
                                      UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
                                      
                                      UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                                      [alertController addAction:ok];
                                      
                                      [weakSelf presentViewController:alertController animated:YES completion:nil];
                                  ***REMOVED***
                              ***REMOVED***
                              else if (business.photos.count > 0)
                              ***REMOVED***
                                  NSMutableArray *photosArray = [NSMutableArray array];
                                  for (NSString *photoStr in business.photos)
                                  ***REMOVED***
                                      NSURL *url = [NSURL URLWithString:photoStr];
                                      NSData *imageData = [NSData dataWithContentsOfURL:url];
                                      UIImage *image = [UIImage imageWithData:imageData];
                                      [photosArray addObject:image];
                                  ***REMOVED***
                                  
                                  business.photos = photosArray;
                              ***REMOVED***
                              
                              if (business)
                              ***REMOVED***
                                  [bizAdd addObject:business];
                                  
                                  if (bizAdd.count == weakSelf.recentSearches.count)
                                  ***REMOVED***
                                      dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                                          NSSortDescriptor *nameDescriptor =  [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
                                          if (!weakSelf.didSelectBiz)
                                          ***REMOVED***
                                              [weakSelf _hideHUD];
                                          ***REMOVED***
                                          weakSelf.detailsArray = [bizAdd sortedArrayUsingDescriptors: @[nameDescriptor]];
                                          weakSelf.gotDetails = YES;
                                          weakSelf.originalDetailsArray = weakSelf.detailsArray;
                                          [weakSelf sortArrayWithPredicates];
                                      ***REMOVED***);
                                  ***REMOVED***
                              ***REMOVED***
                          ***REMOVED***];
                     ***REMOVED***
                 ***REMOVED***
             ***REMOVED***
         ***REMOVED***);
     ***REMOVED***];

    [searchBar resignFirstResponder];
    searchBar.showsCancelButton = NO;
***REMOVED***



- (IBAction)didTapStarSortIcon:(id)sender
***REMOVED***
    self.starButton.selected = ![self.starButton isSelected];
    
    if (self.gotDetails)
    ***REMOVED***
        if (self.starButton.isSelected)
        ***REMOVED***
            NSSortDescriptor *nameDescriptor =  [NSSortDescriptor sortDescriptorWithKey:@"rating" ascending:YES];
            self.detailsArray = [self.detailsArray sortedArrayUsingDescriptors: @[nameDescriptor]];
            
        ***REMOVED***
        else
        ***REMOVED***
            NSSortDescriptor *nameDescriptor =  [NSSortDescriptor sortDescriptorWithKey:@"rating" ascending:NO];
            self.detailsArray = [self.detailsArray sortedArrayUsingDescriptors: @[nameDescriptor]];
        ***REMOVED***
    ***REMOVED***
    else
    ***REMOVED***
        if (self.starButton.isSelected)
        ***REMOVED***
            NSSortDescriptor *nameDescriptor =  [NSSortDescriptor sortDescriptorWithKey:@"rating" ascending:YES];
            self.recentSearches = [self.recentSearches sortedArrayUsingDescriptors: @[nameDescriptor]];
            
        ***REMOVED***
        else
        ***REMOVED***
            NSSortDescriptor *nameDescriptor =  [NSSortDescriptor sortDescriptorWithKey:@"rating" ascending:NO];
            self.recentSearches = [self.recentSearches sortedArrayUsingDescriptors: @[nameDescriptor]];
        ***REMOVED***
    ***REMOVED***
    
    
    
    [self.tableView reloadData];
***REMOVED***

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
***REMOVED***
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    self.hud = [BVTHUDView hudWithView:self.navigationController.view];
    self.hud.delegate = self;
    self.didCancelRequest = NO;

    self.tableView.userInteractionEnabled = NO;
    self.tabBarController.tabBar.userInteractionEnabled = NO;

    self.didSelectBiz = YES;
    
    YLPBusiness *selectedBusiness = [self.recentSearches objectAtIndex:indexPath.row];
    __weak typeof(self) weakSelf = self;

        [[AppDelegate sharedClient] businessWithId:selectedBusiness.identifier completionHandler:^
         (YLPBusiness *business, NSError *error) ***REMOVED***
             dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                 if (error) ***REMOVED***
                     
                     [weakSelf _hideHUD];

                     NSString *string = error.userInfo[@"NSDebugDescription"];
                     
                                      if (![string isEqualToString:@"JSON text did not start with array or object and option to allow fragments not set."] && ![string isEqualToString:@"The data couldn't be read because it isn't in the correct format."])
                     ***REMOVED***
                         UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
                         
                         UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                         [alertController addAction:ok];
                         
                         [weakSelf presentViewController:alertController animated:YES completion:nil];
                     ***REMOVED***
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

                             [photosArray addObject:image];
                         ***REMOVED***
    
                         business.photos = photosArray;
                     ***REMOVED***
    
                     [[AppDelegate sharedClient] reviewsForBusinessWithId:business.identifier
                                                        completionHandler:^(YLPBusinessReviews * _Nullable reviews, NSError * _Nullable error) ***REMOVED***
                                                            dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                                                                if (error) ***REMOVED***
                                                                    
                                                                    [weakSelf _hideHUD];

                                                                    NSString *string = error.userInfo[@"NSDebugDescription"];
                                                                    
                                                                                     if (![string isEqualToString:@"JSON text did not start with array or object and option to allow fragments not set."] && ![string isEqualToString:@"The data couldn't be read because it isn't in the correct format."])
                                                                    ***REMOVED***
                                                                        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
                                                                        
                                                                        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                                                                        [alertController addAction:ok];
                                                                        
                                                                        [weakSelf presentViewController:alertController animated:YES completion:nil];
                                                                    ***REMOVED***
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

- (void)_hideHUD
***REMOVED***
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
    NSInteger i = 0;
    if (self.gotDetails)
    ***REMOVED***
        i = self.detailsArray.count;
    ***REMOVED***
    else
    ***REMOVED***
        i = self.recentSearches.count;
    ***REMOVED***
    return i;
***REMOVED***

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    BVTThumbNailTableViewCell *cell = (BVTThumbNailTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.tag = indexPath.row;
    YLPBusiness *biz;
    if (self.gotDetails)
    ***REMOVED***
        self.openNowButton.hidden = NO;
        biz = [self.detailsArray objectAtIndex:indexPath.row];
    ***REMOVED***
    else
    ***REMOVED***
        self.openNowButton.hidden = YES;
        biz =  [self.recentSearches objectAtIndex:indexPath.row];
    ***REMOVED***
    
    cell.business = biz;

    cell.openCloseLabel.text = @"";
    cell.secondaryOpenCloseLabel.text = @"";
    
    if (!self.isLargePhone)
    ***REMOVED***
        if (biz.isOpenNow)
        ***REMOVED***
            cell.secondaryOpenCloseLabel.text = @"Open Now";
            cell.secondaryOpenCloseLabel.textColor = [BVTStyles iconGreen];
        ***REMOVED***
        else if (biz.hoursItem && !biz.isOpenNow)
        ***REMOVED***
            cell.secondaryOpenCloseLabel.text = @"Closed Now";
            cell.secondaryOpenCloseLabel.textColor = [UIColor redColor];
        ***REMOVED***
    ***REMOVED***
    else
    ***REMOVED***
        if (biz.isOpenNow)
        ***REMOVED***
            cell.openCloseLabel.text = @"Open Now";
            cell.openCloseLabel.textColor = [BVTStyles iconGreen];
        ***REMOVED***
        else if (biz.hoursItem && !biz.isOpenNow)
        ***REMOVED***
            cell.openCloseLabel.text = @"Closed Now";
            cell.openCloseLabel.textColor = [UIColor redColor];
        ***REMOVED***
    ***REMOVED***
    
    if (biz.bizThumbNail)
    ***REMOVED***
        cell.thumbNailView.image = biz.bizThumbNail;
    ***REMOVED***
    else
    ***REMOVED***
        cell.thumbNailView.image = [UIImage imageNamed:@"placeholder"];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^***REMOVED***
            ***REMOVED*** Your Background work
            NSData *imageData = [NSData dataWithContentsOfURL:biz.imageURL];
            dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                ***REMOVED*** Update your UI
                if (cell.tag == indexPath.row)
                ***REMOVED***
                    if (imageData)
                    ***REMOVED***
                        UIImage *image = [UIImage imageWithData:imageData];
                        biz.bizThumbNail = image;
                        cell.thumbNailView.image = image;
                    ***REMOVED***
                    else
                    ***REMOVED***
                        biz.bizThumbNail = [UIImage imageNamed:@"placeholder"];
                    ***REMOVED***
                ***REMOVED***
            ***REMOVED***);
        ***REMOVED***);
    ***REMOVED***
    
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
    if (self.openNowButton.hidden == NO)
    ***REMOVED***
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
    ***REMOVED***
    
    NSPredicate *comboPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:arrayPred];
    
    if (self.gotDetails)
    ***REMOVED***
***REMOVED***        NSArray *values = self.cachedDetails[self.subCategoryTitle];
        
        self.detailsArray = [self.originalDetailsArray filteredArrayUsingPredicate:comboPredicate];
        self.titleLabel.text = [NSString stringWithFormat:@"Recent Search Results (%lu)", (unsigned long)self.detailsArray.count];
        
        if (self.detailsArray.count == 0)
        ***REMOVED***
            self.titleLabel.text = [NSString stringWithFormat:@"Recent Search Results (0)"];

                self.label.text = @"No sorted results found.";

            
            self.label.hidden = NO;
        ***REMOVED***
        else
        ***REMOVED***
            self.titleLabel.text = [NSString stringWithFormat:@"Recent Search Results (%lu)", (unsigned long)self.detailsArray.count];
            self.label.hidden = YES;
        ***REMOVED***
        
    ***REMOVED***
    else
    ***REMOVED***
        self.recentSearches  = [self.originalDisplayResults filteredArrayUsingPredicate:comboPredicate];

        if (self.recentSearches.count == 0)
        ***REMOVED***
            self.titleLabel.text = [NSString stringWithFormat:@"Recent Search Results (0)"];
            self.label.text = @"No sorted results found.";
            self.label.hidden = NO;
        ***REMOVED***
        else
        ***REMOVED***
            self.titleLabel.text = [NSString stringWithFormat:@"Recent Search Results (%lu)", (unsigned long)self.recentSearches.count];
            self.label.hidden = YES;
        ***REMOVED***
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
