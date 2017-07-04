***REMOVED***
***REMOVED***  BVTAboutTableViewController.m
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/20/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import "BVTAboutTableViewController.h"
#import "BVTHeaderTitleView.h"
#import "BVTAboutTableViewCell.h"
#import "BVTStyles.h"
#import <MessageUI/MessageUI.h>
***REMOVED***

@interface BVTAboutTableViewController () <UINavigationControllerDelegate, MFMailComposeViewControllerDelegate>

@property (nonatomic, strong) BVTHeaderTitleView *headerTitleView;
@property (nonatomic, strong) GADBannerView *bannerView;


***REMOVED***

static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";
static NSString *const kAboutTableViewNib = @"BVTAboutTableViewCell";

@implementation BVTAboutTableViewController

- (void)awakeFromNib
***REMOVED***
    [super awakeFromNib];
    
    UINib *nibTitleView = [UINib nibWithNibName:kHeaderTitleViewNib bundle:nil];
    self.headerTitleView = [[nibTitleView instantiateWithOwner:self options:nil] objectAtIndex:0];
    self.navigationItem.titleView = self.headerTitleView;
    self.navigationController.navigationBar.barTintColor = [BVTStyles iconGreen];
***REMOVED***

- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 60.f, 0);
    
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
    
    UINib *aboutCellNib = [UINib nibWithNibName:kAboutTableViewNib bundle:nil];
    [self.tableView registerNib:aboutCellNib forCellReuseIdentifier:@"AboutCell"];
    
    self.tableView.estimatedRowHeight = 44.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.sectionHeaderHeight = 44.f;

    self.tableView.tableFooterView = [UIView new];
***REMOVED***

***REMOVED***- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section ***REMOVED***
***REMOVED***    
***REMOVED***    UILabel *myLabel = [[UILabel alloc] init];
***REMOVED***    myLabel.frame = CGRectMake(0, 0, self.tableView.frame.size.height, 20.f);
***REMOVED***    myLabel.backgroundColor = [UIColor redColor];
***REMOVED***    myLabel.textColor = [UIColor darkGrayColor];
***REMOVED***    myLabel.font = [UIFont systemFontOfSize:20.f weight:2.f];
***REMOVED***    myLabel.text = [self tableView:tableView titleForHeaderInSection:section];
***REMOVED***    
***REMOVED***    UIView *headerView = [[UIView alloc] init];
***REMOVED***    [headerView addSubview:myLabel];
***REMOVED***    
***REMOVED***    return headerView;
***REMOVED******REMOVED***

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
***REMOVED***
    NSString *title;
    if (section == 0)
    ***REMOVED***
        title = @"About Burlingtonian";
    ***REMOVED***
    else
    ***REMOVED***
        title = @"Your Feedback is Valuable";
    ***REMOVED***
    
    return title;
***REMOVED***

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
***REMOVED***
    return 2;
***REMOVED***

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
***REMOVED***
    NSInteger rows = 0;
    
    if (section == 0)
    ***REMOVED***
        rows = 4;
    ***REMOVED***
    else
    ***REMOVED***
        rows = 3;
    ***REMOVED***
    
    return rows;
***REMOVED***




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
***REMOVED***
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0 && indexPath.row == 1)
    ***REMOVED***
        [self performSegueWithIdentifier:@"ShowDisclaimer" sender:nil];
    ***REMOVED***
    else if (indexPath.section == 1)
    ***REMOVED***
        if (indexPath.row == 1)
        ***REMOVED***
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https:***REMOVED***itunes.apple.com/us/app/burlingtonian-live-like-a-local-in-vermont/id581817418?mt=8"]  options:@***REMOVED******REMOVED*** completionHandler:^(BOOL success) ***REMOVED***
                
                NSLog(@"");
            ***REMOVED***];
        ***REMOVED***
        else if (indexPath.row == 2)
        ***REMOVED***
            MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
            mail.mailComposeDelegate = self;
            [mail setSubject:@"Burlingtonian Feedback"];
            [mail setMessageBody:@"" isHTML:NO];
            [mail setToRecipients:@[@"greg@theburlingtonian.com"]];
            
            [self presentViewController:mail animated:YES completion:nil];
        ***REMOVED***
    ***REMOVED***
***REMOVED***

- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error;
***REMOVED***
    [self dismissViewControllerAnimated:YES completion:nil];
***REMOVED***

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    NSString *identifier = @"Cell";
    
    if (indexPath.section == 0)
    ***REMOVED***
        if (indexPath.row == 3)
        ***REMOVED***
            identifier = @"AboutCell";
        ***REMOVED***
    ***REMOVED***
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.textLabel.textColor = [UIColor darkGrayColor];
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    
    if (indexPath.section == 0)
    ***REMOVED***
        if (indexPath.row == 0)
        ***REMOVED***
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textLabel.text = @"Burlingtonian was created by Greg, a native Vermonter, to serve as a homegrown hub for tourism and travel information for people in and around the Burlington, VT area.";
        ***REMOVED***
        else if (indexPath.row == 1)
        ***REMOVED***
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"Privacy and Terms of Use";
        ***REMOVED***
        else if (indexPath.row == 2)
        ***REMOVED***
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textLabel.text = @"Version 2.0.1";
        ***REMOVED***
        else
        ***REMOVED***
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        ***REMOVED***
    ***REMOVED***
    else
    ***REMOVED***
        if (indexPath.row == 0)
        ***REMOVED***
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textLabel.text = @"Your input is very important and can help make Burlingtonian better. Please take a moment to leave your feedback.";
        ***REMOVED***
        else if (indexPath.row == 1)
        ***REMOVED***
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"Write a review or rate us on the App Store";
        ***REMOVED***
        else
        ***REMOVED***
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"Send an email to Greg";
        ***REMOVED***
    ***REMOVED***
    
    return cell;
***REMOVED***

***REMOVED***
