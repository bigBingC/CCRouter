//
//  AppDelegate.m
//  iOSRouterDemo
//
//  Created by 崔冰smile on 2019/7/10.
//  Copyright © 2019 Ziwutong. All rights reserved.
//

#import "AppDelegate.h"
#import "CCRouter.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "UIViewController+Route.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self registerRouter];
    return YES;
}

- (void)registerRouter {
    [[CCRouter sharedInstance] registerBlock:^(NSDictionary *param) {
        FirstViewController *firstVC = [[FirstViewController alloc] init];
        firstVC.strTitle = param[@"title"];
        firstVC.strTips = param[@"tips"];
        UINavigationController *navc = [UIViewController currentViewController].navigationController;
        [navc pushViewController:firstVC animated:YES];
    } forRoute:@"ios://firstpage"];
    
    [[CCRouter sharedInstance] registerDictionaryParamBlock:^(NSDictionary *params) {
        SecondViewController *secondVC = [[SecondViewController alloc] init];
        secondVC.strTitle = params[@"title"];
        secondVC.strTips = params[@"tips"];
        UINavigationController *navc = [UIViewController currentViewController].navigationController;
        [navc pushViewController:secondVC animated:YES];
    } forRoute:@"ios://secondpage"];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
