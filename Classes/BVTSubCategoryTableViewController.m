***REMOVED***
***REMOVED***  BVTDetailTableViewController.m
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/20/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import "BVTSubCategoryTableViewController.h"

#import "BVTDetailTableViewController.h"
#import "BVTHeaderTitleView.h"
#import "BVTThumbNailTableViewCell.h"
#import "YLPBusiness.h"
***REMOVED***
#import "YLPClient+Business.h"
#import "YLPBusiness.h"
#import "YLPSearch.h"
#import "BVTHUDView.h"
#import "YLPClient+Reviews.h"
#import "YLPBusinessReviews.h"
#import "BVTStyles.h"
#import "YLPReview.h"
#import "YLPUser.h"

@interface BVTSubCategoryTableViewController ()
<BVTHUDViewDelegate>


@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *backChevron;
@property (nonatomic, strong) BVTHUDView *hud;
@property (nonatomic) BOOL didCancelRequest;
@property (nonatomic, weak) IBOutlet UIButton *starSortIcon;
@property (nonatomic, strong) NSMutableArray *sortedArray;
@property (nonatomic, weak) IBOutlet UIButton *priceButton;
@property (nonatomic, weak) IBOutlet UIButton *distanceButton;
@property (nonatomic, weak) IBOutlet UIButton *openNowButton;
@property (nonatomic, strong) IBOutlet UILabel *label;
@property (nonatomic, strong) NSMutableArray *filteredArray;
@property (nonatomic) double milesKeyValue;
@property (nonatomic, strong) NSString *priceKeyValue;
@property (nonatomic, strong) NSString *openCloseKeyValue;
@property (nonatomic, strong) NSMutableArray *displayArray;
@property (nonatomic) BOOL gotDetails;
@property (nonatomic, strong) NSMutableArray *originalFilteredResults;
@property (nonatomic) BOOL isLargePhone;
@property (nonatomic) BOOL didSelectBiz;

***REMOVED***

static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";
static NSString *const kThumbNailCell = @"BVTThumbNailTableViewCell";
static NSString *const kShowDetailSegue = @"ShowDetail";

@implementation BVTSubCategoryTableViewController

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
    
        NSPredicate *comboPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:arrayPred];
        self.filteredResults  = [[self.originalFilteredResults filteredArrayUsingPredicate:comboPredicate] mutableCopy];
        
        if (self.filteredResults.count == 0)
        ***REMOVED***
            self.titleLabel.text = [NSString stringWithFormat:@"%@ (0)", self.subCategoryTitle];
            self.label.text = @"No sorted results found.";
        ***REMOVED***
        else
        ***REMOVED***
            self.titleLabel.text = [NSString stringWithFormat:@"%@ (%lu)", self.subCategoryTitle, (unsigned long)self.filteredResults.count];
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

- (IBAction)didTapStarSortIcon:(id)sender
***REMOVED***
    self.starSortIcon.selected = ![self.starSortIcon isSelected];
    
    if (self.starSortIcon.isSelected)
    ***REMOVED***
        NSSortDescriptor *nameDescriptor =  [NSSortDescriptor sortDescriptorWithKey:@"rating" ascending:YES];
        self.filteredResults = [[self.filteredResults sortedArrayUsingDescriptors: @[nameDescriptor]] mutableCopy];
        
    ***REMOVED***
    else
    ***REMOVED***
        NSSortDescriptor *nameDescriptor =  [NSSortDescriptor sortDescriptorWithKey:@"rating" ascending:NO];
        self.filteredResults = [[self.filteredResults sortedArrayUsingDescriptors: @[nameDescriptor]] mutableCopy];
    ***REMOVED***
    
    [self.tableView reloadData];
***REMOVED***

#pragma mark - View Life Cycle

- (void)awakeFromNib
***REMOVED***
    [super awakeFromNib];
    
    self.sortedArray = [NSMutableArray array];
    
    
    UINib *nibTitleView = [UINib nibWithNibName:kHeaderTitleViewNib bundle:nil];
    BVTHeaderTitleView *headerTitleView = [[nibTitleView instantiateWithOwner:self options:nil] objectAtIndex:0];
    headerTitleView.titleViewLabelConstraint.constant = -20.f;
    self.navigationItem.titleView = headerTitleView;
    self.navigationController.navigationBar.barTintColor = [BVTStyles iconGreen];
***REMOVED***

- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
    self.displayArray = [[NSMutableArray alloc] init];
    
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

    self.label.text = @"";
    self.originalFilteredResults = [self.filteredResults mutableCopy];
    
    NSSortDescriptor *nameDescriptor =  [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    self.filteredResults = [self.originalFilteredResults sortedArrayUsingDescriptors: @[nameDescriptor]];
    
    
    if (!self.cachedDetails)
    ***REMOVED***
        self.cachedDetails = [[NSMutableDictionary alloc] init];
    ***REMOVED***
    
    self.titleLabel.text = [NSString stringWithFormat:@"%@ (%lu)", self.subCategoryTitle, (unsigned long)self.filteredResults.count];
    
    AppDelegate *appDel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if (!appDel.userLocation)
    ***REMOVED***
        [self.distanceButton setHidden:YES];
    ***REMOVED***
    else
    ***REMOVED***
        [self.distanceButton setHidden:NO];
    ***REMOVED***

    
    UINib *cellNib = [UINib nibWithNibName:kThumbNailCell bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"Cell"];
    
    self.tableView.estimatedRowHeight = 44.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
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
***REMOVED***

- (void)didTapHUDCancelButton
***REMOVED***
    dispatch_async(dispatch_get_main_queue(), ^(void)***REMOVED***

    self.didCancelRequest = YES;
    self.backChevron.enabled = YES;
    self.tableView.userInteractionEnabled = YES;
    self.tabBarController.tabBar.userInteractionEnabled = YES;
    
    [self.hud removeFromSuperview];
    ***REMOVED***);
***REMOVED***

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
***REMOVED***
    self.didCancelRequest = NO;
    self.didSelectBiz = YES;
    
    dispatch_async(dispatch_get_main_queue(), ^(void)***REMOVED***
        self.backChevron.enabled = NO;
        self.hud = [BVTHUDView hudWithView:self.navigationController.view];
        self.hud.delegate = self;
        self.tableView.userInteractionEnabled = NO;
        self.tabBarController.tabBar.userInteractionEnabled = NO;
    ***REMOVED***);
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    YLPBusiness *selectedBusiness = [self.filteredResults objectAtIndex:indexPath.row];
    YLPBusiness *cachedBiz = [[self.displayArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"identifier = %@", selectedBusiness.identifier]] lastObject];
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
                                                           cachedBiz.reviews = reviews.reviews;
                                                           cachedBiz.userPhotosArray = userPhotos;
                                                       ***REMOVED***);
                                                       
                                                       dispatch_async(dispatch_get_main_queue(), ^(void)***REMOVED***

                                                           if (!weakSelf.didCancelRequest)
                                                           ***REMOVED***
                                                               [weakSelf _hideHUD];
                                                               
                                                               [weakSelf performSegueWithIdentifier:kShowDetailSegue sender:cachedBiz];
                                                           ***REMOVED***
                                                       ***REMOVED***);

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
                     [[AppDelegate sharedClient] reviewsForBusinessWithId:business.identifier
                                                        completionHandler:^(YLPBusinessReviews * _Nullable reviews, NSError * _Nullable error) ***REMOVED***
                                                            dispatch_async(dispatch_get_main_queue(), ^(void)***REMOVED***
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
                                                                            [weakSelf _hideHUD];
                                                                            
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
    return self.filteredResults.count;
***REMOVED***

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    BVTThumbNailTableViewCell *cell = (BVTThumbNailTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.tag = indexPath.row;
    
    dispatch_async(dispatch_get_main_queue(), ^(void)***REMOVED***
        if (cell.tag == indexPath.row)
        ***REMOVED***
            cell.openCloseLabel.text = @"";
            cell.secondaryOpenCloseLabel.text = @"";
            cell.thumbNailView.image = [UIImage imageNamed:@"placeholder"];
        ***REMOVED***
    ***REMOVED***);
    
    __block YLPBusiness *biz = [self.filteredResults objectAtIndex:indexPath.row];
    
    NSArray *cachedBizArray = [self.cachedDetails valueForKey:self.subCategoryTitle];
    YLPBusiness *cachedBiz = [[cachedBizArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"identifier = %@", biz.identifier]] lastObject];
    
    if (cachedBiz)
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
                     dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void)***REMOVED***
                         ***REMOVED*** Your Background work
                         if (cell.tag == indexPath.row)
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
                             ***REMOVED***
                             
                             NSData *imageData = [NSData dataWithContentsOfURL:business.imageURL];
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
                                     [weakSelf.displayArray addObject:business];
                                     [weakSelf.cachedDetails setObject:weakSelf.displayArray forKey:weakSelf.subCategoryTitle];
                                     biz = business;
                                     
                                     YLPBusiness *match = [[weakSelf.originalFilteredResults filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"identifier = %@", business.identifier]] lastObject];
                                     
                                     if (match)
                                     ***REMOVED***
                                         NSInteger index = [weakSelf.originalFilteredResults indexOfObject:match];
                                         [weakSelf.originalFilteredResults replaceObjectAtIndex:index withObject:business];
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
                         ***REMOVED***
                     ***REMOVED***);
                 ***REMOVED***
             ***REMOVED***
         ***REMOVED***];
    ***REMOVED***
    
                                     
    
    cell.business = biz;
    
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

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
***REMOVED***
    self.didSelectBiz = NO;

    if ([[segue identifier] isEqualToString:kShowDetailSegue])
    ***REMOVED***
        ***REMOVED*** Get destination view
        BVTDetailTableViewController *vc = [segue destinationViewController];
        vc.selectedBusiness = sender;
    ***REMOVED***
***REMOVED***

***REMOVED***
