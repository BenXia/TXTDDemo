//
//  OfferListVC.m
//  Dentist
//
//  Created by 郭晓倩 on 16/3/19.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "OfferListVC.h"
#import "OfferListCell.h"
#import "OfferProductDetailVC.h"
#import "OfferFilterVC.h"

@interface OfferFilterVC ()

@end

@implementation OffeListModel



@end


@interface OfferListVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *menuButtonView;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *menuButtonArray;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSMutableArray* dataSource;

@end

@implementation OfferListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"报价列表";
    
    self.view.backgroundColor = [g_commonConfig bgGray002Color];
    self.tableView.backgroundColor = [g_commonConfig bgGray002Color];
    
    //菜单按钮栏
    self.menuButtonView.layer.shadowOffset = CGSizeMake(2, 2);
    self.menuButtonView.layer.shadowOpacity = 0.2;
    self.menuButtonView.layer.shadowRadius = 1;
    self.menuButtonView.layer.shadowColor = [UIColor grayColor].CGColor;
    
    for (UIButton* menuButton in self.menuButtonArray) {
        CGFloat imageWidth = menuButton.imageView.size.width;
        CGFloat titleWidth = [menuButton.titleLabel.text textSizeForOneLineWithFont:menuButton.titleLabel.font].width;
        [menuButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -imageWidth, 0, imageWidth)];
        [menuButton setImageEdgeInsets:UIEdgeInsetsMake(0, titleWidth, 0, -titleWidth)];
    }
    
    UINib* cellNib = [UINib nibWithNibName:[OfferListCell identifier] bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:[OfferListCell identifier]];
    [self initDataSource];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initDataSource {
    for (int i = 0; i<5; i++) {
        OffeListModel *model = [[OffeListModel alloc] init];
        if (i==0) {
            model.headImageName = @"headImage_2.jpg";
            model.nick = @"张三";
            model.backName = @"中国农业银行";
            model.price = @"20000";
            model.date = @"90";
            model.rate = @"1.3";
        } else if (i == 1) {
            model.headImageName = @"headImage_3.jpg";
            model.nick = @"李四";
            model.backName = @"中国建设银行";
            
            model.price = @"10000";
            model.date = @"50";
            model.rate = @"1.1";
        } else if (i == 2) {
            model.headImageName = @"headImage_4.jpg";
            model.nick = @"王二";
            model.backName = @"中国农业银行";
            
            model.price = @"30000";
            model.date = @"100";
            model.rate = @"1.5";
        } else if (i == 3) {
            model.headImageName = @"headImage_5.jpg";
            model.nick = @"郭靖";
            model.backName = @"中国开发银行";
            
            model.price = @"3200";
            model.date = @"10";
            model.rate = @"1.7";
        } else if (i == 4) {
            model.headImageName = @"headImage_6.jpg";
            model.nick = @"黄瑞";
            model.backName = @"华夏银行";
            
            model.price = @"5000";
            model.date = @"90";
            model.rate = @"1.3";
        }
        [self.dataSource addObject:model];
    }
}

#pragma mark - Action

-(IBAction)didClickMoreFilter:(id)sender{
    OfferFilterVC* vc = [OfferFilterVC new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)didClickOnExactBtn:(UIButton *)sender {
    [self sortedArray];
    [self.tableView reloadData];
    
}
- (IBAction)didClickOnQixianBtn:(UIButton *)sender {
    [self sortedArray];
    [self.tableView reloadData];
}
- (IBAction)didClickOnLilvBtn:(UIButton *)sender {
    [self sortedArray];
    [self.tableView reloadData];
}

#pragma mark - Private Method

- (void)sortedArray {
    OffeListModel *model = [self.dataSource firstObject];
    [self.dataSource removeObjectAtIndex:0];
    [self.dataSource addObject:model];
}

#pragma mark - Table

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OffeListModel *model = self.dataSource[indexPath.row];
    OfferListCell* cell = [tableView dequeueReusableCellWithIdentifier:[OfferListCell identifier] forIndexPath:indexPath];
    cell.headImageView.image = [UIImage imageNamed:model.headImageName];
    cell.nameLabel.text = model.nick;
    cell.bankLabel.text = model.backName;
    cell.priceLabel.text = model.price;
    cell.dateLabel.text = model.date;
    cell.rateLabel.text = model.rate;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 206;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    OfferProductDetailVC* vc = [OfferProductDetailVC new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}


@end
