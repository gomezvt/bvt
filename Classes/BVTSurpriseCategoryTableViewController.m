***REMOVED***
***REMOVED***  BVTSurpriseTableViewController.m
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/20/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import "BVTSurpriseCategoryTableViewController.h"
#import "BVTHeaderTitleView.h"
#import "BVTSurpriseSubCategoryTableViewController.h"
#import "BVTSurpriseShoppingCartTableViewController.h"
#import "BVTStyles.h"

@interface BVTSurpriseCategoryTableViewController ()
<BVTSurpriseSubCategoryTableViewControllerDelegate>

@property (nonatomic, strong) BVTHeaderTitleView *headerTitleView;
@property (nonatomic, strong) NSMutableArray *subCats;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIButton *goButton;

***REMOVED***

static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";
static NSString *const kShowCategorySegue = @"ShowCategory";
static NSString *const kShowShoppingCartSegue = @"ShowShoppingCart";

@implementation BVTSurpriseCategoryTableViewController

- (void)awakeFromNib
***REMOVED***
    [super awakeFromNib];
    
    UINib *nibTitleView = [UINib nibWithNibName:kHeaderTitleViewNib bundle:nil];
    self.headerTitleView = [[nibTitleView instantiateWithOwner:self options:nil] objectAtIndex:0];
    self.navigationItem.titleView = self.headerTitleView;
    self.navigationController.navigationBar.barTintColor = [BVTStyles iconGreen];
    


***REMOVED***

- (IBAction)didTapBack:(id)sender
***REMOVED***
***REMOVED***    if ([self.delegate respondsToSelector:@selector(didTapBackWithSubCategories:withCategories:)])
***REMOVED***    ***REMOVED***
***REMOVED***        [self.delegate didTapBackWithSubCategories:self.subCats withCategories:self.selectedCategories];
***REMOVED***        [self.navigationController popViewControllerAnimated:YES];
***REMOVED***    ***REMOVED***
***REMOVED***

- (void)didTapBackWithSubCategories:(NSMutableArray *)array withCategories:(NSMutableDictionary *)categories
***REMOVED***
    self.subCats = array;
    self.selectedCategories = categories;
***REMOVED***

- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = 44.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.goButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    if (!self.selectedCategories)
    ***REMOVED***
        self.selectedCategories = [[NSMutableDictionary alloc] init];
    ***REMOVED***
***REMOVED***

- (void)viewWillAppear:(BOOL)animated
***REMOVED***
    [super viewWillAppear:animated];
    
    [self.goButton setEnabled:[self evaluateButtonState]];
***REMOVED***

- (BOOL)evaluateButtonState
***REMOVED***
    BOOL isEnabled = NO;
    if (self.subCats.count > 0)
    ***REMOVED***
        isEnabled = YES;
    ***REMOVED***
    
    return isEnabled;
***REMOVED***

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    NSString *selectionTitle = [kBVTCategories objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:kShowCategorySegue sender:selectionTitle];
***REMOVED***

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
***REMOVED***
    return 1;
***REMOVED***

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
***REMOVED***
    return kBVTCategories.count;
***REMOVED***

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [kBVTCategories objectAtIndex:indexPath.row];
    cell.textLabel.numberOfLines = 0;

    return cell;
***REMOVED***

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
***REMOVED***
    if ([segue.identifier isEqualToString:kShowShoppingCartSegue])
    ***REMOVED***
        ***REMOVED*** Get destination view
        BVTSurpriseShoppingCartTableViewController *vc = [segue destinationViewController];
        vc.selectedCategories = self.selectedCategories;
        vc.subCats = self.subCats;
    ***REMOVED***
    else
    ***REMOVED***
        BVTSurpriseSubCategoryTableViewController *vc = [segue destinationViewController];
        vc.delegate = self;
        vc.selectedCategories = self.selectedCategories;
        vc.subCats = self.subCats;
        vc.categoryTitle = sender;
    ***REMOVED***
***REMOVED***

***REMOVED***
