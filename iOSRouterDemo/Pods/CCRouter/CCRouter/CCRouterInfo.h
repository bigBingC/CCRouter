//
//  CCRouterInfo.h
//  CCRouter
//
//  Created by 崔冰smile on 2019/7/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCRouterInfo : NSObject

//route 的路径部分，例如 dankegongyu://app/sale/houseSourceList
@property (nonatomic) NSString *routePath;

//route 的参数部分 例如 token = 123456 解析出来的 NSDictionary
@property (nonatomic) NSDictionary *routeParameter;

//route 的 scheme ，例如 http,dankegongyu
@property (nonatomic) NSString *scheme;

@end

NS_ASSUME_NONNULL_END
