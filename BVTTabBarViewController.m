***REMOVED***
***REMOVED***  BVTTabBarViewController.m
***REMOVED***  bvt
***REMOVED***
***REMOVED***  Created by Greg on 7/5/17.
***REMOVED***  Copyright © 2017 gms. All rights reserved.
***REMOVED***

***REMOVED***

***REMOVED***
#import "BVTTabBarViewController.h"

@interface BVTTabBarViewController () <GADBannerViewDelegate>

@property (nonatomic, strong) GADBannerView *bannerView;
@property (nonatomic, weak) IBOutlet UIView *adView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *adViewHeightConstraint;

***REMOVED***

@implementation BVTTabBarViewController

- (void)adViewDidReceiveAd:(GADBannerView *)bannerView
***REMOVED***
    self.bannerView = bannerView;

    self.bannerView.alpha = 0;
    [self.adView addSubview:self.bannerView];
    [self.bannerView setFrame:CGRectMake(0, 0, self.adView.frame.size.width, 60.f)];
    self.adViewHeightConstraint.constant = 60.f;
    [UIView animateWithDuration:1.0 animations:^***REMOVED***
        self.bannerView.alpha = 1;
    ***REMOVED***];
***REMOVED***

- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
    self.adViewHeightConstraint.constant = 0.f;
    
    self.bannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeFullBanner];
    self.bannerView.rootViewController = self;
    self.bannerView.adUnitID = @"ca-app-pub-8236497982755596/2923452267";

    [self.bannerView loadRequest:[GADRequest request]];
    self.bannerView.delegate = self;

    ***REMOVED*** Do any additional setup after loading the view.
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