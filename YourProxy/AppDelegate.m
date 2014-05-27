//
//  AppDelegate.m
//  YourProxy
//
//  Created by Ono Masashi on 2014/05/26.
//  Copyright (c) 2014年 akisute. All rights reserved.
//

#import "AppDelegate.h"
#import "YourProxyManager.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[YourProxyManager sharedManager].proxyServer start:NULL];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[YourProxyManager sharedManager].proxyServer stop];
}

@end
