//
//  RootViewController.m
//  burlingtonian
//
//  Created by Greg on 12/23/16.
//  Copyright © 2016 gomez. All rights reserved.
//

#import "BVTPageRootViewController.h"

#import "BVTExploreViewController.h"
#import "BVTPageContentViewController.h"

@interface BVTPageRootViewController ()

@property (nonatomic, weak) IBOutlet UIView *gotItBar;
@property (nonatomic, weak) IBOutlet UIImageView *icon;

@end

@implementation BVTPageRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    BOOL tutorialIsComplete = [[NSUserDefaults standardUserDefaults] boolForKey:@"BVTTutorialComplete"];
    if (tutorialIsComplete)
    {
        self.gotItBar.hidden = YES;
        self.icon.hidden = YES;

        dispatch_async(dispatch_get_main_queue(), ^{
            [self performSegueWithIdentifier:@"ShowTabBarController" sender:nil];
        });
    }
    else
    {
        // Create the data model
        self.pageTitles = @[@"1", @"2", @"3"];
        self.images = @[@"page1.png", @"page2.png", @"page3.png"];
        
        CGRect mainScreen = [[UIScreen mainScreen] bounds];
        if (mainScreen.size.width > 375.f)
        {
            // iPhone Plus 6 + 7
            self.images = @[@"Tutorial_Explore_6_7_Plus.png", @"Tutorial_Search_6_7_Plus.png", @"Tutorial_Surprise_6_7_Plus.png"];
        }
        else if (mainScreen.size.width == 375.f)
        {
            // iPhone 6 + 7
            self.images = @[@"Tutorial_Explore_6_7", @"Tutorial_Search_6_7.png", @"Tutorial_Surprise_6_7.png"];
        }
        else if (mainScreen.size.width == 320.f)
        {
            if (mainScreen.size.height == 480.f)
            {
                // iPhone 4S
                self.images = @[@"Tutorial_Explore_4S.png", @"Tutorial_Search_4S.png", @"Tutorial_Surprise_4S.png"];
            }
            else
            {
                // iPhone 5, iPhone 5S, iPhone SE
                self.images = @[@"Tutorial_Explore_Small.png", @"Tutorial_Search_Small.png", @"Tutorial_Surprise_Small.png"];
            }
        }
        
        // Create page view controller
        self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
        self.pageViewController.dataSource = self;
        
        BVTPageContentViewController *startingViewController = [self viewControllerAtIndex:0];
        NSArray *viewControllers = @[startingViewController];
        [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
        
        // Change the size of page view controller
        self.pageViewController.view.frame = CGRectMake(0, -50.f, self.view.frame.size.width, self.view.frame.size.height + 25.f);
        
        [self addChildViewController:_pageViewController];
        [self.view addSubview:_pageViewController.view];
        [self.pageViewController didMoveToParentViewController:self];
    }
}

- (IBAction)startWalkthrough:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"BVTTutorialComplete"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    [self performSegueWithIdentifier:@"ShowTabBarController" sender:nil];
}

- (BVTPageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    BVTPageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile = self.images[index];

    pageContentViewController.titleText = self.pageTitles[index];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((BVTPageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((BVTPageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}


@end
