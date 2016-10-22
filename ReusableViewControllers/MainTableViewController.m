//
//  MainTableViewController.m
//  ReusableViewControllers
//
//  Created by Francois Courville on 2015-04-11.
//  Copyright (c) 2015 Frankacy. All rights reserved.
//

#import "MainTableViewController.h"

typedef NS_ENUM(NSInteger, MainTableViewRow) {
    MainTableViewRowFollowers,
    MainTableViewRowTagFriends,
    MainTableViewRowSearch,
    MainTableViewRowCOUNT
};

@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (instancetype)init {
    self = [super initWithStyle:UITableViewStylePlain];
    if (!self) {
        return nil;
    }
    
    self.navigationItem.title = @"Reusable VCs";
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Remove extra rows
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return MainTableViewRowCOUNT;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainTableViewRow"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainTableViewRow"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = [self textLabelForRow:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case MainTableViewRowFollowers:
            [self.delegate navigateToFollowersFromMainTableViewController:self];
            break;
        case MainTableViewRowTagFriends:
            [self.delegate navigateToTagFriendFromMainTableViewController:self];
            break;
        case MainTableViewRowSearch:
            [self.delegate navigateToSearchFromMainTableViewController:self];
            break;
            
        default:
            break;
    }
}

- (NSString *)textLabelForRow:(MainTableViewRow)row {
    switch (row) {
        case MainTableViewRowFollowers:
            return @"My Followers";
            break;
        case MainTableViewRowTagFriends:
            return @"Tag a friend!";
            break;
        case MainTableViewRowSearch:
            return @"Perform a search!";
            break;
        default:
            return nil;
    }
}

@end
