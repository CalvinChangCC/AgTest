//
//  ContentViewController.m
//  AgTest
//
//  Created by Calvin Chang@Compal on 05/04/2017.
//  Copyright © 2017 CalvinChang. All rights reserved.
//

#import "ContentViewController.h"
#import "SWRevealViewController.h"

#define IMAGE_HAMBURGER @"HamburgerButton"

@interface ContentViewController () <UIGestureRecognizerDelegate>

@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self navSetup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)navSetup {
    //Add hamburger button
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:IMAGE_HAMBURGER] style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationItem setLeftBarButtonItem:leftButton];
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.navigationItem.leftBarButtonItem setTarget: self.revealViewController];
        [self.navigationItem.leftBarButtonItem setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
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
