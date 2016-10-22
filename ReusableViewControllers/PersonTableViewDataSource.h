//
//  PersonTableViewDataSource.h
//  ReusableViewControllers
//
//  Created by Francois Courville on 2015-04-11.
//  Copyright (c) 2015 Frankacy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;

@protocol PersonTableViewDataSource <UITableViewDataSource>

- (Person *)personAtIndexPath:(NSIndexPath *)indexPath;

@end
