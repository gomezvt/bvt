***REMOVED***
***REMOVED***  BVTSurpriseShoppingCartTableViewController.m
***REMOVED***  bvt
***REMOVED***
***REMOVED***  Created by Greg on 2/23/17.
***REMOVED***  Copyright © 2017 gms. All rights reserved.
***REMOVED***

#import "BVTSurpriseShoppingCartTableViewController.h"

#import "BVTSurpriseCategoryTableViewController.h"
#import "BVTHeaderTitleView.h"
#import "BVTStyles.h"

@interface BVTSurpriseShoppingCartTableViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIButton *goButton;

***REMOVED***

static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";


@implementation BVTSurpriseShoppingCartTableViewController

- (IBAction)didTapSubmit:(id)sender
***REMOVED***
    ***REMOVED*** WIP
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

#pragma mark - IBActions

- (IBAction)didTapBack:(id)sender
***REMOVED***
    [self.navigationController popViewControllerAnimated:YES];
***REMOVED***



- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
***REMOVED***

- (void)didReceiveMemoryWarning ***REMOVED***
    [super didReceiveMemoryWarning];
    ***REMOVED*** Dispose of any resources that can be recreated.
***REMOVED***

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
***REMOVED***
    return [self.selectedCategories allKeys].count;
***REMOVED***

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
***REMOVED***
    NSArray *array = [self.selectedCategories allValues];
    NSArray *b = [array objectAtIndex:section];
    
    return b.count;
***REMOVED***

- (void)viewWillAppear:(BOOL)animated
***REMOVED***
    [super viewWillAppear:animated];
    
    [self.goButton setEnabled:[self evaluateButtonState]];
    
***REMOVED***

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
***REMOVED***
    NSString *item = [self.selectedCategories allKeys][section];

    return  item;
***REMOVED***


- (BOOL)evaluateButtonState
***REMOVED***
    BOOL isEnabled = NO;
    
    if (self.selectedCategories.count > 0)
    ***REMOVED***
        isEnabled = YES;
    ***REMOVED***
    
    return isEnabled;
***REMOVED***


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSArray *sectionValues = [self.selectedCategories allValues][indexPath.section];

    cell.textLabel.text = sectionValues[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.textLabel.numberOfLines = 0;

    return cell;
***REMOVED***

***REMOVED***
