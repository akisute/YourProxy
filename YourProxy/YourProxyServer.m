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
    // Doesn't work at this point since the socket is just begin accepting, not connected.
    // In fact, the socket must be connected before marking it as background-capable socket.
    // This is not good for proxy server... :(
    [sock performBlock:^{
        BOOL result = [sock enableBackgroundingOnSocket];
        NSLog(@"enableBackgroundingOnSocket = %d", result);
    }];
    [super socket:sock didAcceptNewSocket:newSocket];
}

@end
