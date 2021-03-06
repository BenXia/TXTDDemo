//
//  UserDetailPageVC.m
//  Dentist
//
//  Created by 王涛 on 16/3/19.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "UserDetailPageVC.h"

@interface UserDetailPageVC ()
@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (strong, nonatomic) IBOutlet UIView *footView;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailDecLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *helloBtn;
@property (weak, nonatomic) IBOutlet UIButton *addFriendBtn;
@end

@implementation UserDetailPageVC
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

- (void)initUI {
    self.headImageView.layer.cornerRadius = self.headImageView.width/2;
    self.headImageView.layer.masksToBounds = YES;
    self.headImageView.userInteractionEnabled = YES;
    [self setNavRightItemWithImage:@"geranxinxi" target:self action:@selector(didClickOnUserInfo)];
    if (self.isFromProfile) {
        self.helloBtn.hidden = YES;
        self.addFriendBtn.hidden = YES;
    }
}

- (void)initTableView {
    self.tableView.tableHeaderView = self.headerView;
    self.tableView.tableFooterView = self.footView;
}

- (void)onSettingBtn {
//    SettingVCViewController *settingVC = [[SettingVCViewController alloc] initWithNibName:@"SettingVCViewController" bundle:nil];
//    settingVC.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:settingVC animated:YES];
}

#pragma mark - UIAction

- (void)didClickOnUserInfo {
    NSLog(@"个人信息");
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
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.textColor = [g_commonConfig gray005Color];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    cell.detailTextLabel.textColor = [g_commonConfig gray006Color];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0) {
        cell.textLabel.text = @"用户名";
        cell.detailTextLabel.text = @"李信陵";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"真实姓名";
        cell.detailTextLabel.text = @"李晨";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"公司名称";
        cell.detailTextLabel.text = @"中国建设银行股份有限公司";
    } else {
        cell.textLabel.text = @"职位";
        cell.detailTextLabel.text = @"业务经理";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
