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
#import "BVTSurpriseRecommendationsTableViewCell.h"

@interface BVTSurpriseRecommendationsTableViewController ()
<BVTHUDViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *backChevron;
@property (nonatomic, strong) BVTHUDView *hud;
@property (nonatomic) BOOL didCancelRequest;
@property (nonatomic, strong) NSMutableDictionary *orderedDict;
@property (nonatomic, strong) BVTTableViewSectionHeaderView *headerView;

***REMOVED***

static NSString *const kTableViewSectionHeaderView = @"BVTTableViewSectionHeaderView";

static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";
static NSString *const kRecommendationsCell = @"BVTSurpriseRecommendationsTableViewCell";
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
    
    self.orderedDict = [NSMutableDictionary dictionary];
    
    UINib *nibTitleView = [UINib nibWithNibName:kHeaderTitleViewNib bundle:nil];
    BVTHeaderTitleView *headerTitleView = [[nibTitleView instantiateWithOwner:self options:nil] objectAtIndex:0];
    headerTitleView.titleViewLabelConstraint.constant = -20.f;
    self.navigationItem.titleView = headerTitleView;
    self.navigationController.navigationBar.barTintColor = [BVTStyles iconGreen];
    
    UINib *headerView = [UINib nibWithNibName:kTableViewSectionHeaderView bundle:nil];
    [self.tableView registerNib:headerView forHeaderFooterViewReuseIdentifier:kTableViewSectionHeaderView];
***REMOVED***

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
***REMOVED***
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    NSArray *sortedArray2 = [[self.businessOptions allKeys] sortedArrayUsingDescriptors: @[descriptor]];
    NSString *key = [sortedArray2 objectAtIndex:section];
    NSArray *array = [self.businessOptions valueForKey:key];
    
    if (array.count > 0)
    ***REMOVED***
        return key;
    ***REMOVED***
    
    return nil;
***REMOVED***

- (IBAction)didTapBack:(id)sender
***REMOVED***
    [self.navigationController popViewControllerAnimated:YES];
***REMOVED***

- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
    self.tableView.sectionHeaderHeight = 44.f;
    
    UINib *cellNib = [UINib nibWithNibName:kRecommendationsCell bundle:nil];
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
    BVTSurpriseRecommendationsTableViewCell *cell = (BVTSurpriseRecommendationsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
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
        NSSortDescriptor *nameDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
        NSArray *bizArray = [tempArray sortedArrayUsingDescriptors: @[nameDescriptor]];
        
        YLPBusiness *biz = [bizArray objectAtIndex:indexPath.row];
        cell.business = biz;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.numberOfLines = 0;
        
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
    ***REMOVED***
    
    return cell;
***REMOVED***


- (void)_hideHud
***REMOVED***
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
    NSSortDescriptor *nameDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    NSArray *bizArray = [tempArray sortedArrayUsingDescriptors: @[nameDescriptor]];
    
    YLPBusiness *selectedBusiness = [bizArray objectAtIndex:indexPath.row];
    
    
    [[AppDelegate sharedClient] businessWithId:selectedBusiness.identifier completionHandler:^
     (YLPBusiness *business, NSError *error) ***REMOVED***
         dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
             if (error) ***REMOVED***
                 [self _hideHud];
                 
                 NSLog(@"Error %@", error.localizedDescription);
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
                                                                [self _hideHud];
                                                                
                                                                NSLog(@"Error %@", error.localizedDescription);
                                                            ***REMOVED***
                                                            else
                                                            ***REMOVED***
                                                                [self _hideHud];
                                                                
                                                                ***REMOVED*** *** Get review user photos in advance if they exist, to display from Presentation VC
                                                                NSMutableArray *userPhotos = [NSMutableArray array];
                                                                for (YLPReview *review in reviews.reviews)
                                                                ***REMOVED***
                                                                    YLPUser *user = review.user;
                                                                    if (user.imageURL)
                                                                    ***REMOVED***
                                                                        NSData *imageData = [NSData dataWithContentsOfURL:user.imageURL];
                                                                        UIImage *image = [UIImage imageNamed:@"placeholder"];
                                                                        if (imageData)
                                                                        ***REMOVED***
                                                                            image = [UIImage imageWithData:imageData];
                                                                        ***REMOVED***
                                                                        [userPhotos addObject:[NSDictionary dictionaryWithObject:image forKey:user.imageURL]];                                                                ***REMOVED***
                                                                ***REMOVED***
                                                                business.reviews = reviews.reviews;
                                                                business.userPhotosArray = userPhotos;
                                                                
                                                                if (!self.didCancelRequest)
                                                                ***REMOVED***
                                                                    [self performSegueWithIdentifier:kShowDetailSegue sender:business];
                                                                ***REMOVED***
                                                            ***REMOVED***
                                                            
                                                        ***REMOVED***);
                                                    ***REMOVED***];
             ***REMOVED***
             
         ***REMOVED***);
         
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
