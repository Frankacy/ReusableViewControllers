//
//  AppDelegate.m
//  ReusableViewControllers
//
//  Created by Francois Courville on 2015-04-11.
//  Copyright (c) 2015 Frankacy. All rights reserved.
//

#import "AppDelegate.h"
#import "MainFlowController.h"

@interface AppDelegate ()

@property(nonatomic, strong) MainFlowController *flowController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.flowController = [MainFlowController new];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.flowController.navigationController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
