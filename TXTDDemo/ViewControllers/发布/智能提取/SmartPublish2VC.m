//
//  SmartPublish2VC.m
//  TXTDDemo
//
//  Created by Ben on 16/3/20.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "SmartPublish2VC.h"

@interface SmartPublish2VC ()

@property (weak, nonatomic) IBOutlet UIButton *publishButton;
@property (weak, nonatomic) IBOutlet UILabel *detailInfoLabel;

@end

@implementation SmartPublish2VC

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
    [self.publishButton setNormalBackgroundColor:[g_commonConfig themeBlueColor]
                          disableBackgroundColor:[g_commonConfig gray005Color]];
}

#pragma mark - IBActions

- (IBAction)didClickPublishButtonAction:(id)sender {
    
}

@end
