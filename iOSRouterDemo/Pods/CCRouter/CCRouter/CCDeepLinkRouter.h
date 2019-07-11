//
//  CCDeepLinkRouter.h
//  CCRouter
//
//  Created by 崔冰smile on 2019/7/10.
//

/**
 无单独参数传递router(传参只能通过router拼接)
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCDeepLinkRouter : NSObject

/**
 注册 Route 对应的处理 block
 @param routeHandleBlock 处理 route 的 block
 @param route 执行的route 字符串
 */
- (void)registerBlock:(void(^)(NSDictionary *parameter))routeHandleBlock forRoute:(NSString *)route;

/**
 执行 route
 @param fullRoute route+parameter
 例如：dankegongyu://app/sale/houselist?token=1234567
 */
- (BOOL)handleRoute:(NSString *)fullRoute;

@end

NS_ASSUME_NONNULL_END
