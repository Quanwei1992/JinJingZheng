//
//  LoginViewController.h
//  JinJingZheng
//
//  Created by 迪远 王 on 2016/10/16.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *messageCode;
- (IBAction)sendMessageCode:(id)sender;
- (IBAction)startLogin:(id)sender;

@end
