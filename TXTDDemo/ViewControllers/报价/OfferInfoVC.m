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
#import "DirectPriceVC.h"

@interface OfferInfoVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSArray* dataSource;
@property (strong, nonatomic) IBOutlet UIView *searchBarView;
@property (weak, nonatomic) IBOutlet UITextField *searchBar;
@property (weak, nonatomic) IBOutlet UIButton *searchConfirmButton;

@end

@implementation OfferInfoVC

-(instancetype)init{
    if (self = [super init]) {
        self.title = @"报价信息";
        self.tabBarItem.title = @"报价";
        self.tabBarItem.image = [[UIImage imageNamed:@"tabbtn_baojia"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbtn_baojia_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
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
    
    self.view.backgroundColor = [g_commonConfig bgGray002Color];
    self.tableView.backgroundColor = [g_commonConfig bgGray002Color];
    
    [self setNavRightItemWithImage:@"sousuo" target:self action:@selector(didClickSearchItem)];
    [self setNavLeftItemWithImage:@"zhidaojia" target:self action:@selector(didClickZhiDaoItem)];
    
    [self.searchBar circular:3];
    [self.searchConfirmButton circular:3];
    self.searchBarView.backgroundColor = [g_commonConfig themeBlueColor];
    
    self.searchBarView.frame = CGRectMake(0, -self.searchBarView.height, kScreenWidth, self.searchBarView.height);
    [self.view addSubview:self.searchBarView];
    
    UINib* cellNib = [UINib nibWithNibName:[OfferInfoCell identifier] bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:[OfferInfoCell identifier]];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.searchBarView.y = -self.searchBarView.height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIColor*)preferNavBarBackgroundColor{
    return [g_commonConfig themeBlueColor];
}

#pragma mark - Action

-(void)didClickSearchItem{
    [UIView animateWithDuration:0.3 animations:^{
        self.searchBarView.y = self.searchBarView.y < 0 ? 0:-self.searchBarView.height;
    }];
}

-(IBAction)didClickConfirmSearch:(id)sender{
    [self.searchBar resignFirstResponder];
    [UIView animateWithDuration:0.3 animations:^{
        self.searchBarView.y = -self.searchBarView.height;
    }];
}

-(void)didClickZhiDaoItem{
    DirectPriceVC* vc = [DirectPriceVC new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
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
    if([title isEqualToString:@"资金产品"]){
        cell.headImageView.image = [UIImage imageNamed:@"zijinchanpin"];
        cell.productDetailLabel.text = @"融出：23  融入：24";
    }else if([title isEqualToString:@"存款产品"]){
        cell.headImageView.image = [UIImage imageNamed:@"chuxuchanpin"];
        cell.productDetailLabel.text = @"融出：11  融入：22";
    }else if([title isEqualToString:@"票据产品"]){
        cell.headImageView.image = [UIImage imageNamed:@"piaojuchanpin"];
        cell.productDetailLabel.text = @"融出：34  融入：56";
    }else if([title isEqualToString:@"债券产品"]){
        cell.headImageView.image = [UIImage imageNamed:@"zhaiquanchanpin"];
        cell.productDetailLabel.text = @"融出：87  融入：90  发行：23";
    }else if([title isEqualToString:@"非标产品"]){
        cell.headImageView.image = [UIImage imageNamed:@"feibiaochanpin"];
        cell.productDetailLabel.text = @"融出：43  融入：31";
    }else if([title isEqualToString:@"理财产品"]){
        cell.headImageView.image = [UIImage imageNamed:@"licaichanpin"];
        cell.productDetailLabel.text = @"融出：67  融入：12";
    }else if([title isEqualToString:@"其他业务"]){
        cell.headImageView.image = [UIImage imageNamed:@"qitachanpin"];
        cell.productDetailLabel.text = @"融出：78  融入：65";
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 73;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    OfferListVC* vc = [OfferListVC new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
