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
***REMOVED***
#import "YLPSearch.h"
#import "YLPBusiness.h"
#import "YLPClient+Search.h"
#import "BVTHUDView.h"

@interface BVTSurpriseShoppingCartTableViewController ()
<BVTHUDViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIButton *goButton;
@property (nonatomic) BOOL didCancelRequest;
@property (nonatomic, strong) BVTHUDView *hud;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *backChevron;

***REMOVED***

static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";


@implementation BVTSurpriseShoppingCartTableViewController

- (void)didTapHUDCancelButton
***REMOVED***
    self.didCancelRequest = YES;
    self.backChevron.enabled = YES;
    self.tableView.userInteractionEnabled = YES;
    [self.hud removeFromSuperview];
***REMOVED***

- (IBAction)didTapSubmit:(id)sender
***REMOVED***
    
    NSArray *array = [self.catDict allValues];
    self.hud = [BVTHUDView hudWithView:self.navigationController.view];
    self.hud.delegate = self;
    self.didCancelRequest = NO;
    
    NSMutableArray *categoryArray = [NSMutableArray array];
    for (NSArray *subCat in array)
    ***REMOVED***
        [categoryArray addObjectsFromArray:subCat];
    ***REMOVED***
    
    NSMutableArray *categoryResults = [NSMutableArray array];
    
    self.tableView.userInteractionEnabled = NO;
    self.backChevron.enabled = NO;
    for (NSString *subCatTitle in categoryArray)
    ***REMOVED***
        [[AppDelegate sharedClient] searchWithLocation:@"New York, NY" term:subCatTitle limit:50 offset:0 sort:YLPSortTypeDistance completionHandler:^
         (YLPSearch *searchResults, NSError *error)***REMOVED***
             dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                 for (YLPBusiness *biz in searchResults.businesses)
                 ***REMOVED***
                     YLPCategory *matchingCategory = [[biz.categories filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"name = %@", subCatTitle]] lastObject];
                     
                     if (matchingCategory && biz.closed == NO)
                     ***REMOVED***
                         [categoryResults addObject:biz];
                     ***REMOVED***
                     
                     if ([subCatTitle isEqualToString:[categoryArray lastObject]]  && biz == [searchResults.businesses lastObject])
                     ***REMOVED***
                         [self _hideHUD];
                         
                         if (categoryResults.count == 0)
                         ***REMOVED***
                             UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"No results match the selected category(s)" message:@"Please select another category" preferredStyle:UIAlertControllerStyleAlert];
                             
                             UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                             [alertController addAction:ok];
                             
                             [self presentViewController:alertController animated:YES completion:nil];
                         ***REMOVED***
                         else
                         ***REMOVED***
                             ***REMOVED*** Alphabetize and then Assign values to mutable dict key?
                             [self _displayBusinesses:categoryResults];
                         ***REMOVED***
                     ***REMOVED***
                 ***REMOVED***
                 
                 if ([subCatTitle isEqualToString:[categoryArray lastObject]] && categoryResults.count == 0)
                 ***REMOVED***
                     UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"No search results found" message:@"Please select another category" preferredStyle:UIAlertControllerStyleAlert];
                     
                     UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                     [alertController addAction:ok];
                     
                     [self presentViewController:alertController animated:YES completion:nil];
                     
                     [self _hideHUD];
                 ***REMOVED***
             ***REMOVED***);
             
             if (error)
             ***REMOVED***
                 UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:[NSString stringWithFormat:@"%@", error] preferredStyle:UIAlertControllerStyleAlert];
                 
                 UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                 [alertController addAction:ok];
                 
                 [self _hideHUD];
             ***REMOVED***
         ***REMOVED***];
    ***REMOVED***
***REMOVED***

- (void)_displayBusinesses:(NSArray *)array
***REMOVED***
    NSLog(@"%@", array);
***REMOVED***

- (void)_hideHUD
***REMOVED***
    self.backChevron.enabled = YES;
    self.tableView.userInteractionEnabled = YES;
    [self.hud removeFromSuperview];
***REMOVED***

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
***REMOVED***
***REMOVED***

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath ***REMOVED***
    if (editingStyle == UITableViewCellEditingStyleDelete) ***REMOVED***
        NSString *key = [self.catDict allKeys][indexPath.section];
        NSMutableArray *k = [self.catDict objectForKey:key];
        id object = [k objectAtIndex:indexPath.row];
        [k removeObject:object];
        
        [tableView reloadData]; ***REMOVED*** tell table to refresh now
        [self.goButton setEnabled:[self evaluateButtonState]];
    ***REMOVED***
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

- (BOOL)evaluateButtonState
***REMOVED***
    BOOL isEnabled = NO;
    NSArray *allValues = [self.catDict allValues];
    for (NSArray *array in allValues)
    ***REMOVED***
        if (array.count > 0)
        ***REMOVED***
            isEnabled = YES;
            break;
        ***REMOVED***
    ***REMOVED***
    
    return isEnabled;
***REMOVED***

#pragma mark - IBActions

- (IBAction)didTapBack:(id)sender
***REMOVED***
    if ([self.delegate respondsToSelector:@selector(didTapBackWithCategories:)])
    ***REMOVED***
        [self.delegate didTapBackWithCategories:self.catDict];
    ***REMOVED***
    [self.navigationController popViewControllerAnimated:YES];
***REMOVED***



- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
    [self.goButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];

***REMOVED***



- (void)didReceiveMemoryWarning ***REMOVED***
    [super didReceiveMemoryWarning];
    ***REMOVED*** Dispose of any resources that can be recreated.
***REMOVED***

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
***REMOVED***
    return self.catDict.count;
***REMOVED***

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
***REMOVED***
    NSString *key = [self.catDict allKeys][section];
    NSArray *k = [self.catDict objectForKey:key];

    return k.count;
***REMOVED***

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
***REMOVED***
    NSArray *array = [self.catDict allValues][section];
    if (array.count > 0)
    ***REMOVED***
        return [self.catDict allKeys][section];
    ***REMOVED***

        return nil;
***REMOVED***

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSArray *sectionValues = [self.catDict allValues][indexPath.section];

    cell.textLabel.text = sectionValues[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.textLabel.numberOfLines = 0;

    return cell;
***REMOVED***

***REMOVED***
