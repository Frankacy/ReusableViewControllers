//
//  SearchResultsDataSource.h
//  ReusableViewControllers
//
//  Created by Francois Courville on 2015-04-12.
//  Copyright (c) 2015 Frankacy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonTableViewDataSource.h"

@interface SearchResultsDataSource : NSObject <PersonTableViewDataSource>

@property(nonatomic, strong) NSArray *peopleResults;

@end
