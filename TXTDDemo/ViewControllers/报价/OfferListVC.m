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

#pragma mark - Table

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OfferListCell* cell = [tableView dequeueReusableCellWithIdentifier:[OfferListCell identifier] forIndexPath:indexPath];

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    OfferProductDetailVC* vc = [OfferProductDetailVC new];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
