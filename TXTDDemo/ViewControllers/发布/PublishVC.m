//
//  PublishVC.m
//  TXTDDemo
//
//  Created by Ben on 16/3/19.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "PublishVC.h"
#import "SmartPublishVC.h"
#import "InputPublishVC.h"

@interface PublishVC ()

@property (weak, nonatomic) IBOutlet UIButton *smartButton;
@property (weak, nonatomic) IBOutlet UIButton *inputButton;
@property (weak, nonatomic) IBOutlet UILabel *smartDetailInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *inputDetailInfoLabel;

@end

@implementation PublishVC

#pragma mark - View life cycle

- (instancetype)init {
    if (self = [super init]) {
        self.title = @"我要报价";
        self.tabBarItem.title = @"";
        self.tabBarItem.image = [[UIImage imageNamed:@"tabbtn_fabu"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbtn_fabu_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}

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
    [self.smartButton setNormalBackgroundColor:[g_commonConfig themeGreenColor]
                        disableBackgroundColor:[g_commonConfig gray005Color]];
    [self.inputButton setNormalBackgroundColor:[UIColor whiteColor]
                        disableBackgroundColor:[g_commonConfig gray005Color]];
    
    self.smartDetailInfoLabel.numberOfLines = 0;
    self.inputDetailInfoLabel.numberOfLines = 0;
}

#pragma mark - IBActions

- (IBAction)didClickSmartButtonAction:(id)sender {
    SmartPublishVC *vc = [[SmartPublishVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)didClickInputButtonAction:(id)sender {
    InputPublishVC *vc = [[InputPublishVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
