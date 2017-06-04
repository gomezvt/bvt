***REMOVED***
***REMOVED***  BVTDisclaimerViewController.m
***REMOVED***  bvt
***REMOVED***
***REMOVED***  Created by Greg on 6/3/17.
***REMOVED***  Copyright © 2017 gms. All rights reserved.
***REMOVED***

#import "BVTDisclaimerViewController.h"
#import "BVTHeaderTitleView.h"
#import "BVTStyles.h"

@interface BVTDisclaimerViewController ()

***REMOVED***

static NSString *const kHeaderTitleViewNib = @"BVTHeaderTitleView";

@implementation BVTDisclaimerViewController

- (void)awakeFromNib
***REMOVED***
    [super awakeFromNib];
    
    UINib *nibTitleView = [UINib nibWithNibName:kHeaderTitleViewNib bundle:nil];
    BVTHeaderTitleView *headerTitleView = [[nibTitleView instantiateWithOwner:self options:nil] objectAtIndex:0];
    headerTitleView.titleViewLabelConstraint.constant = -20.f;
    self.navigationItem.titleView = headerTitleView;
    self.navigationController.navigationBar.barTintColor = [BVTStyles iconGreen];
    
***REMOVED***

- (void)viewDidLoad ***REMOVED***
    [super viewDidLoad];
    ***REMOVED*** Do any additional setup after loading the view.
***REMOVED***

- (IBAction)didTapBack:(id)sender
***REMOVED***
    [self.navigationController popViewControllerAnimated:YES];
***REMOVED***

- (void)didReceiveMemoryWarning ***REMOVED***
    [super didReceiveMemoryWarning];
    ***REMOVED*** Dispose of any resources that can be recreated.
***REMOVED***

/*
#pragma mark - Navigation

***REMOVED*** In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender ***REMOVED***
    ***REMOVED*** Get the new view controller using [segue destinationViewController].
    ***REMOVED*** Pass the selected object to the new view controller.
***REMOVED***
*/

***REMOVED***
