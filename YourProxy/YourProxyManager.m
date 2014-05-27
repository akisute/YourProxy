//
//  YourProxyManager.m
//  YourProxy
//
//  Created by Ono Masashi on 2014/05/27.
//  Copyright (c) 2014年 akisute. All rights reserved.
//

#import "YourProxyManager.h"

@interface YourProxyManager ()
@property (nonatomic) YourProxyServer *proxyServer;
@end

@implementation YourProxyManager

+ (instancetype)sharedManager
{
    static YourProxyManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [YourProxyManager new];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.proxyServer = [YourProxyServer new];
        self.proxyServer.port = 18888;
    }
    return self;
}

@end
