//
//  SettingVCViewController.m
//  Dentist
//
//  Created by 王涛 on 16/2/22.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "SettingVCViewController.h"
#import "AppDeinitializer.h"
#import "AboutUsVC.h"

@interface SettingVCViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *quitBtn;
@property (nonatomic, strong) NSArray *dataArray;
@property (strong, nonatomic) IBOutlet UIViewController *shareVC;
@property (weak, nonatomic) IBOutlet UIButton *weixinPyqBtn;
@property (weak, nonatomic) IBOutlet UIButton *sinaBtn;
@property (weak, nonatomic) IBOutlet UIButton *weixinBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancleBtn;
@property (weak, nonatomic) IBOutlet UIButton *doneBtn;

@end

@implementation SettingVCViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Method

- (void)initUI {
    self.title = @"设置";
    [self setNavTitleString:@"设置"];
    
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
    [self.quitBtn liningThematized:[g_commonConfig themeBlueColor]];
    self.quitBtn.layer.cornerRadius = 20;
    [self.weixinPyqBtn centerImageAndTitle];
    [self.sinaBtn centerImageAndTitle];
    [self.weixinBtn centerImageAndTitle];
    self.shareVC.view.frame = CGRectMake(0, 0, kScreenWidth - 24, 210);
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    } else {
        return 4;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = [g_commonConfig gray006Color];
        cell.detailTextLabel.textColor = [g_commonConfig gray006Color];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:15];
    }
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0: {
                cell.textLabel.text = @"修改登录密码";
            }
                break;
            case 1: {
                cell.accessoryType = UITableViewCellAccessoryNone;
                cell.textLabel.text = @"开启手势密码";
                UISwitch *switchBtn = [[UISwitch alloc] initWithFrame:CGRectMake(kScreenWidth - 62, 0, 50, 40)];
                switchBtn.centerY = cell.contentView.centerY;
                [cell.contentView addSubview:switchBtn];
            }
                break;
                
            default:
                break;
        }
    } else {
        switch (indexPath.row) {
            case 0: {
                cell.textLabel.text = @"意见反馈";
            }
                break;
            case 1: {
                cell.textLabel.text = @"清除缓存";
                cell.detailTextLabel.text = @"30KB";
            }
                break;
            case 2: {
                cell.textLabel.text = @"APP版本";
                cell.detailTextLabel.text = @"版本号3.1.1";
            }
                break;
            case 3: {
                cell.textLabel.text = @"联系客服";
                cell.detailTextLabel.text = @"400-800-1212";
            }
                break;
                
            default:
                break;
        }

    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 12;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    

}

#pragma mark - UIAction

- (IBAction)onQuitBtn:(UIButton *)sender {
    [[AppDeinitializer sharedInstance] cleanUpWhenLogout];
    [[MainViewManager sharedInstance] loadLoginVC];
}

- (IBAction)onShareToPengyouquan:(UIButton *)sender {
    
}

- (IBAction)onShareToSina:(UIButton *)sender {
    
}

- (IBAction)onShareToWeixin:(UIButton *)sender {
    
}

- (IBAction)onShareCancle:(UIButton *)sender {
    [Utilities dismissPopup];
}

- (IBAction)onShareDone:(UIButton *)sender {
    [Utilities dismissPopup];
}

@end
