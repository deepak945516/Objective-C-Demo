//
//  LoginViewController.m
//  ObjCDemo
//
//  Created by Deepak Kumar on 03/12/18.
//  Copyright © 2018 deepak. All rights reserved.
//

#import "LoginViewController.h"
#import "HomeViewController.h"

@interface LoginViewController ()

#pragma Properties
@property(weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property(weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property(weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation LoginViewController

#pragma Variables

#pragma Life Cycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initialSetup];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    UIWindow *window = UIApplication.sharedApplication.delegate.window;
//    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    HomeViewController *homeViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController: homeViewController];
//    window.rootViewController = navigationController;
}

// dealloc the login view controller
-(void)dealloc {
    NSLog(@"LoginViewController is being deallocated");
}

#pragma Setup Method
- (void)initialSetup {
    _loginButton.layer.cornerRadius = _loginButton.frame.size.height / 2;
    //_loginButton.layer.masksToBounds = true;
    _usernameTextField.delegate = self;
    _passwordTextField.delegate = self;
}

- (IBAction)loginButtonTapped: (UIButton *) sender {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName: @"Main" bundle: nil];
    LoginViewController *homeViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    [self.navigationController pushViewController:homeViewController animated:true];
}



# pragma mark TextFieldDelegate
// MARK: - TextField Delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if(textField == _usernameTextField) {
        [_passwordTextField becomeFirstResponder];
    } else {
        [self.view endEditing:true];
    }
    return true;
}

@end
