//
//  CCRouter.h
//  iOSRouterDemo
//
//  Created by 崔冰smile on 2019/7/10.
//  Copyright © 2019 Ziwutong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCRouterProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface CCRouter : NSObject <CCRouterProtocol>

+ (instancetype)sharedInstance;


@end

NS_ASSUME_NONNULL_END
