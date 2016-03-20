//
//  SmartPublishVC.m
//  TXTDDemo
//
//  Created by Ben on 16/3/20.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "SmartPublishVC.h"
#import "SmartPublish2VC.h"

@interface SmartPublishVC ()

@property (weak, nonatomic) IBOutlet PlaceholderTextView *inputTextView;
@property (weak, nonatomic) IBOutlet UIButton *extractButton;

@end

@implementation SmartPublishVC

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
    
    self.inputTextView.layer.borderColor = RGB(210, 210, 210).CGColor;
    self.inputTextView.layer.borderWidth = 1;
    self.inputTextView.layer.masksToBounds = YES;
    
    self.inputTextView.placeholder = @"输入在QQ，微信等渠道发布的信息，系统自动定位类别并完成信息提取，更便捷";
    self.inputTextView.spaceForPlaceHodlerType = 20;
    self.inputTextView.placeholderType = PlaceholderType_Center;
    
    self.extractButton.layer.cornerRadius = 5;
    self.extractButton.layer.masksToBounds = YES;
    [self.extractButton setNormalBackgroundColor:[g_commonConfig themeBlueColor]
                          disableBackgroundColor:[g_commonConfig gray005Color]];
}

#pragma mark - IBActions

- (IBAction)didClickExtractButtonAction:(id)sender {
    SmartPublish2VC *vc = [[SmartPublish2VC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
