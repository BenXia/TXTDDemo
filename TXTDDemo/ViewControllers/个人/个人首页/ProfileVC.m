//
//  ProfileVC.m
//  Dentist
//
//  Created by Ben on 16/1/10.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "ProfileVC.h"
#import "UserInfoVC.h"
#import "AppDeinitializer.h"
#import "SettingVCViewController.h"
#import "UserDetailPageVC.h"
#import "MyMessgaeVC.h"
#import "MyOffersVC.h"
#import "MyAttentionsVC.h"

@interface ProfileVC ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UIView *headImageBackGroundView;
@property (weak, nonatomic) IBOutlet UILabel *nickLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailDecLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *footView;

@end

@implementation ProfileVC

#pragma mark - View life cycle

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"我的";
        self.tabBarItem.title = @"我的";
        self.tabBarItem.image = [[UIImage imageNamed:@"tabbtn_wode"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbtn_wode_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self clearNavLeftItem];
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (void)initUI {
    self.headImageView.layer.cornerRadius = self.headImageView.width/2;
    self.headImageView.layer.masksToBounds = YES;
    self.headImageView.userInteractionEnabled = YES;
    self.headImageBackGroundView.layer.cornerRadius = self.headImageBackGroundView.width/2;
    self.headImageBackGroundView.layer.masksToBounds = YES;
    self.headImageBackGroundView.userInteractionEnabled = YES;
    self.headerView.backgroundColor = [g_commonConfig themeBlueColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickOnHeadImageView:)];
    [self.headerView addGestureRecognizer:tap];
    self.tableView.tableFooterView = self.footView;
}

#pragma mark - IBActions

- (IBAction)onSettingBtn:(UIButton *)sender {
    SettingVCViewController *setVC = [[SettingVCViewController alloc] initWithNibName:@"SettingVCViewController" bundle:nil];
    setVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:setVC animated:YES];
}

- (void)didClickOnHeadImageView:(UITapGestureRecognizer *)tap {
    UserInfoVC *userInfoVC = [[UserInfoVC alloc] initWithNibName:@"UserInfoVC" bundle:nil];
    userInfoVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:userInfoVC animated:YES];
}

#pragma mark - Navigation Style

//- (UIColor*)preferNavBarBackgroundColor{
//    return [g_commonConfig themeBlueColor];
//}
//
//- (UIColor*)preferNavBarNormalTitleColor{
//    return [UIColor whiteColor];
//}

- (UIColor*)preferNavBarHighlightedTitleColor {
    return kWhiteHighlightedColor;
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.textColor = [g_commonConfig themeButtonBlueColor];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:15];
    cell.detailTextLabel.textColor = [g_commonConfig gray006Color];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"我的信息";
        cell.imageView.image = [UIImage imageNamed:@"wdxx"];
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"我的报价";
        cell.imageView.image = [UIImage imageNamed:@"wdbj"];
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"我的关注";
        cell.imageView.image = [UIImage imageNamed:@"wdgz"];
    } else if (indexPath.row == 3){
        cell.textLabel.text = @"我的偏好";
        cell.imageView.image = [UIImage imageNamed:@"wdph"];
    } else {
        cell.textLabel.text = @"我的消息";
        cell.imageView.image = [UIImage imageNamed:@"wdxiaoxi"];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {           //我的信息
        UserInfoVC *userInfoVC = [[UserInfoVC alloc] initWithNibName:@"UserInfoVC" bundle:nil];
        userInfoVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:userInfoVC animated:YES];
    } else if (indexPath.row == 1) {    //我的报价
        MyOffersVC *myOfferVC = [[MyOffersVC alloc] initWithNibName:@"MyOffersVC" bundle:nil];
        myOfferVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:myOfferVC animated:YES];
    } else if (indexPath.row == 2) {    //我的关注
        MyAttentionsVC *myAttentionVC = [[MyAttentionsVC alloc] initWithNibName:@"MyAttentionsVC" bundle:nil];
        myAttentionVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:myAttentionVC animated:YES];
    } else if (indexPath.row == 3){     //我的偏好
        
    } else {                            //我的消息
        MyMessgaeVC *messageVC = [[MyMessgaeVC alloc] initWithNibName:@"MyMessgaeVC" bundle:nil];
        messageVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController  pushViewController:messageVC animated:YES];
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 12;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20;
}

@end
