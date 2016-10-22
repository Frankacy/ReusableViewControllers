//
//  MainFlowController.m
//  ReusableViewControllers
//
//  Created by Francois Courville on 2015-04-11.
//  Copyright (c) 2015 Frankacy. All rights reserved.
//

#import "MainFlowController.h"
#import "FollowersViewController.h"
#import "TagViewController.h"
#import "SearchViewController.h"

#import "Person.h"

@interface MainFlowController () <MainTableViewControllerDelegate,
                                  TagViewControllerDelegate,
                                  SearchViewControllerDelegate>

@end

@implementation MainFlowController

- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    [self setupInitialViewController];
    
    return self;
}

- (void)setupInitialViewController {
    MainTableViewController *mainTableViewController = [[MainTableViewController alloc] init];
    mainTableViewController.delegate = self;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mainTableViewController];
    
    self.navigationController = navigationController;
}

#pragma mark - MainTableViewControllerDelegate

- (void)navigateToFollowersFromMainTableViewController:(MainTableViewController *)controller {
    FollowersViewController *viewController = [[FollowersViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)navigateToTagFriendFromMainTableViewController:(MainTableViewController *)controller {
    TagViewController *viewController = [[TagViewController alloc] init];
    viewController.delegate = self;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)navigateToSearchFromMainTableViewController:(MainTableViewController *)controller {
    SearchViewController *viewController = [[SearchViewController alloc] initWithPeople:[Person createPeople]];
    viewController.delegate = self;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - TagViewControllerDelegate

- (void)tagViewController:(TagViewController *)controller didTagPerson:(Person *)person {
    NSLog(@"You've tagged person: %@", person.name);
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - SearchViewControllerDelegate

- (void)searchViewController:(SearchViewController *)controller didSelectPerson:(Person *)person {
    NSLog(@"You've found person: %@", person.name);
}

@end
