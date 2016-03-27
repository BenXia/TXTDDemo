//
//  UserInfoVC.m
//  Dentist
//
//  Created by 王涛 on 16/2/17.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import<AssetsLibrary/ALAssetsLibrary.h>
#import "UserInfoVC.h"
#import "UIImageView+WebCache.h"
#import "UserDetailPageVC.h"

@interface UserInfoVC () <UITableViewDataSource,
UITableViewDelegate,
UIActionSheetDelegate,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *modelArray;
@property (strong, nonatomic) UIImageView *headImageView;
@property (strong, nonatomic) UIImage *uploadImage;
@property (strong, nonatomic) IBOutlet UIView *footView;
@property (weak, nonatomic) IBOutlet UIButton *changUserInfoBtn;

@end

@implementation UserInfoVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人信息";
    self.tableView.tableFooterView = self.footView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 5;
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
        cell.textLabel.textColor = [g_commonConfig gray006Color];
        cell.detailTextLabel.textColor = [g_commonConfig gray006Color];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:15];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"用户名";
            cell.detailTextLabel.text = @"李信陵";
        } else if (indexPath.row == 1) {
            cell.textLabel.text = @"真实姓名";
            cell.detailTextLabel.text = @"李晨";
        } else if (indexPath.row == 2) {
            cell.textLabel.text = @"手机号码";
            cell.detailTextLabel.text = @"15222222222";
        } else if (indexPath.row == 3) {
            cell.textLabel.text = @"个人邮箱";
            cell.detailTextLabel.text = @"未绑定";
        } else {
            cell.textLabel.text = @"个人QQ";
            cell.detailTextLabel.text = @"未绑定";
        }
    } else {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"公司名称";
            cell.detailTextLabel.text = @"上海建设银行股份有限公司";
        } else if (indexPath.row == 1) {
            cell.textLabel.text = @"职位";
            cell.detailTextLabel.text = @"业务经理";
        } else if (indexPath.row == 2) {
            cell.textLabel.text = @"公司电话";
            cell.detailTextLabel.text = @"0551-37373777";
        } else if (indexPath.row == 3) {
            cell.textLabel.text = @"公司邮箱";
            cell.detailTextLabel.text = @"timo@ccb.com";
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 12;
}

#pragma mark - Private method

- (void)changeUserHead {
    UIActionSheet *userSheet=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从相册选择", nil ];
    [userSheet showInView:self.view];
}

#pragma mark ----------ActionSheet 按钮点击-------------

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0: {
            // 照一张
            NSString *mediaType = AVMediaTypeVideo;
            AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
            if (authStatus == AVAuthorizationStatusNotDetermined) {
                [AVCaptureDevice requestAccessForMediaType:mediaType completionHandler:^(BOOL granted) {}];
                return;
            } else if(authStatus != AVAuthorizationStatusAuthorized) {
                [UIUtils showAlertView:nil :@"请在iPhone的“设置－隐私－相机”选项中，允许轻轻访问您的手机相机。" :@"我知道了"];
                return;
            }
            
            UIImagePickerController *imgPicker=[[UIImagePickerController alloc]init];
            [imgPicker setSourceType:UIImagePickerControllerSourceTypeCamera];
            [imgPicker setDelegate:self];
            [imgPicker setAllowsEditing:YES];
            [self.navigationController presentViewController:imgPicker animated:YES completion:nil];
        }
            break;
            
        case 1: {
            // 相册搞一张
            ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
            if (author != ALAuthorizationStatusAuthorized && author != ALAuthorizationStatusNotDetermined) {
                // 用户不允许应用访问相册
                [UIUtils showAlertView:nil :@"请在iPhone的“设置－隐私－照片”选项中，允许轻轻访问您的手机相册。" :@"我知道了"];
                return;
            }
            
            UIImagePickerController *imgPicker=[[UIImagePickerController alloc] init];
            [imgPicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            [imgPicker setDelegate:self];
            [imgPicker setAllowsEditing:YES];
            [self.navigationController presentViewController:imgPicker animated:YES completion:nil];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage* image =[info objectForKey:UIImagePickerControllerEditedImage];
    self.uploadImage = image;
    // 回到当前页面
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        //上传头像接口
        [[[PictureUploader alloc] init] uploadPicture:image
                                      imageUploadType:kImageUploadType_HeadimgUploadType
                                              success:^(id obj) {
            [[GCDQueue mainQueue] queueBlock:^{
                //更新缓存
                [Utilities showToastWithText:@"头像上传成功"];
                [UserInfoModel sharedUserInfoModel].headPath = obj;
                [self.headImageView sd_setImageWithURL:[NSURL URLWithString:obj] placeholderImage:[UIImage imageNamed:@"user_pic_boy"]];
            }];
        } fail:^(NSError *error) {
            [[GCDQueue mainQueue] queueBlock:^{
                [Utilities showToastWithText:@"头像上传失败"];
            }];
            
        } progress:^(CGFloat afloat) {
            
        }];
    }];
}

#pragma mark - public method

- (IBAction)changUserInfo:(UIButton *)sender {
    if (self.changUserInfoBtn.selected) {
        [self.changUserInfoBtn setTitle:@"确认修改" forState:UIControlStateNormal];
    } else {
        [self.changUserInfoBtn setTitle:@"修改个人资料" forState:UIControlStateNormal];
    }
}

- (IBAction)scanUserInfoDetail:(id)sender {
    UserDetailPageVC *userDetailPageVC = [[UserDetailPageVC alloc] initWithNibName:@"UserDetailPageVC" bundle:nil];
    userDetailPageVC.isFromProfile = YES;
    [self.navigationController pushViewController:userDetailPageVC animated:YES];
}


#pragma mark - setters and getters

- (UIImageView *)headImageView {
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth - 24 - 60 - 30, 12, 60, 60)];
        _headImageView.layer.cornerRadius = 30;
        _headImageView.layer.masksToBounds = YES;
    }
    return _headImageView;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
