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
***REMOVED***@property (nonatomic, strong) NSMutableArray *a;

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
    if ([self.delegate respondsToSelector:@selector(didTapBackWithSubCategories:withCategories:)])
    ***REMOVED***
        [self.delegate didTapBackWithSubCategories:self.subCats withCategories:self.selectedCategories];
    ***REMOVED***
    [self.navigationController popViewControllerAnimated:YES];
***REMOVED***



- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
    
    [self.goButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];

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
    NSString *key = [self.selectedCategories allKeys][section];
    self.subCats = [self.selectedCategories objectForKey:key];
    
    return self.subCats.count;
***REMOVED***

- (void)viewWillAppear:(BOOL)animated
***REMOVED***
    [super viewWillAppear:animated];
    
[self.goButton setEnabled:[self evaluateButtonState]];
***REMOVED***

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
***REMOVED***
    NSArray *array = [self.selectedCategories allValues][section];
    if (array.count > 0)
    ***REMOVED***
        return [self.selectedCategories allKeys][section];
    ***REMOVED***

        return nil;
***REMOVED***

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath ***REMOVED***
    ***REMOVED***add code here for when you hit delete
***REMOVED***    NSString *key = [self.selectedCategories allKeys][indexPath.section];
***REMOVED***    NSArray *a = [self.selectedCategories objectForKey:key];
***REMOVED***    NSMutableArray *array = [NSMutableArray array];
***REMOVED***    [array addObjectsFromArray:a];
    if (editingStyle == UITableViewCellEditingStyleDelete) ***REMOVED***
        NSArray *key = [self.selectedCategories allValues][indexPath.section];
        NSString *str = [key objectAtIndex:indexPath.row];
        if ([self.subCats containsObject:str])
        ***REMOVED***
            [self.subCats removeObjectAtIndex:indexPath.row];
            [tableView reloadData];
            
            [self.goButton setEnabled:[self evaluateButtonState]];

        ***REMOVED***
        

        
        
    ***REMOVED***
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
