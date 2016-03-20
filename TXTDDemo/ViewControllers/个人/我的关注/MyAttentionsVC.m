//
//  MyAttentionsVC.m
//  TXTDDemo
//
//  Created by 王涛 on 16/3/19.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "MyAttentionsVC.h"
#import "AttentionCell.h"

@interface MyAttentionsVC ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UISegmentedControl *segementedControl;
@end

@implementation MyAttentionsVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的关注";
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
    [self.tableView registerNib:[AttentionCell nib] forCellReuseIdentifier:[AttentionCell identifier]];
    self.navigationItem.titleView = self.segementedControl;
    self.segementedControl.selectedSegmentIndex = 0;
    [self didSelectedOnSegment:self.segementedControl];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI Action

- (void)didSelectedOnSegment:(UISegmentedControl *)sender {
    NSInteger selectedIndex = sender.selectedSegmentIndex;
    if (selectedIndex == 0) {
        //切换我的关注
        
    } else if (selectedIndex == 1) {
        //切换智能推荐
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AttentionCell *cell = [tableView dequeueReusableCellWithIdentifier:[AttentionCell identifier] forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 170;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 1;
}

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - Setters and Getters

#pragma mark - Lazy Getter

-(UISegmentedControl*)segementedControl{
    if (_segementedControl == nil) {
        _segementedControl = [[UISegmentedControl alloc]initWithItems:@[@"我的关注", @"智能推荐"]];
        _segementedControl.size=CGSizeMake(self.view.width/2-50, 30);
        UIColor* selectedColor = [g_commonConfig themeLightBlueColor];
        
        //文字颜色
        [_segementedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateSelected];
        [_segementedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateHighlighted];
        [_segementedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:selectedColor,NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
        //背景颜色
        UIImage* selectedImage = [UIImage imageWithColor:selectedColor andSize:CGSizeMake(_segementedControl.width/2,_segementedControl.height)];
        UIImage* unselectedImage = [UIImage imageWithColor:[UIColor whiteColor] andSize:CGSizeMake(_segementedControl.width/2,_segementedControl.height)];
        [_segementedControl setBackgroundImage:selectedImage forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        [_segementedControl setBackgroundImage:selectedImage forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        [_segementedControl setBackgroundImage:unselectedImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        //分割线
        UIImage* dividerImage = [UIImage imageWithColor:selectedColor andSize:CGSizeMake(1, _segementedControl.height)];
        [_segementedControl setDividerImage:dividerImage forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        [_segementedControl setDividerImage:dividerImage forLeftSegmentState:UIControlStateSelected rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        //边角
        _segementedControl.layer.cornerRadius = 5.f;
        _segementedControl.layer.masksToBounds = YES;
        [_segementedControl setBorderColor:selectedColor];
        [_segementedControl setBorderWidth:1.f];
        //事件
        [_segementedControl addTarget:self action:@selector(didSelectedOnSegment:) forControlEvents:UIControlEventValueChanged];
    }
    return _segementedControl;
}


@end
