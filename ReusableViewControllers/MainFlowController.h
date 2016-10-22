//
//  MainFlowController.h
//  ReusableViewControllers
//
//  Created by Francois Courville on 2015-04-11.
//  Copyright (c) 2015 Frankacy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//Controllers
#import "MainTableViewController.h"

@interface MainFlowController : NSObject <MainTableViewControllerDelegate>

@property(nonatomic, strong) UINavigationController *navigationController;

@end
