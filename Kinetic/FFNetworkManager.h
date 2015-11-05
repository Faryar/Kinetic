//
//  NetworkManager.h
//  Kinetic
//
//  Created by Faryar Fathi on 2015-11-03.
//  Copyright © 2015 Webmark Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NetworkOperationResult)(NSArray *persons, NSError *error);

@interface FFNetworkManager : NSObject

- (void)executeFetch:(NetworkOperationResult)completion;

@end
