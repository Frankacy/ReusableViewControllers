//
//  TagViewController.h
//  ReusableViewControllers
//
//  Created by Francois Courville on 2015-04-11.
//  Copyright (c) 2015 Frankacy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Person;
@class TagViewController;

@protocol TagViewControllerDelegate <NSObject>

- (void)tagViewController:(TagViewController *)controller didTagPerson:(Person *)person;

@end

@interface TagViewController : UIViewController

@property(nonatomic, weak) id<TagViewControllerDelegate> delegate;

@end
