//
//  ForgetPasswordStepThreeVC.m
//  TXTDDemo
//
//  Created by Ben on 16/3/19.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "ForgetPasswordStepThreeVC.h"

@interface ForgetPasswordStepThreeVC ()

@property (weak, nonatomic) IBOutlet UIButton *nextStepButton;

@end

@implementation ForgetPasswordStepThreeVC

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
    self.nextStepButton.layer.cornerRadius = 5;
    self.nextStepButton.layer.masksToBounds = YES;
    [self.nextStepButton setNormalBackgroundColor:[g_commonConfig themeBlueColor]
                          disableBackgroundColor:[g_commonConfig gray005Color]];
}

#pragma mark - IBActions

- (IBAction)didClickNextStepButtonAction:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
