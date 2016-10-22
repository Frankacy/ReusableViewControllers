//
//  PersonTableViewDataSource.m
//  ReusableViewControllers
//
//  Created by Francois Courville on 2015-04-11.
//  Copyright (c) 2015 Frankacy. All rights reserved.
//

#import "StaticPersonTableViewDataSource.h"
#import "PersonTableViewCell.h"

@interface StaticPersonTableViewDataSource ()

@property(nonatomic, strong) NSArray *people;

@end

@implementation StaticPersonTableViewDataSource

- (instancetype)initWithPeople:(NSArray *)people {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _people = people;
    
    return self;
}

#pragma mark - PersonTableViewDataSource

- (Person *)personAtIndexPath:(NSIndexPath *)indexPath {
    return self.people[indexPath.row];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.people count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"personTableViewCell"];
    
    if (!cell) {
        cell = [[PersonTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"personTableViewCell"];
    }
    
    cell.person = self.people[indexPath.row];
    
    return cell;
}


@end
