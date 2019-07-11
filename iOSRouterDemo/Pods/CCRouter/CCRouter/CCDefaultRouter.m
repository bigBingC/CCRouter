//
//  CCDefaultRouter.m
//  CCRouter
//
//  Created by 崔冰smile on 2019/7/10.
//

#import "CCDefaultRouter.h"
#import "CCRouterProtocol.h"
#import "CCDeepLinkRouter.h"
#import "CCParameterLinkRouter.h"

@interface CCDefaultRouter () <CCRouterProtocol>

@property (nonatomic) CCDeepLinkRouter *deepLinkRouter;
@property (nonatomic) CCParameterLinkRouter *parameterLinkRouter;

@end

@implementation CCDefaultRouter

- (instancetype)init {
    self = [super init];
    if (self) {
        _deepLinkRouter = [[CCDeepLinkRouter alloc] init];
        _parameterLinkRouter = [[CCParameterLinkRouter alloc] init];
    }
    return self;
}

#pragma mark - delegate

- (void)registerBlock:(void(^)(NSDictionary *))routeHandlerBlock forRoute:(NSString *)route {
    [self.deepLinkRouter registerBlock:routeHandlerBlock forRoute:route];
}

- (BOOL)handleRoute:(NSString *)fullRoute {
    return [self.deepLinkRouter handleRoute:fullRoute];
}

- (void)registerDictionaryParamBlock:(void(^)(NSDictionary *))routeHandlerBlock  forRoute:(NSString *)route {
    [self.parameterLinkRouter registerBlock:routeHandlerBlock forRoute:route];
}

- (BOOL)handleRoute:(NSString *)baseURLString parameter: (NSDictionary *)param {
    return [self.parameterLinkRouter handleRoute:baseURLString parameter:param];
}

@end
