//
//  FFAddressBookTableViewController.m
//  Kinetic
//
//  Created by Faryar Fathi on 2015-11-03.
//  Copyright © 2015 Webmark Interactive. All rights reserved.
//

#import "FFAddressBookTableViewController.h"
#import "FFNetworkManager.h"
#import "FFPerson.h"
#import "FFContactDetailsTableViewController.h"
#import <UIImageView+WebCache.h>

@interface FFAddressBookTableViewController ()

@property (nonatomic, strong) NSArray *contacts;

@end

@implementation FFAddressBookTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Contacts";

    FFNetworkManager *manager = [FFNetworkManager new];
    [manager executeFetch:^(NSArray *data, NSError *error) {
       
        if (!error) {
            self.contacts = data;
            
            dispatch_async(dispatch_get_main_queue(), ^(){
                [self.tableView reloadData];
            });
        } else {
            // TODO: Handle error
        }
    }];
}

#pragma mark - TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    FFPerson *person = self.contacts[indexPath.row];
    cell.textLabel.text = person.fullname;
    
    [cell.imageView sd_setImageWithURL:person.photoThumbnailURL
                      placeholderImage:[UIImage imageNamed:@"magnifier"]];
    
    cell.imageView.layer.cornerRadius = 15;
    cell.imageView.clipsToBounds = YES;

    return cell;
}

#pragma mark - TableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        FFPerson *person = self.contacts[indexPath.row];
        
        FFContactDetailsTableViewController *vc = segue.destinationViewController;
        vc.person = person;
    }
}


@end
