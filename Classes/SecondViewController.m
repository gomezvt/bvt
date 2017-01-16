***REMOVED***
***REMOVED***  SecondViewController.m
***REMOVED***  bvt
***REMOVED***
***REMOVED***  Created by Greg on 1/15/17.
***REMOVED***  Copyright © 2017 gms. All rights reserved.
***REMOVED***

#import "SecondViewController.h"

***REMOVED***
#import <YelpAPI/YLPClient+Search.h>
#import <YelpAPI/YLPSortType.h>
#import <YelpAPI/YLPSearch.h>
#import <YelpAPI/YLPBusiness.h>


@interface SecondViewController ()

***REMOVED***

@implementation SecondViewController

- (void)viewDidLoad ***REMOVED***
    [super viewDidLoad];
    ***REMOVED*** Do any additional setup after loading the view, typically from a nib.
    
    [[AppDelegate sharedClient] searchWithLocation:@"San Francisco, CA" term:nil limit:5 offset:0 sort:YLPSortTypeDistance completionHandler:^
     (YLPSearch *search, NSError* error) ***REMOVED***
***REMOVED***         self.search = search;
         dispatch_async(dispatch_get_main_queue(), ^***REMOVED***
***REMOVED***             [self.tableView reloadData];
         ***REMOVED***);
     ***REMOVED***];
***REMOVED***


- (void)didReceiveMemoryWarning ***REMOVED***
    [super didReceiveMemoryWarning];
    ***REMOVED*** Dispose of any resources that can be recreated.
***REMOVED***


***REMOVED***
