//
//  YourProxyConnection.m
//  YourProxy
//
//  Created by Ono Masashi on 2014/05/27.
//  Copyright (c) 2014年 akisute. All rights reserved.
//

#import <CocoaHTTPServer/HTTPDataResponse.h>
#import "YourProxyConnection.h"

@implementation YourProxyConnection

#pragma mark - HTTPConnection

- (NSObject<HTTPResponse> *)httpResponseForMethod:(NSString *)method URI:(NSString *)path
{
    NSDate *date = [NSDate date];
    NSString *message = [NSString stringWithFormat:@"Hello! Current time is %@", date];
	return [[HTTPDataResponse alloc] initWithData:[message dataUsingEncoding:NSUTF8StringEncoding]];
}

@end
