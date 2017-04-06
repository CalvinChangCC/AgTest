//
//  LoginViewController.m
//  AgTest
//
//  Created by Calvin Chang@Compal on 05/04/2017.
//  Copyright © 2017 CalvinChang. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *accountTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)loginButtonTouchDown:(id)sender {
}

@end
