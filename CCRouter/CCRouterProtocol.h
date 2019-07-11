//
//  CCRouterProtocol.h
//  CCRouter
//
//  Created by 崔冰smile on 2019/7/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CCRouterProtocol <NSObject>

@required
/**
 注册处理 Route 的代码
 @param routeHandlerBlock 处理RouterURL 的 block
 @param route 跳转 route url
 */
- (void)registerBlock:(void(^)(NSDictionary *))routeHandlerBlock  forRoute:(NSString *)route;

/**
 注册处理 Route 的代码，只不过 route 的参数，不是通过key=value 方式写在 url 里面，而是通过NSDictionary 方式传入。
 响应方法 - (BOOL)handleRoute:(NSString *)baseURLString parameter: (NSDictionary *)param;
 @param routeHandlerBlock 处理RouterURL 的 block
 @param route 跳转 route baseURL
 */
- (void)registerDictionaryParamBlock:(void(^)(NSDictionary *))routeHandlerBlock  forRoute:(NSString *)route;

/**
 执行 route
 @param fullRoute route+parameter 例如：dankegongyu://app/sale/houselist?token=1234567
 */
- (BOOL)handleRoute:(NSString *)fullRoute;

/**
 执行 route
 @param baseURLString router的基地址 例如：dankegongyu://app/sale/houselist
 @param parameter 执行对应router 传入的参数
 */
- (BOOL)handleRoute:(NSString *)baseURLString parameter: (NSDictionary *)parameter;


@end

NS_ASSUME_NONNULL_END
