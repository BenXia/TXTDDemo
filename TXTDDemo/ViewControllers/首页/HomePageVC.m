//
//  HomePageVC.m
//  StudioCommon
//
//  Created by Ben on 2/2/16.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "HomePageVC.h"
#import "HomePageCell.h"

@interface HomePageVC ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UIView *headImageBackGroundView;
@property (weak, nonatomic) IBOutlet UILabel *outCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *inCountLabel;
@end

@implementation HomePageVC

#pragma mark - View life cycle

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"首页";
        self.tabBarItem.title = @"首页";
        self.tabBarItem.image = [[UIImage imageNamed:@"tabbtn_shouye"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbtn_shouye_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [self initUIReleated];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES  animated:animated];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //根页面禁止右滑返回
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation Style

- (UIColor*)preferNavBarHighlightedTitleColor {
    return kWhiteHighlightedColor;
}

#pragma mark - Private methods

- (void)initUIReleated {
    //self.tableView.tableHeaderView = self.headerView;
    NSMutableAttributedString *countAttributedString = [[NSMutableAttributedString alloc] initWithString:@"200" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:25]}];
    [countAttributedString appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",@"笔"] attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}]];
    self.outCountLabel.attributedText = countAttributedString;
    self.inCountLabel.attributedText = countAttributedString;
    self.headerView.backgroundColor = [g_commonConfig themeBlueColor];
    self.headImageView.layer.cornerRadius = self.headImageView.width/2;
    self.headImageView.layer.masksToBounds = YES;
    self.headImageView.userInteractionEnabled = YES;
    self.headImageBackGroundView.layer.cornerRadius = self.headImageBackGroundView.width/2;
    self.headImageBackGroundView.layer.masksToBounds = YES;
    self.headImageBackGroundView.userInteractionEnabled = YES;
    self.headerView.backgroundColor = [g_commonConfig themeBlueColor];
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
    [self.tableView registerNib:[HomePageCell nib] forCellReuseIdentifier:[HomePageCell identifier]];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomePageCell *cell = [tableView dequeueReusableCellWithIdentifier:[HomePageCell identifier] forIndexPath:indexPath];
    cell.leftLabel.textColor = [g_commonConfig gray006Color];
    cell.middleLabel.textColor = [g_commonConfig gray006Color];
    cell.rightLabel.textColor = [g_commonConfig gray006Color];
    if (indexPath.row == 0) {
        cell.leftLabel.text = @"隔夜";
        cell.middleLabel.text = @"----";
        cell.rightLabel.text = @"+1.07";
        cell.rightLabel.textColor = [g_commonConfig themeRedColor];
        cell.backgroundColor = [UIColor whiteColor];
    } else if (indexPath.row == 1) {
        cell.leftLabel.text = @"7天";
        cell.middleLabel.text = @"2.29500";
        cell.rightLabel.text = @"-0.25";
        cell.rightLabel.textColor = [g_commonConfig themeGreenColor];
        cell.backgroundColor = [UIColor whiteColor];
    } else if (indexPath.row == 2) {
        cell.leftLabel.text = @"14天";
        cell.middleLabel.text = @"2.49000";
        cell.rightLabel.text = @"+3.07";
        cell.rightLabel.textColor = [g_commonConfig themeRedColor];
        cell.backgroundColor = [UIColor whiteColor];
    } else {
        cell.leftLabel.text = @"一个月";
        cell.middleLabel.text = @"2.75900";
        cell.rightLabel.text = @"+4.05";
        cell.rightLabel.textColor = [g_commonConfig themeRedColor];
        cell.backgroundColor = [UIColor whiteColor];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

@end