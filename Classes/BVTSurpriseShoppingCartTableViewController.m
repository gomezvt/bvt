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
#import "BVTSurpriseRecommendationsTableViewController.h"
#import "BVTStyles.h"
***REMOVED***
#import "YLPCategory.h"
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
@property (nonatomic, strong) NSMutableDictionary *mutDict;
@property (nonatomic, strong) NSMutableArray *subCategories;
@property (nonatomic, strong) NSMutableArray *resultsArray;

***REMOVED***

static int i = 0;
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
    [self.resultsArray removeAllObjects];
    
    i = 0;
    NSArray *array = [self.catDict allValues];
    self.hud = [BVTHUDView hudWithView:self.navigationController.view];
    self.hud.delegate = self;
    self.didCancelRequest = NO;
    [self.goButton setEnabled:NO];

    NSMutableArray *categoryArray = [NSMutableArray array];
    for (NSArray *subCat in array)
    ***REMOVED***
        [categoryArray addObjectsFromArray:subCat];
    ***REMOVED***
    
    self.tableView.userInteractionEnabled = NO;
    self.backChevron.enabled = NO;
    
    for (NSString *subCatTitle in categoryArray)
    ***REMOVED***
        [[AppDelegate sharedClient] searchWithLocation:@"Burlington, VT" term:subCatTitle limit:50 offset:0 sort:YLPSortTypeDistance completionHandler:^
         (YLPSearch *searchResults, NSError *error)***REMOVED***
             if (error)
             ***REMOVED***
                 UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:[NSString stringWithFormat:@"%@", error] preferredStyle:UIAlertControllerStyleAlert];
                 
                 UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                 [alertController addAction:ok];
                 [self presentViewController:alertController animated:YES completion:nil];
                 [self.goButton setEnabled:YES];
                 
                 dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                     ***REMOVED*** code here
                     [self _hideHUD];
                 ***REMOVED***);
             ***REMOVED***
         ***REMOVED***];
    ***REMOVED***
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
        [k removeObjectAtIndex:indexPath.row];
        [self.subCategories removeObjectAtIndex:indexPath.row];
        
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
    
    self.resultsArray = [NSMutableArray array];
    self.subCategories = [NSMutableArray array];
    self.mutDict = [[NSMutableDictionary alloc] init];;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveBusinessesNotification:)
                                                 name:@"BVTReceivedBusinessesNotification"
                                               object:nil];

    
    [self.goButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];

***REMOVED***

- (void)didReceiveBusinessesNotification:(NSNotification *)notification
***REMOVED***
    if ([[notification name] isEqualToString:@"BVTReceivedBusinessesNotification"])
    ***REMOVED***
        i++;
        YLPSearch *searchObject = notification.object;
        
        for (NSString *category in self.subCategories)
        ***REMOVED***
            for (YLPBusiness *biz in searchObject.businesses)
            ***REMOVED***
                BOOL isDuplicate = NO;
                if (self.resultsArray.count > 0)
                ***REMOVED***
                    for (NSDictionary *dict in self.resultsArray)
                    ***REMOVED***
                        YLPBusiness *bizz = [[dict allValues] lastObject];
                        if ([biz.name isEqualToString:bizz.name] && [[dict allKeys] lastObject] == category)
                        ***REMOVED***
                            isDuplicate = YES;
                        ***REMOVED***
                    ***REMOVED***
                ***REMOVED***

                if (isDuplicate == NO)
                ***REMOVED***
                    if ([[biz.categories filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"name = %@", category]] lastObject])
                    ***REMOVED***
                        [self.resultsArray addObject:[NSDictionary dictionaryWithObject:biz forKey:category]];
                    ***REMOVED***
                ***REMOVED***
            ***REMOVED***
        ***REMOVED***
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        if (i == self.subCategories.count)
        ***REMOVED***
            if (self.resultsArray.count == 0)
            ***REMOVED***
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"No results were found for the selected category(s)" message:@"Please select another category" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                [alertController addAction:ok];
                
                [self presentViewController:alertController animated:YES completion:nil];
                [self.goButton setEnabled:YES];
            ***REMOVED***
            else
            ***REMOVED***
                for (NSString *category in self.subCategories)
                ***REMOVED***
                    NSArray *array = [self.resultsArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self CONTAINS[cd] %K", category]];
                    ***REMOVED*** TODO:figure out sorting here
                    [dict setObject:array forKey:category];
                ***REMOVED***
                
                [self performSegueWithIdentifier:@"ShowRecommendations" sender:dict];
                [self.goButton setEnabled:YES];
            ***REMOVED***
            dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                ***REMOVED*** code here
                [self _hideHUD];
            ***REMOVED***);
        ***REMOVED***
    ***REMOVED***
***REMOVED***

- (void) dealloc
***REMOVED***
    ***REMOVED*** If you don't remove yourself as an observer, the Notification Center
    ***REMOVED*** will continue to try and send notification objects to the deallocated
    ***REMOVED*** object.
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
    for (NSString *category in k)
    ***REMOVED***
        if (![self.subCategories containsObject:category])
        ***REMOVED***
            [self.subCategories addObject:category];
        ***REMOVED***
    ***REMOVED***
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
***REMOVED***
    ***REMOVED*** Get destination view
    BVTSurpriseRecommendationsTableViewController *vc = [segue destinationViewController];
    vc.businessOptions = sender;
***REMOVED***

***REMOVED***
