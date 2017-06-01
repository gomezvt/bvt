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
***REMOVED***#import "BVTTableViewSectionHeaderView.h"
#import "YLPLocation.h"
#import "YLPCoordinate.h"

@interface BVTSurpriseShoppingCartTableViewController ()
<BVTHUDViewDelegate, BVTSurpriseRecommendationsTableViewControllerDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIButton *goButton;
@property (nonatomic, weak) IBOutlet UIButton *clearButton;

@property (nonatomic) BOOL didCancelRequest;
@property (nonatomic, strong) BVTHUDView *hud;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *backChevron;
@property (nonatomic, strong) NSMutableArray *subCategories;
@property (nonatomic, strong) NSMutableArray *resultsArray;
@property (nonatomic, strong) NSMutableArray *tempArray;
***REMOVED***@property (nonatomic, strong) BVTTableViewSectionHeaderView *headerView;

***REMOVED***

static int i = 0;
static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";
***REMOVED***static NSString *const kTableViewSectionHeaderView = @"BVTTableViewSectionHeaderView";

@implementation BVTSurpriseShoppingCartTableViewController

- (void)didTapBackWithDetails:(NSMutableArray *)details
***REMOVED***
    self.cachedDetails = details;
***REMOVED***

- (IBAction)didTapClearAllButton:(id)sender
***REMOVED***
    [self.catDict removeAllObjects];
    [self.subCategories removeAllObjects];
    [self.resultsArray removeAllObjects];
    
    if ([self.delegate respondsToSelector:@selector(didRemoveObjectsFromArray:)])
    ***REMOVED***
        [self.delegate didRemoveObjectsFromArray:self.subCategories];
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
    i = 0;
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
    
    __weak typeof(self) weakSelf = self;

    __block BOOL didError = NO;
    for (NSString *subCatTitle in categoryArray)
    ***REMOVED***
        if (didError)
        ***REMOVED***
            break;
        ***REMOVED***
        
        [[AppDelegate sharedClient] searchWithLocation:@"Burlington, VT" term:subCatTitle limit:50 offset:0 sort:YLPSortTypeDistance completionHandler:^
         (YLPSearch *searchResults, NSError *error)***REMOVED***
             dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                 if (error)
                 ***REMOVED***
                     didError = YES;
                     
                     [weakSelf _hideHUD];
                     
                     UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
                     
                     UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                     [alertController addAction:ok];
                     
                     [weakSelf presentViewController:alertController animated:YES completion:nil];
                     
                     NSLog(@"Error %@", error.localizedDescription);
                     
                     [weakSelf.goButton setEnabled:YES];
                     [weakSelf.clearButton setEnabled:YES];
                     
                     weakSelf.goButton.layer.borderColor = [[BVTStyles iconGreen] CGColor];
                     weakSelf.clearButton.layer.borderColor = [[BVTStyles iconGreen] CGColor];
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
    NSMutableArray *values = [[[self.catDict valueForKey:key] sortedArrayUsingDescriptors: @[descriptor]] mutableCopy];
    if (values.count > 0)
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
        NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];

        NSArray *sort = [[[self.catDict allKeys] sortedArrayUsingDescriptors: @[descriptor]] mutableCopy];
        NSString *key = [sort objectAtIndex:indexPath.section];
        NSMutableArray *sortedArray2 = [[self.subCategories sortedArrayUsingDescriptors: @[descriptor]] mutableCopy];

        NSString *category = [sortedArray2 objectAtIndex:indexPath.row];

        [sortedArray2 removeObject:category];
        [self.subCategories removeObject:category];
        
        NSMutableArray *array = [[[self.catDict valueForKey:key] sortedArrayUsingDescriptors: @[descriptor]] mutableCopy];
        NSString *cat = [array objectAtIndex:indexPath.row];

        [array removeObject:cat];
        
        
        [self.catDict setValue:array forKey:key];
        if ([self.delegate respondsToSelector:@selector(didRemoveObjectsFromArray:)])
        ***REMOVED***
            [self.delegate didRemoveObjectsFromArray:self.subCategories];
        ***REMOVED***
        
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section]
                      withRowAnimation:UITableViewRowAnimationFade];
        
        [self evaluateButtonStateForButton:self.goButton];
        [self evaluateButtonStateForButton:self.clearButton];
        

        NSArray *allValues = [self.catDict allValues];
        BOOL containsValues = [[allValues filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"@count > 0"]] lastObject];
        if (!containsValues)
        ***REMOVED***
            [self presentMessage];
        ***REMOVED***
    ***REMOVED***
***REMOVED***

***REMOVED***- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
***REMOVED******REMOVED***
***REMOVED***    return 44.f;
***REMOVED******REMOVED***

- (void)awakeFromNib
***REMOVED***
    [super awakeFromNib];
    
    UINib *nibTitleView = [UINib nibWithNibName:kHeaderTitleViewNib bundle:nil];
    BVTHeaderTitleView *headerTitleView = [[nibTitleView instantiateWithOwner:self options:nil] objectAtIndex:0];
    headerTitleView.titleViewLabelConstraint.constant = -20.f;
    self.navigationItem.titleView = headerTitleView;
    self.navigationController.navigationBar.barTintColor = [BVTStyles iconGreen];
    
***REMOVED***    UINib *headerView = [UINib nibWithNibName:kTableViewSectionHeaderView bundle:nil];
***REMOVED***    [self.tableView registerNib:headerView forHeaderFooterViewReuseIdentifier:kTableViewSectionHeaderView];
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
    
    if ([self.delegate respondsToSelector:@selector(didTapBackWithDetails:)])
    ***REMOVED***
        [self.delegate didTapBackWithDetails:self.cachedDetails];
    ***REMOVED***
    [self.navigationController popViewControllerAnimated:YES];
***REMOVED***



- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
    self.tempArray = [[NSMutableArray alloc] init];
    self.tableView.tableFooterView = [UIView new];

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
    
    [self.tempArray removeAllObjects];
    
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
                if ([[biz.categories filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"name = %@", category]] lastObject])
                ***REMOVED***
                    AppDelegate *appDel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    
                    CLLocation *bizLocation = [[CLLocation alloc] initWithLatitude:biz.location.coordinate.latitude longitude:biz.location.coordinate.longitude];
                    CLLocationDistance meters = [appDel.userLocation distanceFromLocation:bizLocation];
                    
                    double miles = meters / 1609.34;
                    biz.miles = miles;
                    if (![self.tempArray containsObject:[NSString stringWithFormat:@"%@%@", biz.identifier, category]])
                    ***REMOVED***
                        [self.resultsArray addObject:[NSDictionary dictionaryWithObject:biz forKey:category]];
                        [self.tempArray addObject:[NSString stringWithFormat:@"%@%@", biz.identifier, category]];
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
                    [self _hideHUD];
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
                
                NSArray *allkeys = [dict allKeys];
                if (allkeys.count > 0)
                ***REMOVED***
                    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
                    NSArray *keys = [allkeys sortedArrayUsingDescriptors: @[descriptor]];
                    
                    for (NSString *key in keys)
                    ***REMOVED***
                        NSArray *values = [dict valueForKey:key];
                        
                        if (values.count >= 3)
                        ***REMOVED***
                            NSDictionary *values1 = [values objectAtIndex:arc4random()%[values count]];
                            YLPBusiness *biz = [[values1 allValues] lastObject];
                            
                            NSDictionary *values2 = [values objectAtIndex:arc4random()%[values count]];
                            YLPBusiness *biz2 = [[values2 allValues] lastObject];
                            
                            NSDictionary *values3 = [values objectAtIndex:arc4random()%[values count]];
                            YLPBusiness *biz3 = [[values3 allValues] lastObject];
                            
                            if (values.count == 3 &&
                                ([biz.identifier isEqualToString:biz2.identifier] && [biz.identifier isEqualToString:biz3.identifier] &&
                                [biz2.identifier isEqualToString:biz.identifier] && [biz2.identifier isEqualToString:biz3.identifier] &&
                                [biz3.identifier isEqualToString:biz.identifier] && [biz3.identifier isEqualToString:biz2.identifier]))
                            ***REMOVED***
                                NSMutableArray *ar = [NSMutableArray array];
                                [ar addObject:[NSDictionary dictionaryWithObject:biz forKey:key]];
                                [dict setValue:ar forKey:key];                                
                            ***REMOVED***
                            else
                            ***REMOVED***
                                while ([biz.identifier isEqualToString:biz2.identifier] || [biz.identifier isEqualToString:biz3.identifier] ||
                                       [biz2.identifier isEqualToString:biz.identifier] || [biz2.identifier isEqualToString:biz3.identifier] ||
                                       [biz3.identifier isEqualToString:biz.identifier] || [biz3.identifier isEqualToString:biz2.identifier])
                                ***REMOVED***
                                    NSDictionary *values1 = [values objectAtIndex:arc4random()%[values count]];
                                    biz = [[values1 allValues] lastObject];
                                    
                                    NSDictionary *values2 = [values objectAtIndex:arc4random()%[values count]];
                                    biz2 = [[values2 allValues] lastObject];
                                    
                                    NSDictionary *values3 = [values objectAtIndex:arc4random()%[values count]];
                                    biz3 = [[values3 allValues] lastObject];
                                ***REMOVED***
                                
                                NSArray *bizzes = @[ biz, biz2, biz3 ];
                                
                                NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
                                NSArray *sortedArray2 = [bizzes sortedArrayUsingDescriptors: @[descriptor]];
                                
                                NSMutableArray *ar = [NSMutableArray array];
                                for (YLPBusiness *biz in sortedArray2)
                                ***REMOVED***
                                    [ar addObject:[NSDictionary dictionaryWithObject:biz forKey:key]];
                                ***REMOVED***
                                
                                [dict setValue:ar forKey:key];
                            ***REMOVED***
                        ***REMOVED***
                        else if (values.count == 2)
                        ***REMOVED***
                            NSDictionary *values1 = [values firstObject];
                            YLPBusiness *biz = [[values1 allValues] firstObject];
                            
                            NSDictionary *values2 = [values lastObject];
                            YLPBusiness *biz2 = [[values2 allValues] lastObject];

                            if ([biz.identifier isEqualToString:biz2.identifier])
                            ***REMOVED***
                                NSMutableArray *ar = [NSMutableArray array];
                                [ar addObject:[NSDictionary dictionaryWithObject:biz forKey:key]];
                                [dict setValue:ar forKey:key];
                            ***REMOVED***
                            else
                            ***REMOVED***
                                NSArray *bizzes = @[ biz, biz2 ];
                                
                                NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
                                NSArray *sortedArray2 = [bizzes sortedArrayUsingDescriptors: @[descriptor]];
                                
                                NSMutableArray *ar = [NSMutableArray array];
                                for (YLPBusiness *biz in sortedArray2)
                                ***REMOVED***
                                    [ar addObject:[NSDictionary dictionaryWithObject:biz forKey:key]];
                                ***REMOVED***
                                
                                [dict setValue:ar forKey:key];
                            ***REMOVED***

                        ***REMOVED***
                        
                        if (!self.didCancelRequest)
                        ***REMOVED***
                            if (key == [allkeys lastObject])
                            ***REMOVED***
                                dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
                                    
                                    [self _hideHUD];
                                    
                                    [self performSegueWithIdentifier:@"ShowRecommendations" sender:dict];
                                ***REMOVED***);
                            ***REMOVED***
                        ***REMOVED***
                    ***REMOVED***
                ***REMOVED***
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
    NSMutableArray *values = [[[self.catDict valueForKey:key] sortedArrayUsingDescriptors: @[descriptor]] mutableCopy];
    
    
***REMOVED***    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
***REMOVED***    NSMutableArray *sortedArray2 = [[self.subCategories sortedArrayUsingDescriptors: @[descriptor]] mutableCopy];

    
    
    
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
    NSMutableArray *values = [[[self.catDict valueForKey:key] sortedArrayUsingDescriptors: @[descriptor]] mutableCopy];
    
    cell.textLabel.text = [values objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.numberOfLines = 0;
    
    return cell;
***REMOVED***

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
***REMOVED***
    ***REMOVED*** Get destination view
    BVTSurpriseRecommendationsTableViewController *vc = [segue destinationViewController];
    vc.delegate = self;
    vc.businessOptions = sender;
    vc.cachedDetails = self.cachedDetails;
***REMOVED***

***REMOVED***
