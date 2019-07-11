//
//  UIViewController+Route.h
//  iOSRouterDemo
//
//  Created by 崔冰smile on 2019/7/11.
//  Copyright © 2019 Ziwutong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Route)
//当前控制器
+ (UIViewController *)currentViewController;

@end

NS_ASSUME_NONNULL_END
