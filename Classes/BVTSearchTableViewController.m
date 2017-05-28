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

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar;
***REMOVED***
    searchBar.showsCancelButton = NO;
    searchBar.text = @"";
    [searchBar resignFirstResponder];
***REMOVED***

- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
    [self.view bringSubviewToFront:self.label];
    
    UINib *cellNib = [UINib nibWithNibName:kThumbNailCell bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"Cell"];
    
    self.tableView.estimatedRowHeight = 44.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    if (self.recentSearches.count == 0)
    ***REMOVED***
        self.label.text = @"Perform a search to get started.";
    ***REMOVED***
***REMOVED***    self.tableView.sectionHeaderHeight = 44.f;

***REMOVED***    UINib *headerView = [UINib nibWithNibName:kTableViewSectionHeaderView bundle:nil];
***REMOVED***    [self.tableView registerNib:headerView forHeaderFooterViewReuseIdentifier:kTableViewSectionHeaderView];
    
    self.tableView.tableFooterView = [UIView new];
***REMOVED***

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
***REMOVED***
    return @"Search Results";
***REMOVED***

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
***REMOVED***
    CGFloat height;
    if (self.recentSearches.count == 0)
    ***REMOVED***
        height = 0.f;
    ***REMOVED***
    else
    ***REMOVED***
        height = 44.f;
    ***REMOVED***
    return height;
***REMOVED***

- (void)didTapHUDCancelButton
***REMOVED***
    self.didCancelRequest = YES;
    self.tableView.userInteractionEnabled = YES;
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

    __weak typeof(self) weakSelf = self;
    [[AppDelegate sharedClient] searchWithLocation:@"Burlington, VT" term:searchBar.text limit:50 offset:0 sort:YLPSortTypeDistance completionHandler:^
     (YLPSearch *searchResults, NSError *error)***REMOVED***
         dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
             ***REMOVED*** code here
             if (error)
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
                 
                 weakSelf.label.hidden = NO;
                 weakSelf.label.text = @"No search results found.";
                 
***REMOVED***                 UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"No search results found" message:@"Please select another category" preferredStyle:UIAlertControllerStyleAlert];
***REMOVED***                 
***REMOVED***                 UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
***REMOVED***                 [alertController addAction:ok];
***REMOVED***                 
***REMOVED***                 [weakSelf presentViewController:alertController animated:YES completion:nil];
***REMOVED***                 
             ***REMOVED***
             else if (searchResults.businesses.count > 0)
             ***REMOVED***
                 [weakSelf _hideHUD];
                 
                 weakSelf.label.hidden = YES;
                 NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
                 NSArray *sortedArray = [searchResults.businesses sortedArrayUsingDescriptors: @[descriptor]];
                 
                 weakSelf.recentSearches = sortedArray;
                 [weakSelf.tableView reloadData];
                 
***REMOVED***                 [weakSelf.tableView setSectionHeaderHeight:44.f];

             ***REMOVED***
         ***REMOVED***);
     ***REMOVED***];

    [searchBar resignFirstResponder];
    searchBar.text = @"";
    searchBar.showsCancelButton = NO;
***REMOVED***

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
***REMOVED***
    self.hud = [BVTHUDView hudWithView:self.navigationController.view];
    self.hud.delegate = self;
    self.didCancelRequest = NO;

    self.tableView.userInteractionEnabled = NO;
    
    YLPBusiness *selectedBusiness = [self.recentSearches objectAtIndex:indexPath.row];
    __weak typeof(self) weakSelf = self;

        [[AppDelegate sharedClient] businessWithId:selectedBusiness.identifier completionHandler:^
         (YLPBusiness *business, NSError *error) ***REMOVED***
             dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                 if (error) ***REMOVED***
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
                             UIImage *image = [UIImage imageNamed:@"placeholder"];
                             if (imageData)
                             ***REMOVED***
                                 image = [UIImage imageWithData:imageData];
                             ***REMOVED***
                             [photosArray addObject:image];
                         ***REMOVED***
    
                         business.photos = photosArray;
                     ***REMOVED***
    
                     [[AppDelegate sharedClient] reviewsForBusinessWithId:business.identifier
                                                        completionHandler:^(YLPBusinessReviews * _Nullable reviews, NSError * _Nullable error) ***REMOVED***
                                                            dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                                                                if (error) ***REMOVED***
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

- (void)_hideHUD
***REMOVED***
    self.tableView.userInteractionEnabled = YES;
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
    
    YLPBusiness *biz =  [self.recentSearches objectAtIndex:indexPath.row];
    cell.business = biz;
    
    cell.openCloseLabel.text = @"";
    cell.secondaryOpenCloseLabel.text = @"";
    
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

***REMOVED***
