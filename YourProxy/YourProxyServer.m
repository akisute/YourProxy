//
//  YourProxyServer.m
//  YourProxy
//
//  Created by Ono Masashi on 2014/05/27.
//  Copyright (c) 2014年 akisute. All rights reserved.
//

#import <CocoaAsyncSocket/GCDAsyncSocket.h>
#import "YourProxyServer.h"
#import "YourProxyConnection.h"

@interface HTTPServer () <GCDAsyncSocketDelegate>
@end

@interface YourProxyServer ()
@end

@implementation YourProxyServer

- (instancetype)init
{
    self = [super init];
    if (self) {
        connectionClass = [YourProxyConnection self];
    }
    return self;
}

#pragma mark - HTTPServer

- (void)socket:(GCDAsyncSocket *)sock didAcceptNewSocket:(GCDAsyncSocket *)newSocket
{
    [super socket:sock didAcceptNewSocket:newSocket];
    [newSocket performBlock:^{
        BOOL result = [newSocket enableBackgroundingOnSocket];
        NSLog(@"[INFO] enableBackgroundingOnSocket = %d", result);
    }];
}

@end
