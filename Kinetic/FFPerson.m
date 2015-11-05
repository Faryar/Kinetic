//
//  FFPerson.m
//  Kinetic
//
//  Created by Faryar Fathi on 2015-11-03.
//  Copyright © 2015 Webmark Interactive. All rights reserved.
//

#import "FFPerson.h"

@implementation FFPerson

- (NSString *)firstName
{
   return [_firstName capitalizedString];
}

- (NSString *)lastName
{
    return [_lastName capitalizedString];
}

- (NSString *)fullname
{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (NSString *)address
{
    return [_address capitalizedString];
}

- (NSString *)state
{
    return [_state capitalizedString];
}

- (NSString *)city
{
    return [_city capitalizedString];
}

@end
