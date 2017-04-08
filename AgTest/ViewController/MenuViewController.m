//
//  MenuViewController.m
//  AgTest
//
//  Created by Calvin Chang@Compal on 05/04/2017.
//  Copyright © 2017 CalvinChang. All rights reserved.
//

#import "MenuViewController.h"
#import "PreferenceManager.h"
#import "SWRevealViewController.h"

@interface MenuViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Select at %@", indexPath);
    switch (indexPath.row) {
        case 1:
            [self memberListAction];
            break;
        case 2:
            [self createMemberAction];
            break;
        case 3:
            [self logoutAction];
            break;
        default:
            break;
    }
    [self.revealViewController revealToggle:nil];
}

- (void)memberListAction {

}

- (void)createMemberAction {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Create New Member" message:@"Enter name of member" preferredStyle:  UIAlertControllerStyleAlert];
    __block NSString *newMemberName;
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        newMemberName = textField.text;
    }];

    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //Add Member
    }]];

    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)logoutAction {
    PreferenceManager *manager = [[PreferenceManager alloc] init];
    [manager cleanLoginData];
    [self dismissViewControllerAnimated:YES completion:nil];
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
