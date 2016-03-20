//
//  InputPublishVC.m
//  TXTDDemo
//
//  Created by Ben on 16/3/20.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "InputPublishVC.h"

@interface InputPublishVC ()

@property (weak, nonatomic) IBOutlet UIButton *publishButton;
@property (weak, nonatomic) IBOutlet UILabel *detailInfoLabel;

@end

@implementation InputPublishVC

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initUIRelated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (void)initUIRelated {
    [self setNavTitleString:@"我要报价"];
    
    self.detailInfoLabel.numberOfLines = 0;
    
    self.publishButton.layer.cornerRadius = 5;
    self.publishButton.layer.masksToBounds = YES;
    [self.publishButton setNormalBackgroundColor:[g_commonConfig themeBlueColor]
                          disableBackgroundColor:[g_commonConfig gray005Color]];
}

#pragma mark - IBActions

- (IBAction)didClickPublishButtonAction:(id)sender {
    
}

@end
