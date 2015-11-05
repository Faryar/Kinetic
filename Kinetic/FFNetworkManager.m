//
//  NetworkManager.m
//  Kinetic
//
//  Created by Faryar Fathi on 2015-11-03.
//  Copyright © 2015 Webmark Interactive. All rights reserved.
//

#import "FFNetworkManager.h"
#import "FFContactParser.h"

@interface FFNetworkManager ()

@property (nonatomic, strong) NSURLSession *session;

@end

@implementation FFNetworkManager

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        self.session = [NSURLSession sessionWithConfiguration:config delegate:nil delegateQueue:nil];
    }
    
    return self;
}

- (void)executeFetch:(NetworkOperationResult)completion
{
    NSURL *url = [NSURL URLWithString:@"http://api.randomuser.me/?results=20&key=ABCD-1234-EFGH-5678&nat=us"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *task = [self.session dataTaskWithRequest:request completionHandler:^(NSData *  data, NSURLResponse *  response, NSError * error) {
        
        if (error) {
            completion(nil, error);
            
            return;
        }
        
        if (data) {
            NSError *error = nil;
            NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data
                                                                    options:NSJSONReadingAllowFragments
                                                                    error:&error];
            if (!error) {
                FFContactParser *parser = [FFContactParser new];
                NSArray *contacts = [parser contactsFromData:results];
                completion(contacts, nil);
            } else {
                completion(nil, error);
            }
        }
    }];
    
    [task resume];
}

@end
