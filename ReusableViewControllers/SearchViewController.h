//
//  SearchViewController.h
//  ReusableViewControllers
//
//  Created by Francois Courville on 2015-04-11.
//  Copyright (c) 2015 Frankacy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Person;
@class SearchViewController;

@protocol SearchViewControllerDelegate <NSObject>

- (void)searchViewController:(SearchViewController *)controller didSelectPerson:(Person *)person;

@end

@interface SearchViewController : UIViewController

@property(nonatomic, weak) id<SearchViewControllerDelegate> delegate;

- (instancetype)initWithPeople:(NSArray *)people;

@end
