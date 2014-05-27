//
//  AppDelegate.m
//  YourProxy
//
//  Created by Ono Masashi on 2014/05/26.
//  Copyright (c) 2014年 akisute. All rights reserved.
//

#import "AppDelegate.h"
#import "YourProxyManager.h"

@interface AppDelegate()
@property (nonatomic) UIBackgroundTaskIdentifier backgroundTaskIdentifier;
@end

@implementation AppDelegate

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[YourProxyManager sharedManager].proxyServer start:NULL];
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self beginBackgroundProcessKeepAlive];
    [application setKeepAliveTimeout:UIMinimumKeepAliveTimeout handler:^{
        // This handler will be called every 600 seconds.
        // Use this to wake up dummy background work which takes 600 seconds to keep the process living forever.
        NSLog(@"[INFO] VOIP KeepAlive handler called.");
        [self beginBackgroundProcessKeepAlive];
    }];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [application clearKeepAliveTimeout];
    [self endBackgroundProcessKeepAlive];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [application clearKeepAliveTimeout];
    [self endBackgroundProcessKeepAlive];
    [[YourProxyManager sharedManager].proxyServer stop];
}

#pragma mark - Background Processing

- (void)beginBackgroundProcessKeepAlive
{
    NSLog(@"[INFO] Trying to get an access to background processing. Remaining background timer = %f", [[UIApplication sharedApplication] backgroundTimeRemaining]);
    [self endBackgroundProcessKeepAlive];
    self.backgroundTaskIdentifier = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [self beginBackgroundProcessKeepAlive];
    }];
    if (self.backgroundTaskIdentifier == UIBackgroundTaskInvalid) {
        NSLog(@"[ERROR] beginBackgroundTask failed.");
        self.backgroundTaskIdentifier = 0;
    } else {
        NSLog(@"[INFO] beginBackgroundTask succeeded. Remaining background timer = %f", [[UIApplication sharedApplication] backgroundTimeRemaining]);
    }
}

- (void)endBackgroundProcessKeepAlive
{
    if (self.backgroundTaskIdentifier) {
        [[UIApplication sharedApplication] endBackgroundTask:self.backgroundTaskIdentifier];
        self.backgroundTaskIdentifier = 0;
    }
}

@end
