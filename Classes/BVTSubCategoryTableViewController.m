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
@property (nonatomic, strong) NSArray *filteredArrayCopy;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) NSMutableArray *filteredArray;
@property (nonatomic, strong) NSString *pricePredicate;
@property (nonatomic, strong) NSString *distancePredicate;
@property (nonatomic, strong) NSString *openClosePredicate;

***REMOVED***

static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";
static NSString *const kThumbNailCell = @"BVTThumbNailTableViewCell";
static NSString *const kShowDetailSegue = @"ShowDetail";

@implementation BVTSubCategoryTableViewController

- (IBAction)didTapPriceButton:(id)sender
***REMOVED***
    NSArray *sortedArray;
    
    if ([self.priceButton.titleLabel.text isEqualToString:@"Any $"])
    ***REMOVED***
        self.pricePredicate = @"$";
        [self.priceButton setTitle:self.pricePredicate forState:UIControlStateNormal];
    ***REMOVED***
    else if ([self.priceButton.titleLabel.text isEqualToString:@"$"])
    ***REMOVED***
        self.pricePredicate = @"$$";
        [self.priceButton setTitle:self.pricePredicate forState:UIControlStateNormal];
    ***REMOVED***
    else if ([self.priceButton.titleLabel.text isEqualToString:@"$$"])
    ***REMOVED***
        self.pricePredicate = @"$$$";
        [self.priceButton setTitle:self.pricePredicate forState:UIControlStateNormal];
    ***REMOVED***
    else if ([self.priceButton.titleLabel.text isEqualToString:@"$$$"])
    ***REMOVED***
        self.pricePredicate = @"$$$$";
        [self.priceButton setTitle:self.pricePredicate forState:UIControlStateNormal];
    ***REMOVED***
    else if ([self.priceButton.titleLabel.text isEqualToString:@"$$$$"])
    ***REMOVED***
        self.pricePredicate = @"Any $";
        [self.priceButton setTitle:self.pricePredicate forState:UIControlStateNormal];
    ***REMOVED***
    
***REMOVED***    sortedArray = [self.filteredArrayCopy filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"price = %@", filterKey]];
    
***REMOVED***    NSPredicate *predicateCString = [NSPredicate predicateWithFormat:@"partCode == %@", [myFilter objectForKey:@"area3"]];
***REMOVED***    NSPredicate *predicateDString = [NSPredicate predicateWithFormat:@"doorNo CONTAINS[cd] %@", [myFilter objectForKey:@"door"]];
***REMOVED***    NSPredicate *predicateEString = [NSPredicate predicateWithFormat:@"doorDesc CONTAINS[cd] %@", [myFilter objectForKey:@"doorDesc"]];
***REMOVED***    
***REMOVED***    NSPredicate *compoundPredicate = [NSCompoundPredicate orPredicateWithSubpredicates:@[predicateAreaString, predicateBString, predicateCString, predicateDString, predicateEString]];
***REMOVED***    
***REMOVED***    NSMutableArray *filteredArray = [NSMutableArray arrayWithArray:[currentInstalls filteredArrayUsingPredicate:compoundPredicate]];
***REMOVED***    currentInstalls = [filteredArray mutableCopy];
    
***REMOVED***

- (IBAction)didTapDistanceButton:(id)sender
***REMOVED***
    if ([self.distanceButton.titleLabel.text isEqualToString:@"5 miles"])
    ***REMOVED***
        [self.distanceButton setTitle:@"10 miles" forState:UIControlStateNormal];
    ***REMOVED***
    else if ([self.distanceButton.titleLabel.text isEqualToString:@"10 miles"])
    ***REMOVED***
        [self.distanceButton setTitle:@"25 miles" forState:UIControlStateNormal];
    ***REMOVED***
    else if ([self.distanceButton.titleLabel.text isEqualToString:@"25 miles"])
    ***REMOVED***
        [self.distanceButton setTitle:@"50 miles" forState:UIControlStateNormal];
    ***REMOVED***
    else if ([self.distanceButton.titleLabel.text isEqualToString:@"50 miles"])
    ***REMOVED***
        [self.distanceButton setTitle:@"100 miles" forState:UIControlStateNormal];
    ***REMOVED***
    else if ([self.distanceButton.titleLabel.text isEqualToString:@"100 miles"])
    ***REMOVED***
        [self.distanceButton setTitle:@"5 miles" forState:UIControlStateNormal];
    ***REMOVED***
    

***REMOVED***    NSArray *array = [self.filteredArrayCopy filteredArrayUsingPredicate:[]
***REMOVED***    CLLocationDistance meters = [newLocation distanceFromLocation:oldLocation];
***REMOVED***

- (IBAction)didTapOpenButton:(id)sender
***REMOVED***
        NSArray *sortedArray;
    if ([self.openNowButton.titleLabel.text isEqualToString:@"Closed"])
    ***REMOVED***
        [self.openNowButton setTitle:@"Open" forState:UIControlStateNormal];
        sortedArray = [self.filteredArrayCopy filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"isOpenNow = %@", @(YES)]];
    ***REMOVED***
    else if ([self.openNowButton.titleLabel.text isEqualToString:@"Open"])
    ***REMOVED***
        [self.openNowButton setTitle:@"Closed" forState:UIControlStateNormal];

    ***REMOVED***
    
    sortedArray = [self.filteredArrayCopy filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"isOpenNow = %@", @(NO)]];
    
    
***REMOVED***

- (void)evaluateSortedItemsState:(NSArray *)items
***REMOVED***
    
    if (items.count == 0)
    ***REMOVED***
        self.label.hidden = NO;
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
    ***REMOVED***
    else
    ***REMOVED***
        self.label.hidden = YES;
    ***REMOVED***
    
    
    [self.tableView reloadData];
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

- (void) dealloc
***REMOVED***
    ***REMOVED*** If you don't remove yourself as an observer, the Notification Center
    ***REMOVED*** will continue to try and send notification objects to the deallocated
    ***REMOVED*** object.
    [[NSNotificationCenter defaultCenter] removeObserver:self];
***REMOVED***


- (void)didReceiveBusinessesNotification:(NSNotification *)notification
***REMOVED***
    if ([[notification name] isEqualToString:@"BVTReceivedBusinessesIdNotification"])
    ***REMOVED***
        YLPBusiness *business = notification.object;
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
        
        [self.filteredArray addObject:business];
        
        
        if (self.filteredArray.count == self.filteredResults.count)
        ***REMOVED***
            dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                NSArray *descriptor = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
                NSArray *sortedArray = [self.filteredArray sortedArrayUsingDescriptors:descriptor];
                self.filteredResults = sortedArray;
                [self.cachedDetails setObject:self.filteredResults forKey:self.subCategoryTitle];
                [self.tableView reloadData];
                [self _hideHUD];
                
                [self.openNowButton setHidden:NO];

***REMOVED***                [self performSegueWithIdentifier:kShowSubCategorySegue sender:@[ self.selectionTitle, sortedArray ]];
            ***REMOVED***);
        ***REMOVED***
    ***REMOVED***
***REMOVED***


- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation

***REMOVED***
    
***REMOVED***

- (void)viewDidLoad
***REMOVED***
    
    [super viewDidLoad];

    self.filteredArrayCopy = self.filteredResults;

    


    
    
    self.titleLabel.text = [NSString stringWithFormat:@"%@ (%lu)", self.subCategoryTitle, (unsigned long)self.filteredArrayCopy.count];
    
    if (!self.cachedDetails)
    ***REMOVED***
        self.cachedDetails = [NSMutableDictionary dictionary];
    ***REMOVED***
    
    [self.openNowButton setHidden:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveBusinessesNotification:)
                                                 name:@"BVTReceivedBusinessesIdNotification"
                                               object:nil];
    
    NSArray *details = [self.cachedDetails valueForKey:self.subCategoryTitle];
    if (details.count > 0)
    ***REMOVED***
        self.filteredResults = details;
        [self.openNowButton setHidden:NO];

    ***REMOVED***
    else
    ***REMOVED***
        self.filteredArray = [NSMutableArray array];

        if (self.filteredResults.count > 0)
        ***REMOVED***
***REMOVED***            self.hud = [BVTHUDView hudWithView:self.navigationController.view];
***REMOVED***            self.hud.delegate = self;
***REMOVED***            
***REMOVED***            self.didCancelRequest = NO;
***REMOVED***            self.tableView.userInteractionEnabled = NO;
***REMOVED***            self.backChevron.enabled = NO;
            for (YLPBusiness *selectedBusiness in self.filteredResults)
            ***REMOVED***
                
                
                [[AppDelegate sharedClient] businessWithId:selectedBusiness.identifier completionHandler:^
                 (YLPBusiness *business, NSError *error) ***REMOVED***
                     
                     if (error) ***REMOVED***
                         
                         dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
***REMOVED***                             [self _hideHUD];
                             
                             UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:[NSString stringWithFormat:@"%@", error] preferredStyle:UIAlertControllerStyleAlert];
                             
                             UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                             [alertController addAction:ok];
                             
                             [self presentViewController:alertController animated:YES completion:nil];
                             
                         ***REMOVED***);
                     ***REMOVED***
                     
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

                 
                 [[AppDelegate sharedClient] reviewsForBusinessWithId:selectedBusiness.identifier
                                                    completionHandler:^(YLPBusinessReviews * _Nullable reviews, NSError * _Nullable error) ***REMOVED***
                                                        if (error)
                                                        ***REMOVED***
                                                            
                                                        ***REMOVED***
                                                        dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
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
    cell.business = business;
    
    UIImage *image = [UIImage imageNamed:@"placeholder"];
    cell.thumbNailView.image = image;
    
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
