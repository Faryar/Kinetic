//
//  FFPerson.h
//  Kinetic
//
//  Created by Faryar Fathi on 2015-11-03.
//  Copyright © 2015 Webmark Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFPerson : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong, readonly) NSString *fullname;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *zipCode;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *cell;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSURL *photoThumbnailURL;

@end
