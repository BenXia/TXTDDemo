//
//  OfferDetailVC.m
//  TXTDDemo
//
//  Created by 王涛 on 16/3/20.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "OfferDetailVC.h"
#import "HomePageCell.h"

@interface OfferDetailVC () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *segmentBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *titleBackgroundView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation OfferDetailVC

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
    
}

#pragma mark - Private method

- (void)initUI {
    self.title = self.timeString;
    self.segmentBackgroundView.backgroundColor = [g_commonConfig themeBlueColor];
    self.segmentedControl.backgroundColor = [g_commonConfig themeBlueColor];
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.1)];
    [self.tableView registerNib:[HomePageCell nib] forCellReuseIdentifier:[HomePageCell identifier]];
    [self setNavRightItemWithImage:@"faqiqunliao" target:self action:@selector(didClickOnRightBarBtn)];
}

- (void)didClickOnRightBarBtn {
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomePageCell *cell = [tableView dequeueReusableCellWithIdentifier:[HomePageCell identifier] forIndexPath:indexPath];
    cell.leftLabel.textColor = [g_commonConfig gray006Color];
    cell.middleLabel.textColor = [g_commonConfig gray006Color];
    cell.rightLabel.textColor = [g_commonConfig gray006Color];
    cell.leftLabel.text = @"农业银行 总行";
    cell.middleLabel.text = @"1.8";
    cell.rightLabel.text = @"13889775566";
    cell.leftLabel.font = [UIFont systemFontOfSize:14];
    cell.middleLabel.font = [UIFont systemFontOfSize:14];
    cell.rightLabel.font = [UIFont systemFontOfSize:14];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
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
