//
//  Person.h
//  ReusableViewControllers
//
//  Created by Francois Courville on 2015-04-11.
//  Copyright (c) 2015 Frankacy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(strong) NSString *name;
@property(strong) NSURL *avatarURL;

+ (NSArray *)createPeople;

@end
