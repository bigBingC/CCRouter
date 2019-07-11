//
//  CCDeepLinkRouter.m
//  CCRouter
//
//  Created by 崔冰smile on 2019/7/10.
//

#import "CCDeepLinkRouter.h"
#import "CCRouterInfo.h"

@interface CCDeepLinkRouter ()
//路由去重有序
@property (nonatomic) NSMutableOrderedSet *routes;

@property (nonatomic) NSMutableDictionary *blocksByRoute;

@end

@implementation CCDeepLinkRouter

- (instancetype)init {
    if (self = [super init]) {
        _routes = [NSMutableOrderedSet new];
        _blocksByRoute = [NSMutableDictionary new];
    }
    return self;
}

- (void)registerBlock:(void (^)(NSDictionary * _Nonnull))routeHandleBlock forRoute:(NSString *)route {
    if (routeHandleBlock && route.length > 0) {
        [self.routes addObject:route];
        [self.blocksByRoute setObject:[routeHandleBlock copy] forKey:route];
    }
}

- (BOOL)handleRoute:(NSString *)fullRoute {
    if (fullRoute.length == 0 || self.routes.count == 0) {
        return NO;
    }
    
    for (NSString *route in self.routes) {
        if (![self routeMatch:fullRoute route:route]) {
            continue;
        }
        
        CCRouterInfo *info = [self routeInfo:fullRoute];
        if (!info || !info.routePath) {
            return NO;
        }
        
        void (^handleBlock)(NSDictionary *) = self.blocksByRoute[info.routePath];
        if (handleBlock) {
            handleBlock(info.routeParameter);
        }
        return YES;
    }
    return NO;
}

/**
 例如dankegongyu://app/sale/tasklist?title=任务列表&code=12
 */
- (CCRouterInfo *)routeInfo:(NSString *)fullRoute {
    CCRouterInfo *info = [[CCRouterInfo alloc] init];
    NSArray *fullParts = [fullRoute componentsSeparatedByString:@"://"];
    if (fullParts.count < 2) {
        return nil;
    }
    
    info.scheme = [fullParts firstObject];
    NSString *delimiter = @"?";
    NSArray *routePartArray = [fullRoute componentsSeparatedByString:delimiter];
    info.routePath = [routePartArray firstObject];
    if (routePartArray.count == 1) {
        info.routeParameter = @{};
        return info;
    }
    
    NSAssert(routePartArray.count > 1, @"带参Route必须包含“?”右侧参数");
    NSString *paramsString = [routePartArray objectAtIndex:1];
    delimiter = @"&";
    NSMutableDictionary *paramsDict = [NSMutableDictionary dictionary];
    NSArray *paramsPartArray = [paramsString componentsSeparatedByString:delimiter];
    delimiter = @"=";
    for (NSString *keyAndValue in paramsPartArray) {
        NSArray *keyValueArray = [keyAndValue componentsSeparatedByString:delimiter];
        NSAssert(keyValueArray.count == 2, @"参数key和value都不能为空");
        NSString *key = [keyValueArray firstObject];
        NSString *value = [keyValueArray lastObject];
        [paramsDict setObject:value forKey:key];
    }
    info.routeParameter = paramsDict;
    return info;
}

- (BOOL)routeMatch:(NSString *)fullRoute route:(NSString *)route {
    return [fullRoute hasPrefix:route];
}

@end
