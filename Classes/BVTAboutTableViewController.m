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

@interface BVTAboutTableViewController () <UINavigationControllerDelegate, MFMailComposeViewControllerDelegate>

@property (nonatomic, strong) BVTHeaderTitleView *headerTitleView;

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
        
    UINib *aboutCellNib = [UINib nibWithNibName:kAboutTableViewNib bundle:nil];
    [self.tableView registerNib:aboutCellNib forCellReuseIdentifier:@"AboutCell"];
    
    self.tableView.estimatedRowHeight = 44.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.sectionHeaderHeight = 44.f;

    self.tableView.tableFooterView = [UIView new];
***REMOVED***

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
        rows = 5;
    ***REMOVED***
    else
    ***REMOVED***
        rows = 2;
    ***REMOVED***
    
    return rows;
***REMOVED***

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
***REMOVED***
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0)
    ***REMOVED***
        if (indexPath.row == 1)
        ***REMOVED***
            [self performSegueWithIdentifier:@"ShowDisclaimer" sender:nil];
        ***REMOVED***
        else if (indexPath.row == 2)
        ***REMOVED***
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https:***REMOVED***itunes.apple.com/us/app/burlingtonian-live-like-a-local-in-vt-ad-free/id1252833369?mt=8&ign-mpt=uo%3D4"]  options:@***REMOVED******REMOVED*** completionHandler:^(BOOL success) ***REMOVED***
                
                NSLog(@"");
            ***REMOVED***];
        ***REMOVED***
    ***REMOVED***
    else
    ***REMOVED***
***REMOVED***        if (indexPath.row == 1)
***REMOVED***        ***REMOVED***
***REMOVED***            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https:***REMOVED***itunes.apple.com/us/app/burlingtonian-live-like-a-local-in-vermont/id581817418?mt=8"]  options:@***REMOVED******REMOVED*** completionHandler:^(BOOL success) ***REMOVED***
***REMOVED***                
***REMOVED***                NSLog(@"");
***REMOVED***            ***REMOVED***];
***REMOVED***        ***REMOVED***
        if (indexPath.row == 1)
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
        if (indexPath.row == 4)
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
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"Buy Burlingtonian Ad-Free!";
        ***REMOVED***
        else if (indexPath.row == 3)
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
            cell.textLabel.text = @"Your input is very important and can help make Burlingtonian better. Please take a moment to leave your feedback by writing a review on the App Store, or by emailing Greg below.";
        ***REMOVED***
***REMOVED***        else if (indexPath.row == 1)
***REMOVED***        ***REMOVED***
***REMOVED***            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
***REMOVED***            cell.textLabel.text = @"Write a review or rate us on the App Store";
***REMOVED***        ***REMOVED***
        else
        ***REMOVED***
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"Send an email";
        ***REMOVED***
    ***REMOVED***
    
    return cell;
***REMOVED***

***REMOVED***
