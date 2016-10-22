//
//  PersonTableViewController.h
//  ReusableViewControllers
//
//  Created by Francois Courville on 2015-04-11.
//  Copyright (c) 2015 Frankacy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonTableViewDataSource.h"

@class Person;
@class PersonTableViewController;

@protocol PersonTableViewControllerDelegate <NSObject>

@required
- (void)personTableView:(PersonTableViewController *)controller didSelectPerson:(Person *)person;

@end

@interface PersonTableViewController : UITableViewController

@property(nonatomic, weak) id<PersonTableViewControllerDelegate> delegate;

- (instancetype)initWithDataSource:(id<PersonTableViewDataSource>)dataSource;

@end
