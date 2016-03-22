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

@interface OfferListVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *menuButtonView;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *menuButtonArray;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSArray* dataSource;

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action

-(IBAction)didClickMoreFilter:(id)sender{
    OfferFilterVC* vc = [OfferFilterVC new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Table

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OfferListCell* cell = [tableView dequeueReusableCellWithIdentifier:[OfferListCell identifier] forIndexPath:indexPath];
    if (indexPath.row%2==0) {
        cell.headImageView.image = [UIImage imageNamed:@"user_boy"];
        cell.nameLabel.text = @"李新林";
    }else{
        cell.headImageView.image = [UIImage imageNamed:@"user_girl"];
        cell.nameLabel.text = @"王大鹏";
    }
    
    switch (indexPath.row) {
        case 0:{
            cell.priceLabel.text = @"20000";
            cell.dateLabel.text = @"90";
            cell.rateLabel.text = @"1.3";
        }
            break;
        case 1:{
            cell.priceLabel.text = @"10000";
            cell.dateLabel.text = @"50";
            cell.rateLabel.text = @"1.1";
        }
            break;
        case 2:{
            cell.priceLabel.text = @"30000";
            cell.dateLabel.text = @"100";
            cell.rateLabel.text = @"1.5";
        }
            break;
        case 3:{
            cell.priceLabel.text = @"3200";
            cell.dateLabel.text = @"10";
            cell.rateLabel.text = @"1.7";
        }
            break;
        case 4:{
            cell.priceLabel.text = @"11000";
            cell.dateLabel.text = @"20";
            cell.rateLabel.text = @"1.8";
        }
            break;
        default:
            break;
    }

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 206;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    OfferProductDetailVC* vc = [OfferProductDetailVC new];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
