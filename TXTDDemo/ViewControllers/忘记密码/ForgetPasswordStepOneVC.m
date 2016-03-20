//
//  ForgetPasswordStepOneVC.m
//  TXTDDemo
//
//  Created by Ben on 16/3/19.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "ForgetPasswordStepOneVC.h"
#import "ForgetPasswordStepTwoVC.h"

@interface ForgetPasswordStepOneVC ()

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *contentViewArray;
@property (weak, nonatomic) IBOutlet UIButton *sendSmsButton;
@property (weak, nonatomic) IBOutlet UIButton *nextStepButton;
@property (weak, nonatomic) IBOutlet UIControl *popupBackgroundView;
@property (weak, nonatomic) IBOutlet UIButton *phoneCallButton;
@property (weak, nonatomic) IBOutlet UIButton *callKeFuButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomContentViewBottomConstraint;

@end

@implementation ForgetPasswordStepOneVC

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUIRelated];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (void)initUIRelated {
    self.sendSmsButton.layer.cornerRadius = 5;
    self.sendSmsButton.layer.masksToBounds = YES;
    self.nextStepButton.layer.cornerRadius = 5;
    self.nextStepButton.layer.masksToBounds = YES;
    
    for (UIView *contentView in self.contentViewArray) {
        contentView.layer.borderColor = RGB(210, 210, 210).CGColor;
        contentView.layer.borderWidth = 1;
    }
    
    [self.sendSmsButton setNormalBackgroundColor:[g_commonConfig themeGreenColor]
                          disableBackgroundColor:[g_commonConfig gray005Color]];
    [self.nextStepButton setNormalBackgroundColor:[g_commonConfig themeBlueColor]
                          disableBackgroundColor:[g_commonConfig gray005Color]];
    [self.callKeFuButton setNormalBackgroundColor:[g_commonConfig themeBlueColor]
                           disableBackgroundColor:[g_commonConfig gray005Color]];
    [self.phoneCallButton setNormalBackgroundColor:[g_commonConfig themeBlueColor]
                            disableBackgroundColor:[g_commonConfig gray005Color]];
}

- (void)showPopupView {
    self.bottomContentViewBottomConstraint.constant = -80;
    self.popupBackgroundView.hidden = NO;
    [self.view layoutIfNeeded];
    
    self.bottomContentViewBottomConstraint.constant = 0;
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)hidePopupView {
    self.bottomContentViewBottomConstraint.constant = -80;
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.popupBackgroundView.hidden = YES;
    }];
}

#pragma mark - IBActions

- (IBAction)didClickNextStepButtonAction:(id)sender {
    ForgetPasswordStepTwoVC *vc = [[ForgetPasswordStepTwoVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)didClickSendSmsButtonAction:(id)sender {
    
}

- (IBAction)didClickCannotGetSmsButtonAction:(id)sender {
    [self showPopupView];
}

- (IBAction)didClickPopupBackgroundViewAction:(id)sender {
    [self hidePopupView];
}

- (IBAction)didClickPhoneCallButtonAction:(id)sender {
    
    
    [self hidePopupView];
}

- (IBAction)didClickCallKefuButtonAction:(id)sender {
    
    
    [self hidePopupView];
}



@end
