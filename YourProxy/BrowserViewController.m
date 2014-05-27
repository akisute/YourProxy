//
//  BrowserViewController.m
//  YourProxy
//
//  Created by Ono Masashi on 2014/05/27.
//  Copyright (c) 2014年 akisute. All rights reserved.
//

#import "BrowserViewController.h"

@interface BrowserViewController ()
@property (nonatomic, weak) IBOutlet UIWebView *webView;
@end

@implementation BrowserViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost:18888"]];
    [self.webView loadRequest:request];
}

@end
