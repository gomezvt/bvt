***REMOVED***
***REMOVED***  BVTSurpriseRecommendationsTableViewController.m
***REMOVED***  bvt
***REMOVED***
***REMOVED***  Created by Greg on 4/8/17.
***REMOVED***  Copyright © 2017 gms. All rights reserved.
***REMOVED***

#import "BVTSurpriseRecommendationsTableViewController.h"

#import "BVTHeaderTitleView.h"
#import "BVTStyles.h"
#import "YLPBusiness.h"
#import "BVTThumbNailTableViewCell.h"
#import "BVTHUDView.h"
***REMOVED***
#import "YLPReview.h"
#import "YLPUser.h"
#import "YLPBusinessReviews.h"
#import "YLPClient+Reviews.h"
#import "YLPClient+Business.h"
#import "BVTDetailTableViewController.h"
#import "BVTTableViewSectionHeaderView.h"
#import "BVTThumbNailTableViewCell.h"
***REMOVED***

@interface BVTSurpriseRecommendationsTableViewController ()
<BVTHUDViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *backChevron;
@property (nonatomic, strong) BVTHUDView *hud;
@property (nonatomic) BOOL didCancelRequest;
@property (nonatomic, strong) NSMutableDictionary *orderedDict;
@property (nonatomic) BOOL isLargePhone;
@property (nonatomic) BOOL didSelectBiz;
@property (nonatomic, strong) GADBannerView *bannerView;

***REMOVED***

static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";
static NSString *const kThumbNailCell = @"BVTThumbNailTableViewCell";
static NSString *const kShowDetailSegue = @"ShowDetail";

@implementation BVTSurpriseRecommendationsTableViewController

- (void)didTapHUDCancelButton
***REMOVED***
    self.didCancelRequest = YES;

    dispatch_async(dispatch_get_main_queue(), ^(void)***REMOVED***
        self.backChevron.enabled = YES;
        self.tableView.userInteractionEnabled = YES;
        self.tabBarController.tabBar.userInteractionEnabled = YES;
        
        [self.hud removeFromSuperview];
    ***REMOVED***);
***REMOVED***

- (void)awakeFromNib
***REMOVED***
    [super awakeFromNib];

    self.orderedDict = [NSMutableDictionary dictionary];
    
    UINib *nibTitleView = [UINib nibWithNibName:kHeaderTitleViewNib bundle:nil];
    BVTHeaderTitleView *headerTitleView = [[nibTitleView instantiateWithOwner:self options:nil] objectAtIndex:0];
    headerTitleView.titleViewLabelConstraint.constant = -20.f;
    self.navigationItem.titleView = headerTitleView;
    self.navigationController.navigationBar.barTintColor = [BVTStyles iconGreen];
***REMOVED***

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
***REMOVED***
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    NSArray *sortedArray2 = [[self.businessOptions allKeys] sortedArrayUsingDescriptors: @[descriptor]];
    NSString *key = [sortedArray2 objectAtIndex:section];
    NSArray *values = [self.businessOptions valueForKey:key];
    
    if (values.count > 0)
    ***REMOVED***
        return key;
    ***REMOVED***
    
    return nil;
***REMOVED***

- (IBAction)didTapBack:(id)sender
***REMOVED***
    if ([self.delegate respondsToSelector:@selector(didTapBackWithDetails:)])
    ***REMOVED***
        [self.delegate didTapBackWithDetails:self.cachedDetails];
    ***REMOVED***
    [self.navigationController popViewControllerAnimated:YES];
***REMOVED***


- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
    UIView *view = self.tabBarController.selectedViewController.view;
    UIView *bannerSpace = [[UIView alloc] initWithFrame:CGRectMake(0, view.frame.size.height - 61.f, view.frame.size.width, 61.f)];
    bannerSpace.backgroundColor = [UIColor whiteColor];
    [view addSubview:bannerSpace];
    
    self.bannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeFullBanner];
    
    [bannerSpace addSubview:self.bannerView];
    
    [self.bannerView setFrame:CGRectMake(0, 0, bannerSpace.frame.size.width, self.bannerView.frame.size.height)];
    
    self.bannerView.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 60.f, 0);

    CGRect mainScreen = [[UIScreen mainScreen] bounds];
    if (mainScreen.size.width > 375.f)
    ***REMOVED***
        self.isLargePhone = YES;
    ***REMOVED***
    else
    ***REMOVED***
        self.isLargePhone = NO;
    ***REMOVED***
    
    self.tableView.tableFooterView = [UIView new];
    
    
    if (!self.cachedDetails)
    ***REMOVED***
        self.cachedDetails = [[NSMutableArray alloc] init];
    ***REMOVED***
    
    
    self.tableView.sectionHeaderHeight = 44.f;
    
    UINib *cellNib = [UINib nibWithNibName:kThumbNailCell bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"Cell"];
    
    self.tableView.estimatedRowHeight = 44.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
***REMOVED***

- (void)didReceiveMemoryWarning ***REMOVED***
    [super didReceiveMemoryWarning];
    ***REMOVED*** Dispose of any resources that can be recreated.
***REMOVED***

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
***REMOVED***
    return self.businessOptions.count;
***REMOVED***

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
***REMOVED***
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    NSArray *sortedArray2 = [[self.businessOptions allKeys] sortedArrayUsingDescriptors: @[descriptor]];
    NSString *key = [sortedArray2 objectAtIndex:section];
    NSArray *values = [self.businessOptions valueForKey:key];
    
    return values.count;
***REMOVED***

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    BVTThumbNailTableViewCell *cell = (BVTThumbNailTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.tag = indexPath.row;
    
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    NSArray *sortedArray2 = [[self.businessOptions allKeys] sortedArrayUsingDescriptors: @[descriptor]];
    NSString *key = [sortedArray2 objectAtIndex:indexPath.section];
    NSArray *values = [self.businessOptions valueForKey:key];
    
    if (values.count > 0)
    ***REMOVED***
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in values)
        ***REMOVED***
            [tempArray addObject:[[dict allValues] lastObject]];
        ***REMOVED***
        
        NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
        NSArray *sortedArray2 = [tempArray sortedArrayUsingDescriptors: @[descriptor]];
        
        __block YLPBusiness *biz = [sortedArray2 objectAtIndex:indexPath.row];
        YLPBusiness *cachedBiz = [[self.cachedDetails filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"identifier = %@", biz.identifier]] lastObject];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.numberOfLines = 0;
        
        dispatch_async(dispatch_get_main_queue(), ^(void)***REMOVED***
            cell.openCloseLabel.text = @"";
            cell.secondaryOpenCloseLabel.text = @"";
            cell.thumbNailView.image = [UIImage imageNamed:@"placeholder"];
        ***REMOVED***);
        
        if (cachedBiz && cachedBiz.didGetDetails)
        ***REMOVED***
            biz = cachedBiz;
            
            dispatch_async(dispatch_get_main_queue(), ^(void)***REMOVED***
                if (cell.tag == indexPath.row)
                ***REMOVED***
                    cell.thumbNailView.image = cachedBiz.bizThumbNail;
                    
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
                ***REMOVED***
            ***REMOVED***);
        ***REMOVED***
        else if (!self.didSelectBiz)
        ***REMOVED***
            __weak typeof(self) weakSelf = self;
            
            [[AppDelegate yelp] businessWithId:biz.identifier completionHandler:^
             (YLPBusiness *business, NSError *error) ***REMOVED***
                 
                 NSString *string = error.userInfo[@"NSLocalizedDescription"];
                 
                 if ([string isEqualToString:@"The Internet connection appears to be offline."])
                 ***REMOVED***
                     dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                         
                         [weakSelf _hideHud];
                         
                         UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"No Internet" message:@"Check your connection and try again" preferredStyle:UIAlertControllerStyleAlert];
                         
                         UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                         [alertController addAction:ok];
                         
                         [weakSelf presentViewController:alertController animated:YES completion:nil];
                     ***REMOVED***);
                 ***REMOVED***
                 else
                 ***REMOVED***
                     if (business)
                     ***REMOVED***
                         dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void)***REMOVED***
                             if (cell.tag == indexPath.row)
                             ***REMOVED***
                                 ***REMOVED*** Your Background work
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
                                 
                                 NSData *imageData = [NSData dataWithContentsOfURL:biz.imageURL];
                                 dispatch_async(dispatch_get_main_queue(), ^(void)***REMOVED***
                                     ***REMOVED*** Update your UI
                                     if (cell.tag == indexPath.row)
                                     ***REMOVED***
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
                                         business.didGetDetails = YES;
                                         [weakSelf.cachedDetails addObject:business];
                                         
                                         biz = business;
                                         
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
                             ***REMOVED***
                         ***REMOVED***);
                     ***REMOVED***
                 ***REMOVED***
             ***REMOVED***];
        ***REMOVED***
        
        cell.business = biz;
    ***REMOVED***
    
    return cell;
***REMOVED***

- (void)_hideHud
***REMOVED***
    self.backChevron.enabled = YES;
    self.tableView.userInteractionEnabled = YES;
    self.tabBarController.tabBar.userInteractionEnabled = YES;
    
    [self.hud removeFromSuperview];
***REMOVED***

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
***REMOVED***
    self.didCancelRequest = NO;
    self.didSelectBiz = YES;
    
    dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
        self.backChevron.enabled = NO;
        self.hud = [BVTHUDView hudWithView:self.navigationController.view];
        self.hud.delegate = self;
        self.tableView.userInteractionEnabled = NO;
        self.tabBarController.tabBar.userInteractionEnabled = NO;
    ***REMOVED***);

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    NSArray *sortedArray2 = [[self.businessOptions allKeys] sortedArrayUsingDescriptors: @[descriptor]];
    NSString *key = [sortedArray2 objectAtIndex:indexPath.section];
    NSArray *values = [self.businessOptions valueForKey:key];
    
    NSMutableArray *tempArray = [NSMutableArray array];
    
    if (values.count > 0)
    ***REMOVED***
        for (NSDictionary *dict in values)
        ***REMOVED***
            [tempArray addObject:[[dict allValues] lastObject]];
        ***REMOVED***
    ***REMOVED***
    
    NSSortDescriptor *descriptor2 = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    NSArray *sortedArray = [tempArray sortedArrayUsingDescriptors: @[descriptor2]];
    
    YLPBusiness *selectedBusiness = [sortedArray objectAtIndex:indexPath.row];
    YLPBusiness *cachedBiz = [[self.cachedDetails filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"identifier = %@", selectedBusiness.identifier]] lastObject];
            __weak typeof(self) weakSelf = self;

    if (cachedBiz)
    ***REMOVED***
        [[AppDelegate yelp] reviewsForBusinessWithId:cachedBiz.identifier
                                           completionHandler:^(YLPBusinessReviews * _Nullable reviews, NSError * _Nullable error) ***REMOVED***
                                               dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                                                   NSString *string = error.userInfo[@"NSLocalizedDescription"];
                                                   
                                                   if ([string isEqualToString:@"The Internet connection appears to be offline."])
                                                   ***REMOVED***
                                                       [weakSelf _hideHud];
                                                       
                                                       UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"No Internet" message:@"Check your connection and try again" preferredStyle:UIAlertControllerStyleAlert];
                                                       
                                                       UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                                                       [alertController addAction:ok];
                                                       
                                                       [weakSelf presentViewController:alertController animated:YES completion:nil];
                                                       
                                                   ***REMOVED***
                                                   else
                                                   ***REMOVED***
                                                       ***REMOVED*** *** Get review user photos in advance if they exist, to display from Presentation VC
                                                       dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void)***REMOVED***
                                                           
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
                                                                   [userPhotos addObject:[NSDictionary dictionaryWithObject:image forKey:user.imageURL]];
                                                                   ***REMOVED***
                                                           ***REMOVED***
                                                           cachedBiz.reviews = reviews.reviews;
                                                           cachedBiz.userPhotosArray = userPhotos;
                                                       ***REMOVED***);
                                                       
                                                       dispatch_async(dispatch_get_main_queue(), ^(void)***REMOVED***

                                                           if (!weakSelf.didCancelRequest)
                                                           ***REMOVED***
                                                               [weakSelf _hideHud];
                                                               
                                                               [weakSelf performSegueWithIdentifier:kShowDetailSegue sender:cachedBiz];
                                                           ***REMOVED***
                                                       ***REMOVED***);
                                                   ***REMOVED***
                                                   
                                               ***REMOVED***);
                                           ***REMOVED***];
    ***REMOVED***
    else
    ***REMOVED***
        [[AppDelegate yelp] businessWithId:selectedBusiness.identifier completionHandler:^
         (YLPBusiness *business, NSError *error) ***REMOVED***
             dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                 NSString *string = error.userInfo[@"NSLocalizedDescription"];
                 
                 if ([string isEqualToString:@"The Internet connection appears to be offline."])
                 ***REMOVED***
                     [weakSelf _hideHud];
                     
                     UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"No Internet" message:@"Check your connection and try again" preferredStyle:UIAlertControllerStyleAlert];
                     
                     UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                     [alertController addAction:ok];
                     
                     [weakSelf presentViewController:alertController animated:YES completion:nil];
                     
                 ***REMOVED***
                 else
                 ***REMOVED***
                     dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void)***REMOVED***
                         
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
                     ***REMOVED***);
                     [[AppDelegate yelp] reviewsForBusinessWithId:business.identifier
                                                        completionHandler:^(YLPBusinessReviews * _Nullable reviews, NSError * _Nullable error) ***REMOVED***
                                                            dispatch_async(dispatch_get_main_queue(), ^(void)***REMOVED***
                                                                NSString *string = error.userInfo[@"NSLocalizedDescription"];
                                                                
                                                                if ([string isEqualToString:@"The Internet connection appears to be offline."])
                                                                ***REMOVED***
                                                                    [weakSelf _hideHud];
                                                                    
                                                                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"No Internet" message:@"Check your connection and try again" preferredStyle:UIAlertControllerStyleAlert];
                                                                    
                                                                    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                                                                    [alertController addAction:ok];
                                                                    
                                                                    [weakSelf presentViewController:alertController animated:YES completion:nil];
                                                                    
                                                                ***REMOVED***
                                                                else
                                                                ***REMOVED***
                                                                    ***REMOVED*** *** Get review user photos in advance if they exist, to display from Presentation VC
                                                                    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void)***REMOVED***
                                                                        
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
                                                                        
                                                                    ***REMOVED***);
                                                                    
                                                                    dispatch_async(dispatch_get_main_queue(), ^(void)***REMOVED***
                                                                        
                                                                        if (!weakSelf.didCancelRequest)
                                                                        ***REMOVED***
                                                                            [weakSelf _hideHud];
                                                                            
                                                                            [weakSelf performSegueWithIdentifier:kShowDetailSegue sender:business];
                                                                        ***REMOVED***
                                                                    ***REMOVED***);
                                                                ***REMOVED***
                                                                
                                                            ***REMOVED***);
                                                        ***REMOVED***];
                 ***REMOVED***
                 
             ***REMOVED***);
             
         ***REMOVED***];
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

***REMOVED***
