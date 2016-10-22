//
//  SearchResultsDataSource.m
//  ReusableViewControllers
//
//  Created by Francois Courville on 2015-04-12.
//  Copyright (c) 2015 Frankacy. All rights reserved.
//

#import "SearchResultsDataSource.h"
#import "PersonTableViewCell.h"

@interface SearchResultsDataSource ()

@end

@implementation SearchResultsDataSource

#pragma mark - PersonTableViewDataSource

- (Person *)personAtIndexPath:(NSIndexPath *)indexPath {
    return self.peopleResults[indexPath.row];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.peopleResults count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"personTableViewCell"];
    
    if (!cell) {
        cell = [[PersonTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"personTableViewCell"];
    }
    
    cell.person = self.peopleResults[indexPath.row];
    
    return cell;
}

@end
