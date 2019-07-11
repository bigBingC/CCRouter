//
//  CCParameterLinkRouter.m
//  CCRouter
//
//  Created by 崔冰smile on 2019/7/10.
//

#import "CCParameterLinkRouter.h"

@interface CCParameterLinkRouter ()

@property (nonatomic) NSMutableOrderedSet *routes;
@property (nonatomic) NSMutableDictionary *blocksByRoute;

@end

@implementation CCParameterLinkRouter

- (instancetype)init {
    if (self = [super init]) {
        _routes = [NSMutableOrderedSet new];
        _blocksByRoute = [NSMutableDictionary new];
    }
    return self;
}

- (void)registerBlock:(void(^)(NSDictionary *))routeHandleBlock  forRoute:(NSString *)route {
    if (routeHandleBlock && route.length >0) {
        [self.routes addObject:route];
        [self.blocksByRoute setObject:[routeHandleBlock copy] forKey:route];
    }
}

/**
 执行 route
 @param baseURLString router的基地址 例如：dankegongyu://app/sale/houselist
 @param parameter 执行对应router 传入的参数
 */
- (BOOL)handleRoute:(NSString *)baseURLString parameter: (NSDictionary *)parameter {
    if (baseURLString.length == 0 || self.routes.count == 0) {
        return NO;
    }
    
    for (NSString *route in self.routes) {
        if (![self routeMatch:baseURLString route:route]) {
            continue;
        }
        
        void (^ handlerBlock)(NSDictionary *)  = self.blocksByRoute[baseURLString];
        if (handlerBlock) {
            handlerBlock(parameter);
        }
        return YES;
    }
    
    return NO;
}

- (BOOL)routeMatch:(NSString *)route1 route:(NSString *)router2 {
    return [route1 hasPrefix:router2];
}

@end
