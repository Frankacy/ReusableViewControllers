//
//  PersonTableViewCell.h
//  ReusableViewControllers
//
//  Created by Francois Courville on 2015-04-11.
//  Copyright (c) 2015 Frankacy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Person;

@interface PersonTableViewCell : UITableViewCell

@property(nonatomic, weak) Person *person;

@end
