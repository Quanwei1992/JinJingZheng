//
//  LoginViewController.m
//  JinJingZheng
//
//  Created by 迪远 王 on 2016/10/16.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import "LoginViewController.h"
#import "Browser.h"

@interface LoginViewController (){
    Browser *browser;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    browser = [[Browser alloc] init];
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

- (IBAction)sendMessageCode:(id)sender {
    
    
    [browser requestMessageCode:self.phoneNumber.text withHandler:^(BOOL isSuccess, id data) {
        
    }];
}

- (IBAction)startLogin:(id)sender {
    [browser login:self.phoneNumber.text andMessageCode:self.messageCode.text withHandler:^(BOOL isSuccess, id data) {
        
    }];
}
@end
