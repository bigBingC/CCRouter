//
//  UIViewController+Route.m
//  iOSRouterDemo
//
//  Created by 崔冰smile on 2019/7/11.
//  Copyright © 2019 Ziwutong. All rights reserved.
//

#import "UIViewController+Route.h"

@implementation UIViewController (Route)

+ (UIViewController *)currentViewController {
    UIWindow* window = [[[UIApplication sharedApplication] delegate] window];
    //获取根控制器
    UIViewController* currentViewController = window.rootViewController;
    //获取当前页面控制器
    BOOL runLoopFind = YES;
    while (runLoopFind){
        if (currentViewController.presentedViewController){
            currentViewController = currentViewController.presentedViewController;
        }else if ([currentViewController isKindOfClass:[UINavigationController class]]){
            UINavigationController* navigationController = (UINavigationController* )currentViewController;
            currentViewController = [navigationController.childViewControllers lastObject];
        } else if ([currentViewController isKindOfClass:[UITabBarController class]]){
            UITabBarController* tabBarController = (UITabBarController* )currentViewController;
            currentViewController = tabBarController.selectedViewController;
        } else {
            NSUInteger childViewControllerCount = currentViewController.childViewControllers.count;
            if (childViewControllerCount > 0) {
                currentViewController = currentViewController.childViewControllers.lastObject;
                return currentViewController;
            } else {
                return currentViewController;
            }
        }
    }
    return currentViewController;
}
@end
