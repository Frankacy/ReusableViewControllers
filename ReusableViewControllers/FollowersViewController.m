//
//  FollowersViewController.m
//  ReusableViewControllers
//
//  Created by Francois Courville on 2015-04-11.
//  Copyright (c) 2015 Frankacy. All rights reserved.
//

#import "FollowersViewController.h"
#import "PersonTableViewController.h"
#import "StaticPersonTableViewDataSource.h"

#import "Person.h"

#import <Masonry/Masonry.h>

@interface FollowersViewController ()

@property(nonatomic, strong) PersonTableViewController *personTableViewController;

@end

@implementation FollowersViewController

- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.navigationItem.title = @"Follower List";
    
    return self;
}

- (void)loadView {
    self.view = [[UIView alloc] init];
    
    StaticPersonTableViewDataSource *dataSource = [[StaticPersonTableViewDataSource alloc] initWithPeople:[Person createPeople]];
    self.personTableViewController = [[PersonTableViewController alloc] initWithDataSource:dataSource];
    
    [self addChildViewController:self.personTableViewController];
    [self.view addSubview:self.personTableViewController.view];
    [self.personTableViewController didMoveToParentViewController:self];
    
    [self.personTableViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

@end
