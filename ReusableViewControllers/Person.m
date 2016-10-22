//
//  Person.m
//  ReusableViewControllers
//
//  Created by Francois Courville on 2015-04-11.
//  Copyright (c) 2015 Frankacy. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (NSArray *)createPeople {
    NSMutableArray *people = [NSMutableArray array];
    
    NSArray *names = @[ @"Allyson Grayce",
                        @"Ashley Ford",
                        @"James Anderson",
                        @"Justin Jackson",
                        @"Pixel Iris",
                        @"Sam Soffes",
                        @"Sarah Whinnem",
                        @"Vlad Arbatov",
                        @"Chelsea Otakan",
                        @"Jason Putorti" ];
    
    NSArray *images = @[ [NSURL URLWithString:@"https://s3.amazonaws.com/uifaces/faces/twitter/allisongrayce/128.jpg"],
                         [NSURL URLWithString:@"https://s3.amazonaws.com/uifaces/faces/twitter/ashleyford/128.jpg"],
                         [NSURL URLWithString:@"https://s3.amazonaws.com/uifaces/faces/twitter/jsa/73.jpg"],
                         [NSURL URLWithString:@"https://s3.amazonaws.com/uifaces/faces/twitter/mijustin/128.jpg"],
                         [NSURL URLWithString:@"https://s3.amazonaws.com/uifaces/faces/twitter/pixeliris/128.jpg"],
                         [NSURL URLWithString:@"https://s3.amazonaws.com/uifaces/faces/twitter/soffes/128.jpg"],
                         [NSURL URLWithString:@"https://s3.amazonaws.com/uifaces/faces/twitter/madysondesigns/128.jpg"],
                         [NSURL URLWithString:@"https://s3.amazonaws.com/uifaces/faces/twitter/vladarbatov/128.jpg"],
                         [NSURL URLWithString:@"https://s3.amazonaws.com/uifaces/faces/twitter/chexee/128.jpg"],
                         [NSURL URLWithString:@"https://s3.amazonaws.com/uifaces/faces/twitter/putorti/128.jpg"] ];
    
    for (NSInteger i = 0; i < [names count]; i++) {
        Person *person = [Person new];
        person.name = names[i];
        person.avatarURL = images[i];
        [people addObject:person];
    }
    
    return people;
}

@end
