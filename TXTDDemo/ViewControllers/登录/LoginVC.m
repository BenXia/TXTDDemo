//
//  LoginVC.m
//  Dentist
//
//  Created by 王涛 on 16/1/16.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "LoginVC.h"
#import "LoginVM.h"
#import "RegistStepOneVC.h"

@interface LoginVC () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextFileld;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (strong, nonatomic) LoginVM *loginVM;

@end

@implementation LoginVC

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [self initNavigationBar];
    [self initUIRelated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (void)initNavigationBar {
    self.title = @"登录";
    self.navigationController.navigationBarHidden = YES;
}

- (void)initUIRelated {
    self.loginBtn.layer.cornerRadius = self.loginBtn.height/2;
    self.loginBtn.layer.masksToBounds = YES;
    self.nameTextFileld.delegate = self;
    self.passwordTextField.delegate = self;
    
    // 主动获取焦点
    [self.nameTextFileld becomeFirstResponder];
}

#pragma mark - Event Response

- (IBAction)onLoginBtn:(UIButton *)sender {
    [self.loginVM loginWithName:self.nameTextFileld.text PassWord:self.passwordTextField.text];
}

- (void)onForgetPassword {
    // 找回密码
}

- (void)onRegist {
    // 注册
    RegistStepOneVC *registVC = [[RegistStepOneVC alloc] init];
    [self.navigationController pushViewController:registVC animated:YES];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidChange:(UITextField *)textField {
    static BOOL moblieResult;
    static BOOL passwordResult;
    if (textField == self.nameTextFileld) {
        if (textField.text.length > 1) {
            moblieResult = YES;
            if (moblieResult && passwordResult) {
//                self.loginBtn.enabled = YES;
            }
        }
    } else if (textField == self.passwordTextField) {
        if (textField.text.length > 6 && textField.text.length < 20) {
            passwordResult = YES;
            if (moblieResult && passwordResult) {
//                self.loginBtn.enabled = YES;
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
