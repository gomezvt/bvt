***REMOVED***
***REMOVED***  AppDelegate.m
***REMOVED***  bvt
***REMOVED***
***REMOVED***  Created by Greg on 1/15/17.
***REMOVED***  Copyright © 2017 gms. All rights reserved.
***REMOVED***
***REMOVED***

***REMOVED***

***REMOVED***
@property (strong, nonatomic) YLPClient *client;
***REMOVED***

***REMOVED***

+ (YLPClient *)sharedClient ***REMOVED***
***REMOVED***
    return appDelegate.client;
***REMOVED***

***REMOVED***

***REMOVED*** ***REMOVED***
    [YLPClient authorizeWithAppId:@"7VjGynQ1oCHZlytlm23Tgg" secret:@"sZGmHsNB9VPMkcQgj9egnt56jV88LZwFebK3VLBmMVwhAlKq2kXE2wkMkfzudKcZ" completionHandler:^(YLPClient *client, NSError *error) ***REMOVED***
        self.client = client;
        if (!client) ***REMOVED***
***REMOVED***
        ***REMOVED***
    ***REMOVED***];
    
***REMOVED***
***REMOVED***


- (void)applicationWillResignActive:(UIApplication *)application ***REMOVED***
    ***REMOVED*** Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    ***REMOVED*** Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
***REMOVED***


- (void)applicationDidEnterBackground:(UIApplication *)application ***REMOVED***
    ***REMOVED*** Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    ***REMOVED*** If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
***REMOVED***


- (void)applicationWillEnterForeground:(UIApplication *)application ***REMOVED***
    ***REMOVED*** Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
***REMOVED***


- (void)applicationDidBecomeActive:(UIApplication *)application ***REMOVED***
    ***REMOVED*** Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
***REMOVED***


- (void)applicationWillTerminate:(UIApplication *)application ***REMOVED***
    ***REMOVED*** Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
***REMOVED***


***REMOVED***
