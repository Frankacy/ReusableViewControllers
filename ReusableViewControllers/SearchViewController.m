//
//  SearchViewController.m
//  ReusableViewControllers
//
//  Created by Francois Courville on 2015-04-11.
//  Copyright (c) 2015 Frankacy. All rights reserved.
//

#import "SearchViewController.h"
#import "PersonTableViewController.h"
#import "StaticPersonTableViewDataSource.h"
#import "SearchResultsDataSource.h"

#import "Person.h"

#import <Masonry/Masonry.h>

@interface SearchViewController () <PersonTableViewControllerDelegate, UISearchResultsUpdating>

@property(nonatomic, strong) NSArray *searchPeople;

@property(nonatomic, strong) PersonTableViewController *personTableViewController;
@property(nonatomic, strong) UISearchController *searchController;

@property(nonatomic, strong) SearchResultsDataSource *resultsDataSource;
@property(nonatomic, strong) PersonTableViewController *resultsTableViewController;

@end

@implementation SearchViewController

- (instancetype)initWithPeople:(NSArray *)people {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _searchPeople = people;
    self.navigationItem.title = @"Filter";
    
    return self;
}

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    StaticPersonTableViewDataSource *dataSource = [[StaticPersonTableViewDataSource alloc] initWithPeople:self.searchPeople];
    self.personTableViewController = [[PersonTableViewController alloc] initWithDataSource:dataSource];
    self.personTableViewController.delegate = self;
    
    [self addChildViewController:self.personTableViewController];
    [self.view addSubview:self.personTableViewController.tableView];
    [self.personTableViewController didMoveToParentViewController:self];
    
    self.resultsDataSource = [[SearchResultsDataSource alloc] init];
    self.resultsTableViewController = [[PersonTableViewController alloc] initWithDataSource:self.resultsDataSource];
    self.resultsTableViewController.delegate = self;
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:self.resultsTableViewController];
    self.searchController.searchBar.placeholder = @"Filter";
    self.searchController.searchResultsUpdater = self;
   
    [self.searchController.searchBar sizeToFit];
    self.personTableViewController.tableView.tableHeaderView = self.searchController.searchBar;
    self.definesPresentationContext = YES;
    
    [self setupConstraints];
}

- (void)setupConstraints {
    [self.personTableViewController.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - PersonTableViewControllerDelegate

- (void)personTableView:(PersonTableViewController *)controller didSelectPerson:(Person *)person {
    [self.delegate searchViewController:self didSelectPerson:person];
}

#pragma mark - UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchTerm = searchController.searchBar.text;
    
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"name contains[cd] %@", searchTerm];
    NSArray *filteredPeople = [self.searchPeople filteredArrayUsingPredicate:searchPredicate];
    
    self.resultsDataSource.peopleResults = filteredPeople;
    [[(UITableViewController *)searchController.searchResultsController tableView] reloadData];
}

@end
