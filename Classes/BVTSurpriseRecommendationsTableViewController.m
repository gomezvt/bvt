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
@interface BVTSurpriseRecommendationsTableViewController ()     <BVTHUDViewDelegate>


@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *backChevron;
@property (nonatomic, strong) BVTHUDView *hud;
@property (nonatomic) BOOL didCancelRequest;

***REMOVED***

static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";
static NSString *const kThumbNailCell = @"BVTThumbNailTableViewCell";
static NSString *const kShowDetailSegue = @"ShowDetail";

@implementation BVTSurpriseRecommendationsTableViewController

- (void)didTapHUDCancelButton
***REMOVED***
    self.didCancelRequest = YES;
    self.backChevron.enabled = YES;
    self.tableView.userInteractionEnabled = YES;
    [self.hud removeFromSuperview];
***REMOVED***

- (void)awakeFromNib
***REMOVED***
    [super awakeFromNib];
    
    UINib *nibTitleView = [UINib nibWithNibName:kHeaderTitleViewNib bundle:nil];
    BVTHeaderTitleView *headerTitleView = [[nibTitleView instantiateWithOwner:self options:nil] objectAtIndex:0];
    headerTitleView.titleViewLabelConstraint.constant = -20.f;
    self.navigationItem.titleView = headerTitleView;
    self.navigationController.navigationBar.barTintColor = [BVTStyles iconGreen];
    
***REMOVED***

- (IBAction)didTapBack:(id)sender
***REMOVED***
    [self.navigationController popViewControllerAnimated:YES];
***REMOVED***

- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
    UINib *cellNib = [UINib nibWithNibName:kThumbNailCell bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"Cell"];
    
    self.tableView.estimatedRowHeight = 44.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    ***REMOVED*** Uncomment the following line to preserve selection between presentations.
    ***REMOVED*** self.clearsSelectionOnViewWillAppear = NO;
    
    ***REMOVED*** Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    ***REMOVED*** self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    NSArray *key = [self.businessOptions allValues][section];
***REMOVED***    for (NSString *category in k)
***REMOVED***    ***REMOVED***
***REMOVED***        if (![self.subCategories containsObject:category])
***REMOVED***        ***REMOVED***
***REMOVED***            [self.subCategories addObject:category];
***REMOVED***        ***REMOVED***
***REMOVED***    ***REMOVED***
    return key.count;
***REMOVED***

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
***REMOVED***
    NSArray *array = [self.businessOptions allValues][section];
    if (array.count > 0)
    ***REMOVED***
        return [self.businessOptions allKeys][section];
    ***REMOVED***
    
    return nil;
***REMOVED***

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    BVTThumbNailTableViewCell *cell = (BVTThumbNailTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.tag = indexPath.row;
    
    NSArray *sectionValues = [self.businessOptions allValues][indexPath.section];
    NSDictionary *businessDict = sectionValues[indexPath.row];
    YLPBusiness *biz = [[businessDict allValues] lastObject];
    
    cell.business = biz;
    
    UIImage *image = [UIImage imageNamed:@"placeholder"];
    cell.thumbNailView.image = image;
    
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
                    cell.thumbNailView.image = image;
                ***REMOVED***
            ***REMOVED***
        ***REMOVED***);
    ***REMOVED***);
    
    return cell;
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
    
    NSArray *sectionValues = [self.businessOptions allValues][indexPath.section];
    NSDictionary *businessDict = sectionValues[indexPath.row];
    YLPBusiness *selectedBusiness = [[businessDict allValues] lastObject];
    
    [[AppDelegate sharedClient] businessWithId:selectedBusiness.identifier completionHandler:^
     (YLPBusiness *business, NSError *error) ***REMOVED***
         if (error) ***REMOVED***
             UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:[NSString stringWithFormat:@"%@", error] preferredStyle:UIAlertControllerStyleAlert];
             
             UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
             [alertController addAction:ok];
             
             [self presentViewController:alertController animated:YES completion:nil];
             self.backChevron.enabled = YES;
             self.tableView.userInteractionEnabled = YES;
             [self.hud removeFromSuperview];
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
***REMOVED***                                                            NSMutableArray *userPhotos = [NSMutableArray array];
***REMOVED***                                                            for (YLPReview *review in reviews.reviews)
***REMOVED***                                                            ***REMOVED***
***REMOVED***                                                                YLPUser *user = review.user;
***REMOVED***                                                                if (user.imageURL)
***REMOVED***                                                                ***REMOVED***
***REMOVED***                                                                    NSData *imageData = [NSData dataWithContentsOfURL:user.imageURL];
***REMOVED***                                                                    UIImage *image = [UIImage imageWithData:imageData];
***REMOVED***                                                                    [userPhotos addObject:image];
***REMOVED***                                                                ***REMOVED***
***REMOVED***                                                            ***REMOVED***
                                                            business.reviews = reviews.reviews;
***REMOVED***                                                            business.userPhotosArray = userPhotos;
                                                            self.backChevron.enabled = YES;
                                                            self.tableView.userInteractionEnabled = YES;
                                                            [self.hud removeFromSuperview];
                                                            
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
