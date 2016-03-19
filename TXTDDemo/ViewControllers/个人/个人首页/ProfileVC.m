//
//  ProfileVC.m
//  Dentist
//
//  Created by Ben on 16/1/10.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "ProfileVC.h"
#import "UserInfoVC.h"
#import "AddressListVC.h"
#import "MyFavoriteVC.h"
#import "LookHistoryVC.h"
#import "AllOrderListVC.h"
#import "AppDeinitializer.h"
#import "SettingVCViewController.h"
#import "UserDetailPageVC.h"

@interface ProfileVC ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailDecLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ProfileVC

#pragma mark - View life cycle

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"我的";
        self.tabBarItem.title = @"我的";
        self.tabBarItem.image = [UIImage imageNamed:@"btn_user_f"];
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"btn_user_t"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];

    [self refreshUI];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self clearNavLeftItem];
    [self setNavRightItemWithImage:@"设置" target:self action:@selector(onSettingBtn)];
    [self initUI];
    [self initTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (void)refreshUI {
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:[UserInfoModel sharedUserInfoModel].headPath] placeholderImage:[UIImage imageNamed:@"头像"]];
    self.nickLabel.text = [UserInfoModel sharedUserInfoModel].nickName;
}

- (void)initUI {
    self.headImageView.layer.cornerRadius = self.headImageView.width/2;
    self.headImageView.layer.masksToBounds = YES;
    self.headImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickOnHeadImageView:)];
    [self.headerView addGestureRecognizer:tap];
    [self refreshUI];
}

- (void)initTableView {
    self.tableView.tableHeaderView = self.headerView;
}

#pragma mark - IBOut Action

- (IBAction)onShouCangBtn:(UIButton *)sender {
    MyFavoriteVC* favoriteVC = [MyFavoriteVC new];
    favoriteVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:favoriteVC animated:YES];
}

- (IBAction)onScanHistoryBtn:(UIButton *)sender {
    LookHistoryVC* lookHistoryVC = [LookHistoryVC new];
    lookHistoryVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:lookHistoryVC animated:YES];
}

- (IBAction)onAddressBtn:(UIButton *)sender {
    AddressListVC *addressListVC = [[AddressListVC alloc] initWithNibName:@"AddressListVC" bundle:nil];
    addressListVC.isSelectAddress = NO;
    addressListVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:addressListVC animated:YES];
}

- (void)onSettingBtn {
    UserDetailPageVC *userDetailVC = [[UserDetailPageVC alloc] initWithNibName:@"UserDetailPageVC" bundle:nil];
    userDetailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:userDetailVC animated:YES];
}

- (void)didClickOnHeadImageView:(UITapGestureRecognizer *)tap {
    UserInfoVC *userInfoVC = [[UserInfoVC alloc] initWithNibName:@"UserInfoVC" bundle:nil];
    userInfoVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:userInfoVC animated:YES];
}

#pragma mark - Navigation Style

//- (UIColor*)preferNavBarBackgroundColor{
//    return [UIColor themeBlueColor];
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
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.textColor = [UIColor gray005Color];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    cell.detailTextLabel.textColor = [UIColor gray006Color];
    cell.imageView.image = [UIImage imageNamed:@"btn_cart_t"];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"我的信息";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"我的报价";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"我的关注";
    } else if (indexPath.row == 3){
        cell.textLabel.text = @"我的偏好";
    } else {
        cell.textLabel.text = @"我的消息";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        
    } else if (indexPath.row == 1) {
        
    } else if (indexPath.row == 2) {
        
    } else if (indexPath.row == 3){
        
    } else {
        
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 12;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

@end
