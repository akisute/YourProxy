//
//  DashboardViewController.m
//  YourProxy
//
//  Created by Ono Masashi on 2014/05/28.
//  Copyright (c) 2014年 akisute. All rights reserved.
//

#import "DashboardViewController.h"
#import "YourProxyManager.h"

@interface DashboardViewController ()
@property (nonatomic, weak) IBOutlet UILabel *serverStateLabel;
@property (nonatomic, weak) IBOutlet UIButton *toggleServerButton;
@end

@implementation DashboardViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateOutlets];
}

- (IBAction)toggleServer:(id)sender
{
    if ([[YourProxyManager sharedManager] isProxyServerRunnning]) {
        [[YourProxyManager sharedManager] stopProxyServer];
    } else {
        [[YourProxyManager sharedManager] startProxyServer];
    }
    [self updateOutlets];
}

- (void)updateOutlets
{
    if ([[YourProxyManager sharedManager] isProxyServerRunnning]) {
        self.serverStateLabel.text = @"Server is running on localhost:18888";
        [self.toggleServerButton setTitle:@"Stop Server" forState:UIControlStateNormal];
    } else {
        self.serverStateLabel.text = @"Server is not running";
        [self.toggleServerButton setTitle:@"Start Server" forState:UIControlStateNormal];
    }
}

@end
