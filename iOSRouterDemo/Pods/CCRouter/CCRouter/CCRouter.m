//
//  CCRouter.m
//  iOSRouterDemo
//
//  Created by 崔冰smile on 2019/7/10.
//  Copyright © 2019 Ziwutong. All rights reserved.
//

#import "CCRouter.h"
#import "CCDefaultRouter.h"

@interface CCRouter ()
@property (nonatomic, strong) CCDefaultRouter<CCRouterProtocol> *realRouter;
@end

@implementation CCRouter

+ (instancetype)sharedInstance {
    static CCRouter *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CCRouter alloc] init];
    });
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        _realRouter = [[CCDefaultRouter alloc] init];
    }
    return self;
}

#pragma mark - delegate

- (void)registerBlock:(void(^)(NSDictionary *))routeHandlerBlock forRoute:(NSString *)route {
    [self.realRouter registerBlock:routeHandlerBlock forRoute:route];
}

- (BOOL)handleRoute:(NSString *)fullRoute {
    return [self.realRouter handleRoute:fullRoute];
}

- (void)registerDictionaryParamBlock:(void(^)(NSDictionary *))routeHandlerBlock  forRoute:(NSString *)route {
    [self.realRouter registerDictionaryParamBlock:routeHandlerBlock forRoute:route];
}

- (BOOL)handleRoute:(NSString *)baseURLString parameter: (NSDictionary *)param {
    return [self.realRouter handleRoute:baseURLString parameter:param];
}

@end
