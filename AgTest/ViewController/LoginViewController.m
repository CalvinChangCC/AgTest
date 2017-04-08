//
//  LoginViewController.m
//  AgTest
//
//  Created by Calvin Chang@Compal on 05/04/2017.
//  Copyright © 2017 CalvinChang. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginManager.h"

#define SEGUE_MAIN_VIEW @"segue_enter_main_view"

@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *accountTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@property (strong, nonatomic) LoginManager *loginManager;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonTouchDown:(id)sender {
    CurrentUser *user = [self getCurrentInput];
    self.loginManager = [LoginManager sharedInstance];
    [self.loginManager login:user keepLogin:YES complete:^(Boolean isSuccess, NSDictionary *response) {
        NSLog(@"Response is %@",response);
        //If success enter main view
        [self performSegueWithIdentifier:SEGUE_MAIN_VIEW sender:self];
    }];
}

- (CurrentUser *)getCurrentInput {
    CurrentUser *user = [[CurrentUser alloc] init];
    user.userName = self.accountTextField.text;
    user.password = self.passwordTextField.text;
    return user;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
@end
