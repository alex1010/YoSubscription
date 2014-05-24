//
//  YSRegistrationViewController.m
//  YoSubscription
//
//  Created by Admin on 24.05.14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "YSRegistrationViewController.h"

@interface YSRegistrationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordConfirmationTextField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

@end

@implementation YSRegistrationViewController

- (IBAction)okButtonPressed:(id)sender {
    PFUser *user = [PFUser user];
    user.username = self.emailTextField.text;
    user.password = self.passwordTextField.text;
    user.email = self.emailTextField.text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!succeeded) {
            NSLog(@"%@", error);
            [self cancelButtonPressed:nil];
            
        }
        [YSDELEGATE setUser:user];
    }];

    
    
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{}];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
@end