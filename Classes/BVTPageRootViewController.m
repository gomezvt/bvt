***REMOVED***
***REMOVED***  RootViewController.m
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/23/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import "BVTPageRootViewController.h"

#import "BVTExploreViewController.h"
#import "BVTPageContentViewController.h"

@interface BVTPageRootViewController ()

***REMOVED***

@implementation BVTPageRootViewController


- (void)viewDidLoad
***REMOVED***
    [super viewDidLoad];
    
    BOOL tutorialIsComplete = [[NSUserDefaults standardUserDefaults] boolForKey:@"BVTTutorialComplete"];
    if (tutorialIsComplete)
    ***REMOVED***
        ***REMOVED*** skip the tutorial here
        
***REMOVED***        BVTExploreViewController *bvt = [[BVTExploreViewController alloc] initWithNibName:@"BVTExploreViewController" bundle:nil];
***REMOVED***        BVTExploreViewController* tutorialViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ExploreViewController"];
***REMOVED***        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:tutorialViewController];
***REMOVED***        
***REMOVED***        
***REMOVED***        [self presentViewController:nc animated:YES completion:nil];

        
    ***REMOVED***
    
    ***REMOVED*** Create the data model
    self.pageTitles = @[@"1", @"2", @"3", @"4"];
    self.images = @[@"page1.png", @"page2.png", @"page3.png", @"page4.png"];

    ***REMOVED*** Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    BVTPageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    ***REMOVED*** Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 50);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
***REMOVED***

- (IBAction)startWalkthrough:(id)sender
***REMOVED***
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"BVTTutorialComplete"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    BVTPageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
    [self performSegueWithIdentifier:@"ShowTabBarController" sender:nil];
***REMOVED***

- (BVTPageContentViewController *)viewControllerAtIndex:(NSUInteger)index
***REMOVED***
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) ***REMOVED***
        return nil;
    ***REMOVED***
    
    ***REMOVED*** Create a new view controller and pass suitable data.
    BVTPageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile = self.images[index];

    pageContentViewController.titleText = self.pageTitles[index];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
***REMOVED***

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
***REMOVED***
    NSUInteger index = ((BVTPageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) ***REMOVED***
        return nil;
    ***REMOVED***
    
    index--;
    return [self viewControllerAtIndex:index];
***REMOVED***

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
***REMOVED***
    NSUInteger index = ((BVTPageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) ***REMOVED***
        return nil;
    ***REMOVED***
    
    index++;
    if (index == [self.pageTitles count]) ***REMOVED***
        return nil;
    ***REMOVED***
    return [self viewControllerAtIndex:index];
***REMOVED***

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
***REMOVED***
    return [self.pageTitles count];
***REMOVED***

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
***REMOVED***
    return 0;
***REMOVED***


***REMOVED***
