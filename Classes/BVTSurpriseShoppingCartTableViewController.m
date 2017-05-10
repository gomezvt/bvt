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
#import "YLPLocation.h"
#import "YLPClient+Search.h"
#import "BVTHUDView.h"
#import "BVTTableViewSectionHeaderView.h"
#import "YLPLocation.h"
#import "YLPCoordinate.h"

@interface BVTSurpriseShoppingCartTableViewController ()
<BVTHUDViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIButton *goButton;
@property (nonatomic, weak) IBOutlet UIButton *clearButton;

@property (nonatomic) BOOL didCancelRequest;
@property (nonatomic, strong) BVTHUDView *hud;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *backChevron;
@property (nonatomic, strong) NSMutableArray *subCategories;
@property (nonatomic, strong) NSMutableArray *resultsArray;
@property (nonatomic, strong) BVTTableViewSectionHeaderView *headerView;

***REMOVED***

static int i = 0;
static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";
static NSString *const kTableViewSectionHeaderView = @"BVTTableViewSectionHeaderView";

@implementation BVTSurpriseShoppingCartTableViewController



- (IBAction)didTapClearAllButton:(id)sender
***REMOVED***
    [self.catDict removeAllObjects];
    [self.subCategories removeAllObjects];
    [self.resultsArray removeAllObjects];
    
    if ([self.delegate respondsToSelector:@selector(didClearShoppingCart)])
    ***REMOVED***
        [self.delegate didClearShoppingCart];
    ***REMOVED***
    [self.tableView reloadData];
    
    self.clearButton.enabled = NO;
    self.goButton.enabled = NO;
    
    self.clearButton.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.goButton.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    [self presentMessage];
***REMOVED***


- (void)didTapHUDCancelButton
***REMOVED***
    self.didCancelRequest = YES;
    self.backChevron.enabled = YES;
    self.tableView.userInteractionEnabled = YES;
    [self evaluateButtonStateForButton:self.goButton];
    [self evaluateButtonStateForButton:self.clearButton];
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
    [self.clearButton setEnabled:NO];
    
    self.goButton.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.clearButton.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
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
             dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                 if (error)
                 ***REMOVED***
                     [self _hideHUD];
                     
                     NSLog(@"Error %@", error.localizedDescription);
                     
                     [self.goButton setEnabled:YES];
                     [self.clearButton setEnabled:YES];
                     
                     self.goButton.layer.borderColor = [[BVTStyles iconGreen] CGColor];
                     self.clearButton.layer.borderColor = [[BVTStyles iconGreen] CGColor];
                 ***REMOVED***
             ***REMOVED***);
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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
***REMOVED***
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    NSArray *sortedArray2 = [[self.catDict allKeys] sortedArrayUsingDescriptors: @[descriptor]];
    NSString *key = [sortedArray2 objectAtIndex:section];
    NSArray *array = [self.catDict valueForKey:key];
    if (array.count > 0)
    ***REMOVED***
        return key;
    ***REMOVED***
    return nil;
***REMOVED***

- (void)presentMessage
***REMOVED***
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 30.f)];
    label.text = @"Add a category to submit.";
    [super.view addSubview:label];
    label.center = self.tableView.center;
    self.tableView.separatorColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor lightGrayColor];
***REMOVED***

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath ***REMOVED***
    if (editingStyle == UITableViewCellEditingStyleDelete) ***REMOVED***
***REMOVED***        NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
***REMOVED***        NSArray *sortedArray2 = [[self.businessOptions allKeys] sortedArrayUsingDescriptors: @[descriptor]];
***REMOVED***        NSString *key = [sortedArray2 objectAtIndex:indexPath.section];
***REMOVED***        NSArray *values = [self.businessOptions valueForKey:key];
        NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
        NSArray *sortedArray2 = [[self.catDict allKeys] sortedArrayUsingDescriptors: @[descriptor]];
        NSString *key = [sortedArray2 objectAtIndex:indexPath.section];
        
        NSMutableArray *array = [self.catDict valueForKey:key];
        [array removeObjectAtIndex:indexPath.row];
        [self.subCategories removeObjectAtIndex:indexPath.row];
        
        ***REMOVED*** tell table to refresh now
        [self evaluateButtonStateForButton:self.goButton];
        [self evaluateButtonStateForButton:self.clearButton];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView reloadData];

        BOOL containsValues = [[[self.catDict allValues] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"@count > 0"]] lastObject];

        if (!containsValues)
        ***REMOVED***
            [self presentMessage];
        ***REMOVED***
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
    
    UINib *headerView = [UINib nibWithNibName:kTableViewSectionHeaderView bundle:nil];
    [self.tableView registerNib:headerView forHeaderFooterViewReuseIdentifier:kTableViewSectionHeaderView];
***REMOVED***

- (void)evaluateButtonStateForButton:(UIButton *)button
***REMOVED***
    CALayer *layer = [button layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:10.0];
    [layer setBorderWidth:1.0];
    
    NSArray *allValues = [self.catDict allValues];
    BOOL containsValues = [[allValues filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"@count > 0"]] lastObject];
    
    if (containsValues)
    ***REMOVED***
        [button setEnabled:YES];
        [button.layer setBorderColor:[[BVTStyles iconGreen] CGColor]];
    ***REMOVED***
    else
    ***REMOVED***
        [button setEnabled:NO];
        [button.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    ***REMOVED***
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
    
    
    self.tableView.sectionHeaderHeight = 44.f;
    
    self.resultsArray = [NSMutableArray array];
    self.subCategories = [NSMutableArray array];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveBusinessesNotification:)
                                                 name:@"BVTReceivedBusinessesSearchNotification"
                                               object:nil];
    
    [self.goButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [self.clearButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    
***REMOVED***

- (void)viewWillAppear:(BOOL)animated
***REMOVED***
    [super viewWillAppear:animated];
    
    [self evaluateButtonStateForButton:self.goButton];
    [self evaluateButtonStateForButton:self.clearButton];
***REMOVED***

- (void)didReceiveBusinessesNotification:(NSNotification *)notification
***REMOVED***
    if ([[notification name] isEqualToString:@"BVTReceivedBusinessesSearchNotification"])
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
                        if ([biz.phone isEqualToString:bizz.phone] && [[dict allKeys] lastObject] == category)
                        ***REMOVED***
                            isDuplicate = YES;
                        ***REMOVED***
                    ***REMOVED***
                ***REMOVED***
                
                if (isDuplicate == NO)
                ***REMOVED***
                    if ([[biz.categories filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"name = %@", category]] lastObject])
                    ***REMOVED***
                        AppDelegate *appDel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                        
                        CLLocation *bizLocation = [[CLLocation alloc] initWithLatitude:biz.location.coordinate.latitude longitude:biz.location.coordinate.longitude];
                        CLLocationDistance meters = [appDel.userLocation distanceFromLocation:bizLocation];
                        
                        double miles = meters / 1609.34;
                        biz.miles = miles;
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
                dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                    ***REMOVED*** code here
                    [self.goButton setEnabled:YES];
                    [self.clearButton setEnabled:YES];
                    
                    self.goButton.layer.borderColor = [[BVTStyles iconGreen] CGColor];
                    self.clearButton.layer.borderColor = [[BVTStyles iconGreen] CGColor];
                    
                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"No results were found for the selected category(s)" message:@"Please select another category" preferredStyle:UIAlertControllerStyleAlert];
                    
                    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                    [alertController addAction:ok];
                    
                    [self presentViewController:alertController animated:YES completion:nil];
                ***REMOVED***);
            ***REMOVED***
            else
            ***REMOVED***
                
                
                for (NSString *category in self.subCategories)
                ***REMOVED***
                    NSArray *array = [self.resultsArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self CONTAINS[cd] %K", category]];
                    
 
                    
                    ***REMOVED*** TODO:figure out sorting here
                    [dict setObject:array forKey:category];
                ***REMOVED***
                
                for (NSString *key in [dict allKeys])
                ***REMOVED***

                    
                    NSArray *values = [dict valueForKey:key];

                    
                    if (values.count > 3)
                    ***REMOVED***
                        NSDictionary *values1 = [values objectAtIndex:arc4random()%[values count]];
                        YLPBusiness *biz = [[values1 allValues] lastObject];
                        
                        NSDictionary *values2 = [values objectAtIndex:arc4random()%[values count]];
                        YLPBusiness *biz2 = [[values2 allValues] lastObject];
                        
                        NSDictionary *values3 = [values objectAtIndex:arc4random()%[values count]];
                        YLPBusiness *biz3 = [[values3 allValues] lastObject];
                        
                        if (![biz isKindOfClass:[NSNull class]] && ![biz2 isKindOfClass:[NSNull class]] && ![biz3 isKindOfClass:[NSNull class]])
                        ***REMOVED***
                            if ([biz.phone isEqualToString:biz2.phone] || [biz.phone isEqualToString:biz3.phone] ||
                                [biz2.phone isEqualToString:biz.phone] || [biz2.phone isEqualToString:biz3.phone] ||
                                [biz3.phone isEqualToString:biz.phone] || [biz3.phone isEqualToString:biz2.phone])
                            ***REMOVED***
                                return;
                            ***REMOVED***
                            
                            NSMutableArray *ar2 = [NSMutableArray array];
                            [ar2 addObject:biz];
                            [ar2 addObject:biz2];
                            [ar2 addObject:biz3];
                            
                            NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
                            NSArray *sortedArray2 = [ar2 sortedArrayUsingDescriptors: @[descriptor]];
                            
                            NSMutableArray *ar = [NSMutableArray array];
                            for (YLPBusiness *biz in sortedArray2)
                            ***REMOVED***
                                [ar addObject:[NSDictionary dictionaryWithObject:biz forKey:key]];
                            ***REMOVED***
                            
                            if (ar.count == 3)
                            ***REMOVED***
                                [dict setValue:ar forKey:key];
                            ***REMOVED***
                        ***REMOVED***
                        
                    ***REMOVED***
                    else if (values.count > 0)
                    ***REMOVED***
                        NSMutableArray *arra = [NSMutableArray array];
                        for (NSDictionary *dict in values)
                        ***REMOVED***
                            YLPBusiness *biz = [[dict allValues] lastObject];
                            [arra addObject:biz];
                        ***REMOVED***
                        NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
                        NSArray *sortedArray2 = [arra sortedArrayUsingDescriptors: @[descriptor]];
                        
                        NSMutableArray *ar = [NSMutableArray array];
                        for (YLPBusiness *biz in sortedArray2)
                        ***REMOVED***
                            [ar addObject:[NSDictionary dictionaryWithObject:biz forKey:key]];
                        ***REMOVED***
                        
                        [dict setValue:ar forKey:key];
                    ***REMOVED***
                ***REMOVED***
                [self performSegueWithIdentifier:@"ShowRecommendations" sender:dict];

                
                dispatch_async(dispatch_get_main_queue(), ^***REMOVED***

                    [self _hideHUD];
                ***REMOVED***);
            ***REMOVED***
            

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
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    NSArray *sortedArray2 = [[self.catDict allKeys] sortedArrayUsingDescriptors: @[descriptor]];
    NSString *key = [sortedArray2 objectAtIndex:section];
    NSArray *values = [self.catDict valueForKey:key];
    for (NSString *category in values)
    ***REMOVED***
        if (![self.subCategories containsObject:category])
        ***REMOVED***
            [self.subCategories addObject:category];
        ***REMOVED***
    ***REMOVED***
    return values.count;
***REMOVED***

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
***REMOVED***
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    NSArray *sortedArray2 = [[self.catDict allKeys] sortedArrayUsingDescriptors: @[descriptor]];
    NSString *key = [sortedArray2 objectAtIndex:indexPath.section];
    NSArray *values = [self.catDict valueForKey:key];
    NSArray *valuesToDisplay = [values sortedArrayUsingDescriptors: @[descriptor]];
    
    cell.textLabel.text = [valuesToDisplay objectAtIndex:indexPath.row];
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
