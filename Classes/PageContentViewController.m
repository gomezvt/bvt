***REMOVED***
***REMOVED***  PageContentViewController.m
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/23/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import "PageContentViewController.h"

@interface PageContentViewController ()

***REMOVED***

@implementation PageContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
***REMOVED***
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) ***REMOVED***
        ***REMOVED*** Custom initialization
    ***REMOVED***
    return self;
***REMOVED***

- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
    
    self.imageView.image = [UIImage imageNamed:self.imageFile];

    self.titleLabel.text = self.titleText;
***REMOVED***

***REMOVED***
