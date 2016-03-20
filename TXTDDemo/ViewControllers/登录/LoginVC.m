//
//  LoginVC.m
//  TXTDDemo
//
//  Created by Ben on 16/3/19.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "LoginVC.h"
#import "LoginVM.h"
#import "RegistStepOneVC.h"
#import "ForgetPasswordStepOneVC.h"

@interface LoginVC () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextFileld;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIView *userNameView;
@property (weak, nonatomic) IBOutlet UIView *passwordView;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (strong, nonatomic) LoginVM *loginVM;

@end

@implementation LoginVC

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [self initUIRelated];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 主动获取焦点
    [self.nameTextFileld becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (void)initUIRelated {
    self.title = @"登录";
    self.navigationController.navigationBarHidden = YES;
    
    self.loginButton.layer.cornerRadius = 5;
    self.loginButton.layer.masksToBounds = YES;
    
    self.registerButton.layer.cornerRadius = 5;
    self.registerButton.layer.masksToBounds = YES;
    
    self.userNameView.layer.borderColor = RGB(230, 230, 230).CGColor;
    self.userNameView.layer.borderWidth = 1;
    self.passwordView.layer.borderColor = RGB(230, 230, 230).CGColor;
    self.passwordView.layer.borderWidth = 1;
    
    self.nameTextFileld.delegate = self;
    self.passwordTextField.delegate = self;
    
    [self.loginButton setNormalBackgroundColor:[g_commonConfig themeBlueColor]
                        disableBackgroundColor:[g_commonConfig gray005Color]];
    [self.registerButton setNormalBackgroundColor:[g_commonConfig themeGreenColor]
                           disableBackgroundColor:[g_commonConfig gray005Color]];
}

#pragma mark - IBActions

- (IBAction)didClickForgetPasswordButtonAction:(id)sender {
    ForgetPasswordStepOneVC *vc = [[ForgetPasswordStepOneVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)didClickLoginButtonAction:(id)sender {
    [self.loginVM loginWithName:self.nameTextFileld.text PassWord:self.passwordTextField.text];
}

- (IBAction)didClickReigsterButtonAction:(id)sender {
    RegistStepOneVC *vc = [[RegistStepOneVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidChange:(UITextField *)textField {
    static BOOL moblieResult;
    static BOOL passwordResult;
    if (textField == self.nameTextFileld) {
        if (textField.text.length > 1) {
            moblieResult = YES;
            if (moblieResult && passwordResult) {
//                self.loginButton.enabled = YES;
            }
        }
    } else if (textField == self.passwordTextField) {
        if (textField.text.length > 6 && textField.text.length < 20) {
            passwordResult = YES;
            if (moblieResult && passwordResult) {
//                self.loginButton.enabled = YES;
            }
        }
    }
}

- (LoginVM *)loginVM {
    if (!_loginVM) {
        _loginVM = [[LoginVM alloc] init];
    }
    return _loginVM;
}

@end
