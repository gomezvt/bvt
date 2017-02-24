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

#import "BVTStyles.h"

@interface BVTSubCategoryTableViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *backChevron;

***REMOVED***

static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";
static NSString *const kThumbNailCell = @"BVTThumbNailTableViewCell";
static NSString *const kShowDetailSegue = @"ShowDetail";

@implementation BVTSubCategoryTableViewController

#pragma mark - View Life Cycle

- (void)awakeFromNib
***REMOVED***
    [super awakeFromNib];
    
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
***REMOVED***

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
***REMOVED***
    BVTHUDView *hud = [BVTHUDView hudWithView:self.navigationController.view];
    self.tableView.userInteractionEnabled = NO;
    self.backChevron.enabled = NO;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    YLPBusiness *selectedBusiness = [self.filteredResults objectAtIndex:indexPath.row];
    [[AppDelegate sharedClient] businessWithId:selectedBusiness.identifier completionHandler:^
     (YLPBusiness *business, NSError *error) ***REMOVED***
         if (error) ***REMOVED***
             UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:[NSString stringWithFormat:@"%@", error] preferredStyle:UIAlertControllerStyleAlert];
             
             UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
             [alertController addAction:ok];
             
             [self presentViewController:alertController animated:YES completion:nil];
             self.backChevron.enabled = YES;
             self.tableView.userInteractionEnabled = YES;
             [hud removeFromSuperview];
         ***REMOVED***
         else
         ***REMOVED***
             dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                 NSMutableArray *photosArray = [NSMutableArray array];
                 if (business.photos.count > 0)
                 ***REMOVED***
                     for (NSString *photoStr in business.photos)
                     ***REMOVED***
                         NSURL *url = [NSURL URLWithString:photoStr];
                         NSData *imageData = [NSData dataWithContentsOfURL:url];
                         UIImage *image = [UIImage imageWithData:imageData];
                         [photosArray addObject:image];
                     ***REMOVED***
                 ***REMOVED***
                 business.photos = photosArray;
                 
                 [[AppDelegate sharedClient] reviewsWithId:business.identifier completionHandler:^
                  (YLPBusiness *reviewsBiz, NSError *error) ***REMOVED***
                      dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                          business.reviews = reviewsBiz.reviews;
                          [self performSegueWithIdentifier:kShowDetailSegue sender:business];
                          self.backChevron.enabled = YES;
                          self.tableView.userInteractionEnabled = YES;
                          [hud removeFromSuperview];
                      ***REMOVED***);
                  ***REMOVED***];
             ***REMOVED***);
         ***REMOVED***

         
     ***REMOVED***];
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
