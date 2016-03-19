//
//  OfferInfoVC.m
//  Dentist
//
//  Created by 郭晓倩 on 16/3/19.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "OfferInfoVC.h"
#import "OfferInfoCell.h"
#import "OfferListVC.h"

@interface OfferInfoVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSArray* dataSource;
@property (strong, nonatomic) IBOutlet UIView *searchBarView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIButton *searchConfirmButton;

@end

@implementation OfferInfoVC

-(instancetype)init{
    if (self = [super init]) {
        self.title = @"报价信息";
        self.tabBarItem.title = @"报价";
        self.tabBarItem.image = [UIImage imageNamed:@"btn_user_f"];
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"btn_user_t"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.dataSource = @[@"资金产品",
                        @"存款产品",
                        @"票据产品",
                        @"债券产品",
                        @"非标产品",
                        @"理财产品",
                        @"其他业务",
                        ];
    
    self.view.backgroundColor = [UIColor bgGray002Color];
    self.tableView.backgroundColor = [UIColor bgGray002Color];
    
    [self setNavRightItemWithImage:@"sousou" target:self action:@selector(didClickSearchItem)];
    [self setNavLeftItemWithImage:@"zhidaojia" target:self action:@selector(didClickZhiDaoItem)];
    
    [self.searchBarView circular:3];
    [self.searchConfirmButton circular:3];
    
    self.searchBarView.frame = CGRectMake(0, -self.searchBarView.height, kScreenWidth, self.searchBarView.height);
    [self.view addSubview:self.searchBarView];
    
    UINib* cellNib = [UINib nibWithNibName:[OfferInfoCell identifier] bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:[OfferInfoCell identifier]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIColor*)preferNavBarBackgroundColor{
    return [UIColor themeBlueColor];
}

#pragma mark - Action

-(void)didClickSearchItem{
    [UIView animateWithDuration:0.5 animations:^{
        self.searchBarView.y = 0;
    }];
}

-(IBAction)didClickConfirmSearch:(id)sender{
    [self.searchBar resignFirstResponder];
    [UIView animateWithDuration:0.5 animations:^{
        self.searchBarView.y = -self.searchBarView.height;
    }];
}

-(void)didClickZhiDaoItem{

}

#pragma mark - Table

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OfferInfoCell* cell = [tableView dequeueReusableCellWithIdentifier:[OfferInfoCell identifier] forIndexPath:indexPath];
    NSString* title = [self.dataSource objectAtIndex:indexPath.row];
    cell.productTitleLabel.text = title;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 78;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    OfferListVC* vc = [OfferListVC new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
