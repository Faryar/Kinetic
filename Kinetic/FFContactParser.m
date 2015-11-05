//
//  FFContactParser.m
//  Kinetic
//
//  Created by Faryar Fathi on 2015-11-03.
//  Copyright © 2015 Webmark Interactive. All rights reserved.
//

#import "FFContactParser.h"
#import "FFPerson.h"

@implementation FFContactParser

- (NSArray *)contactsFromData:(NSDictionary *)data
{
    NSArray *array = data[@"results"];
    
    NSMutableArray *persons = [NSMutableArray array];
    
    for (id object in array) {
        FFPerson *person = [FFPerson new];
        person.firstName = [object valueForKeyPath:@"user.name.first"];
        person.lastName = [object valueForKeyPath:@"user.name.last"];
        person.email = [object valueForKeyPath:@"user.email"];
        person.cell = [object valueForKeyPath:@"user.cell"];
        person.address = [object valueForKeyPath:@"user.location.street"];
        person.city = [object valueForKeyPath:@"user.location.city"];
        person.state = [object valueForKeyPath:@"user.location.state"];
        NSNumber *zip = [object valueForKeyPath:@"user.location.zip"];
        person.zipCode = [zip stringValue];
        NSString *urlString = [object valueForKeyPath:@"user.picture.thumbnail"];
        person.photoThumbnailURL = [NSURL URLWithString:urlString];
        [persons addObject:person];
    }
    
    // Return Non-mutable array
    return [NSArray arrayWithArray:persons];
}

@end
