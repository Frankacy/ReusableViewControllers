//
//  PersonTableViewDataSource.h
//  ReusableViewControllers
//
//  Created by Francois Courville on 2015-04-11.
//  Copyright (c) 2015 Frankacy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonTableViewDataSource.h"

@interface StaticPersonTableViewDataSource : NSObject <PersonTableViewDataSource>

- (instancetype)initWithPeople:(NSArray *)people;

@end
