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

***REMOVED***

static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";
static NSString *const kThumbNailCell = @"BVTThumbNailTableViewCell";
static NSString *const kShowDetailSegue = @"ShowDetail";

@implementation BVTSubCategoryTableViewController

- (IBAction)didTapStarSortIcon:(id)sender
***REMOVED***
    if (self.sortedArray.count > 0)
    ***REMOVED***
        NSSortDescriptor *nameDescriptor =  [NSSortDescriptor sortDescriptorWithKey:@"rating" ascending:YES];
        self.filteredResults = [[self.sortedArray sortedArrayUsingDescriptors: @[nameDescriptor]] mutableCopy];
        [self.sortedArray removeAllObjects];

    ***REMOVED***
    else
    ***REMOVED***
        NSSortDescriptor *nameDescriptor =  [NSSortDescriptor sortDescriptorWithKey:@"rating" ascending:NO];
        self.sortedArray = [[self.filteredResults sortedArrayUsingDescriptors: @[nameDescriptor]] mutableCopy];
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
    
    self.titleLabel.text = self.subCategoryTitle;

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
    [[AppDelegate sharedClient] businessWithId:selectedBusiness.identifier completionHandler:^
     (YLPBusiness *business, NSError *error) ***REMOVED***
         if (error) ***REMOVED***
             UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:[NSString stringWithFormat:@"%@", error] preferredStyle:UIAlertControllerStyleAlert];
             
             UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
             [alertController addAction:ok];
             
             [self presentViewController:alertController animated:YES completion:nil];
             dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                 [self _hideHUD];

             ***REMOVED***);
         ***REMOVED***
         else
         ***REMOVED***
             ***REMOVED*** *** Get business photos in advance if they exist, to display from Presentation VC
             dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
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
                                                            business.reviews = reviews.reviews;
                                                            business.userPhotosArray = userPhotos;

                                                            [self _hideHUD];
                                                            if (!self.didCancelRequest)
                                                            ***REMOVED***
                                                                [self performSegueWithIdentifier:kShowDetailSegue sender:business];
                                                            ***REMOVED***
                                                        ***REMOVED***);
                                                    ***REMOVED***];
             ***REMOVED***);
         ***REMOVED***

         
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
    
    NSArray *array;
    if (self.sortedArray.count > 0)
    ***REMOVED***
        array = self.sortedArray;
    ***REMOVED***
    else
    ***REMOVED***
        array = self.filteredResults;
    ***REMOVED***
    YLPBusiness *business = [array objectAtIndex:indexPath.row];
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
