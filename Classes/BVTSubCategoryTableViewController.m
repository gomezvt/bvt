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
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) NSMutableArray *filteredArray;
@property (nonatomic) double milesKeyValue;
@property (nonatomic, strong) NSString *priceKeyValue;
@property (nonatomic, strong) NSString *openCloseKeyValue;

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
    
    if (!self.priceKeyValue)
    ***REMOVED***
        self.priceKeyValue = @"Any $";
    ***REMOVED***
    
    if (!self.openCloseKeyValue)
    ***REMOVED***
        self.openCloseKeyValue = @"Open/Closed";
    ***REMOVED***
    
    NSMutableArray *arrayPred = [NSMutableArray array];
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
    
    [arrayPred addObject:openClosePredicate];
    
    NSPredicate *comboPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:[arrayPred copy]];
    
    NSArray *sortedArray = [self.filteredResults filteredArrayUsingPredicate:comboPredicate];
    self.titleLabel.text = [NSString stringWithFormat:@"%@ (%lu)", self.subCategoryTitle, (unsigned long)self.sortedArray.count];

    self.filteredResults = sortedArray;
    if (self.filteredResults.count == 0)
    ***REMOVED***
        self.titleLabel.text = [NSString stringWithFormat:@"%@ (0)", self.subCategoryTitle];
        if (!self.label)
        ***REMOVED***
            self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 30.f)];
            self.label.text = @"No sorted results found";
            [self.view addSubview:self.label];
            self.label.center = self.tableView.center;
            self.tableView.separatorColor = [UIColor clearColor];
            self.label.textAlignment = NSTextAlignmentCenter;
            self.label.textColor = [UIColor lightGrayColor];
        ***REMOVED***
        
        self.label.hidden = NO;
    ***REMOVED***
    else
    ***REMOVED***
        self.titleLabel.text = [NSString stringWithFormat:@"%@ (%lu)", self.subCategoryTitle, (unsigned long)self.filteredResults.count];
        self.label.hidden = YES;
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

- (void)viewDidAppear:(BOOL)animated
***REMOVED***
    [super viewDidAppear:animated];
    
    [self sortArrayWithPredicates];
***REMOVED***

- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
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
    
    if (!self.cachedDetails)
    ***REMOVED***
        self.cachedDetails = [[NSMutableArray alloc] init];
    ***REMOVED***
    
    if (self.filteredResults.count > 0)
    ***REMOVED***
        for (YLPBusiness *selectedBusiness in self.filteredResults)
        ***REMOVED***
            if (![[self.cachedDetails filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"phone = %@", selectedBusiness.phone]] lastObject])
            ***REMOVED***
                [[AppDelegate sharedClient] businessWithId:selectedBusiness.identifier completionHandler:^
                 (YLPBusiness *business, NSError *error) ***REMOVED***
                     dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                         
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
                         
                         if (business)
                         ***REMOVED***
                             [self.cachedDetails addObject:business];
                         ***REMOVED***
                         YLPBusiness *last = [self.filteredResults lastObject];
                         if ([business.name isEqualToString:last.name])
                         ***REMOVED***
                             self.filteredResults = self.cachedDetails;
                         ***REMOVED***
                     ***REMOVED***);
                 ***REMOVED***];
            ***REMOVED***
        ***REMOVED***
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
    self.didCancelRequest = YES;
    self.backChevron.enabled = YES;
    self.tableView.userInteractionEnabled = YES;
    [self.hud removeFromSuperview];
    
***REMOVED***

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
***REMOVED***
    self.hud = [BVTHUDView hudWithView:self.navigationController.view];
    self.hud.delegate = self;
    
    self.didCancelRequest = NO;
    self.tableView.userInteractionEnabled = NO;
    self.backChevron.enabled = NO;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    YLPBusiness *selectedBusiness = [self.filteredResults objectAtIndex:indexPath.row];
    YLPBusiness *cachedBiz = [[self.cachedDetails filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"phone = %@", selectedBusiness.phone]] lastObject];
    if (cachedBiz)
    ***REMOVED***
        selectedBusiness = cachedBiz;
    ***REMOVED***
    
    [[AppDelegate sharedClient] reviewsForBusinessWithId:selectedBusiness.identifier
                                       completionHandler:^(YLPBusinessReviews * _Nullable reviews, NSError * _Nullable error) ***REMOVED***
                                           dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                                               
                                               if (error)
                                               ***REMOVED***
                                                   [self _hideHUD];
                                                   
                                                   NSLog(@"Error %@", error.localizedDescription);
                                               ***REMOVED***
                                               ***REMOVED*** *** Get review user photos in advance if they exist, to display from Presentation VC
                                               NSMutableArray *userPhotos = [NSMutableArray array];
                                               for (YLPReview *review in reviews.reviews)
                                               ***REMOVED***
                                                   YLPUser *user = review.user;
                                                   if (user.imageURL)
                                                   ***REMOVED***
                                                       NSData *imageData = [NSData dataWithContentsOfURL:user.imageURL];
                                                       UIImage *image = [UIImage imageWithData:imageData];
                                                       [userPhotos addObject:[NSDictionary dictionaryWithObject:image forKey:user.imageURL]];
                                                   ***REMOVED***
                                               ***REMOVED***
                                               selectedBusiness.reviews = reviews.reviews;
                                               selectedBusiness.userPhotosArray = userPhotos;
                                               
                                               [self _hideHUD];
                                               if (!self.didCancelRequest)
                                               ***REMOVED***
                                                   ***REMOVED*** get biz photos here if we dont have them?
                                                   [self performSegueWithIdentifier:kShowDetailSegue sender:selectedBusiness];
                                               ***REMOVED***
                                           ***REMOVED***);
                                       ***REMOVED***];
    
***REMOVED***

- (void)_hideHUD
***REMOVED***
    self.backChevron.enabled = YES;
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
    return self.filteredResults.count;
***REMOVED***

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    BVTThumbNailTableViewCell *cell = (BVTThumbNailTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.tag = indexPath.row;
    
    YLPBusiness *business = [self.filteredResults objectAtIndex:indexPath.row];
    
    YLPBusiness *cachedBiz = [[self.cachedDetails filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"phone = %@", business.phone]] lastObject];
    if (cachedBiz)
    ***REMOVED***
        business = cachedBiz;
    ***REMOVED***
    
    cell.business = business;
    
    UIImage *image = [UIImage imageNamed:@"placeholder"];
    cell.thumbNailView.image = image;
 
    if (!business.hoursItem)
    ***REMOVED***
        cell.openCloseLabel.text = @"";
    ***REMOVED***
    else if (business.isOpenNow)
    ***REMOVED***
        cell.openCloseLabel.text = @"Open";
        cell.openCloseLabel.textColor = [BVTStyles iconGreen];
    ***REMOVED***
    else
    ***REMOVED***
        cell.openCloseLabel.text = @"Closed";
        cell.openCloseLabel.textColor = [UIColor redColor];
    ***REMOVED***
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^***REMOVED***
        ***REMOVED*** Your Background work
        NSData *imageData = [NSData dataWithContentsOfURL:business.imageURL];
        dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
            ***REMOVED*** Update your UI
            if (cell.tag == indexPath.row)
            ***REMOVED***
                if (imageData)
                ***REMOVED***
                    UIImage *image = [UIImage imageWithData:imageData];
                    cell.thumbNailView.image = image;
                ***REMOVED***
            ***REMOVED***
        ***REMOVED***);
    ***REMOVED***);
    
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
    if ([[segue identifier] isEqualToString:kShowDetailSegue])
    ***REMOVED***
        ***REMOVED*** Get destination view
        BVTDetailTableViewController *vc = [segue destinationViewController];
        vc.selectedBusiness = sender;
    ***REMOVED***
***REMOVED***

***REMOVED***
