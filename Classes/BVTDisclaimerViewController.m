//
//  BVTDisclaimerViewController.m
//  bvt
//
//  Created by Greg on 6/3/17.
//  Copyright © 2017 gms. All rights reserved.
//

#import "BVTDisclaimerViewController.h"
#import "BVTHeaderTitleView.h"
#import "BVTStyles.h"

@interface BVTDisclaimerViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";

@implementation BVTDisclaimerViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    UINib *nibTitleView = [UINib nibWithNibName:kHeaderTitleViewNib bundle:nil];
    BVTHeaderTitleView *headerTitleView = [[nibTitleView instantiateWithOwner:self options:nil] objectAtIndex:0];
    headerTitleView.titleViewLabelConstraint.constant = -20.f;
    self.navigationItem.titleView = headerTitleView;
    self.navigationController.navigationBar.barTintColor = [BVTStyles iconGreen];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.tableFooterView = [UIView new];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.f;
}

- (IBAction)didTapBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
