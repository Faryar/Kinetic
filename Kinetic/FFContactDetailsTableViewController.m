//
//  FFContactDetailsTableViewController.m
//  Kinetic
//
//  Created by Faryar Fathi on 2015-11-03.
//  Copyright © 2015 Webmark Interactive. All rights reserved.
//

#import "FFContactDetailsTableViewController.h"
#import "FFPerson.h"

@interface FFContactDetailsTableViewController ()

// FIXME: These all need a label added to their name: e.g. firstNameLabel
@property (weak, nonatomic) IBOutlet UILabel *firstName;
@property (weak, nonatomic) IBOutlet UILabel *lastName;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *cellPhone;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *city;
@property (weak, nonatomic) IBOutlet UILabel *state;
@property (weak, nonatomic) IBOutlet UILabel *zip;

@end

@implementation FFContactDetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.person.fullname;
    self.firstName.text = self.person.firstName;
    self.lastName.text = self.person.lastName ;
    self.email.text = self.person.email;
    self.cellPhone.text = self.person.cell;
    self.address.text = self.person.address;
    self.city.text = self.person.city;
    self.state.text = self.person.state;
   self.zip.text = self.person.zipCode;
}

@end
