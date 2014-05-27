//
//  YourProxyManager.h
//  YourProxy
//
//  Created by Ono Masashi on 2014/05/27.
//  Copyright (c) 2014年 akisute. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YourProxyServer.h"

@interface YourProxyManager : NSObject

+ (instancetype)sharedManager;

@property (nonatomic, readonly) YourProxyServer *proxyServer;

@end
