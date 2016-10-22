//
//  MainTableViewController.h
//  ReusableViewControllers
//
//  Created by Francois Courville on 2015-04-11.
//  Copyright (c) 2015 Frankacy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainTableViewController;

@protocol MainTableViewControllerDelegate <NSObject>

- (void)navigateToFollowersFromMainTableViewController:(MainTableViewController *)controller;
- (void)navigateToTagFriendFromMainTableViewController:(MainTableViewController *)controller;
- (void)navigateToSearchFromMainTableViewController:(MainTableViewController *)controller;

@end

@interface MainTableViewController : UITableViewController

@property(nonatomic, weak) id<MainTableViewControllerDelegate> delegate;

@end
