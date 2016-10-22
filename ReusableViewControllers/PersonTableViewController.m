//
//  PersonTableViewController.m
//  ReusableViewControllers
//
//  Created by Francois Courville on 2015-04-11.
//  Copyright (c) 2015 Frankacy. All rights reserved.
//

#import "PersonTableViewController.h"

@interface PersonTableViewController ()

@property(nonatomic, strong) id<PersonTableViewDataSource> dataSource;

@end

@implementation PersonTableViewController

- (instancetype)initWithDataSource:(id<PersonTableViewDataSource>)dataSource {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _dataSource = dataSource;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.delegate ? YES : NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate personTableView:self didSelectPerson:[self.dataSource personAtIndexPath:indexPath]];
}

@end
