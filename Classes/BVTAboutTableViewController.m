***REMOVED***
***REMOVED***  BVTAboutTableViewController.m
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/20/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import "BVTAboutTableViewController.h"
#import "BVTHeaderTitleView.h"

#import "BVTStyles.h"

@interface BVTAboutTableViewController ()

@property (nonatomic, strong) BVTHeaderTitleView *headerTitleView;


***REMOVED***

static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";

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
    else if (section == 1)
    ***REMOVED***
        title = @"Follow Us for Updates";
    ***REMOVED***
    else
    ***REMOVED***
        title = @"We Value Your Feedback";
    ***REMOVED***
    
    return title;
***REMOVED***

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
***REMOVED***
    return 3;
***REMOVED***

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
***REMOVED***
    NSInteger rows = 0;
    
    if (section == 0)
    ***REMOVED***
        rows = 4;
    ***REMOVED***
    else if (section == 1)
    ***REMOVED***
        rows = 2;
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

***REMOVED***

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
***REMOVED***    cell.textLabel.font = [UIFont systemFontOfSize:15.f weight:2.f];
    cell.textLabel.textColor = [UIColor darkGrayColor];
    
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    
    if (indexPath.section == 0)
    ***REMOVED***
        if (indexPath.row == 0)
        ***REMOVED***
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textLabel.text = @"Several years in the making, Burlingtonian was created by Greg, a native Vermonter, to serve as a homegrown hub for tourism and travel information for people in and around the Burlington, VT area.";
        ***REMOVED***
        else if (indexPath.row == 1)
        ***REMOVED***
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"Privacy and Terms of Use";
        ***REMOVED***
        else if (indexPath.row == 2)
        ***REMOVED***
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"Powered by Yelp";
        ***REMOVED***
        else
        ***REMOVED***
            cell.textLabel.text = @"Version 2.0.0";
        ***REMOVED***
    ***REMOVED***
    else if (indexPath.section == 1)
    ***REMOVED***
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (indexPath.row == 0)
        ***REMOVED***
            cell.textLabel.text = @"Follow us on Twitter";
        ***REMOVED***
        else
        ***REMOVED***
            cell.textLabel.text = @"Like us on Facebook";
        ***REMOVED***
    ***REMOVED***
    else
    ***REMOVED***
        if (indexPath.row == 0)
        ***REMOVED***
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textLabel.text = @"Your input is very important to us and can help make Burlingtonian better. Please take a moment to leave your feedback.";
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
