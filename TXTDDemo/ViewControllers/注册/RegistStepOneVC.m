//
//  RegistStepOneVC.m
//  TXTDDemo
//
//  Created by Ben on 16/3/19.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "RegistStepOneVC.h"
#import "RegistStepTwoVC.h"

@interface RegistStepOneVC ()

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *contentViewArray;
@property (weak, nonatomic) IBOutlet UIButton *sendSmsButton;
@property (weak, nonatomic) IBOutlet UIButton *nextStepButton;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation RegistStepOneVC

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
    
    self.descriptionLabel.numberOfLines = 0;
}

#pragma mark - IBActions

- (IBAction)didClickNextStepButtonAction:(id)sender {
    RegistStepTwoVC *vc = [[RegistStepTwoVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)didClickSendSmsButtonAction:(id)sender {
    
}

@end
