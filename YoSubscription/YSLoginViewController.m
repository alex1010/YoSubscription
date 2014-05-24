//
//  YSLoginViewController.m
//  YoSubscription
//
//  Created by Александр Токарев on 24.05.14.
//  Copyright (c) 2014 Александр Токарев. All rights reserved.
//

#import "YSLoginViewController.h"

@interface YSLoginViewController ()

@property (nonatomic) PFUser *user;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;


@end

@implementation YSLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)okButtonPressed:(id)sender {
    [self.activityView startAnimating];
    [PFUser logInWithUsernameInBackground:self.emailTextField.text password:self.passwordTextField.text block:^(PFUser *user, NSError *error) {
        [self.activityView stopAnimating];
        self.user = user;
        if (!user) {
            NSLog(@"%@", error);
        }
    }];
}

- (IBAction)continueButtonPressed:(id)sender {
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];

}



@end
