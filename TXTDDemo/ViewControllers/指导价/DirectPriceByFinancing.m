//
//  DirectPriceByFinancing.m
//  TXTDDemo
//
//  Created by 郭晓倩 on 16/3/20.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "DirectPriceByFinancing.h"
#import "DirectPriceByFiancingCell.h"

@interface DirectPriceByFinancing ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *menuButtonView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *zhidaojiaButton;
@property (strong, nonatomic) IBOutlet UIView *footerView;

@end

@implementation DirectPriceByFinancing

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.menuButtonView.backgroundColor = [g_commonConfig gray003Color];
    self.menuButtonView.layer.shadowOffset = CGSizeMake(2, 2);
    self.menuButtonView.layer.shadowOpacity = 0.2;
    self.menuButtonView.layer.shadowRadius = 1;
    self.menuButtonView.layer.shadowColor = [UIColor grayColor].CGColor;
    
    UIButton* menuButton = self.zhidaojiaButton;
    CGFloat imageWidth = menuButton.imageView.size.width;
    CGFloat titleWidth = [menuButton.titleLabel.text textSizeForOneLineWithFont:menuButton.titleLabel.font].width;
    [menuButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -imageWidth, 0, imageWidth)];
    [menuButton setImageEdgeInsets:UIEdgeInsetsMake(0, titleWidth, 0, -titleWidth)];
    
    [self.tableView registerNib:[DirectPriceByFiancingCell nib] forCellReuseIdentifier:[DirectPriceByFiancingCell identifier]];
    
    self.tableView.tableFooterView = self.footerView;
    
    self.view.backgroundColor = [g_commonConfig bgGray002Color];
    self.tableView.backgroundColor = [g_commonConfig bgGray002Color];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DirectPriceByFiancingCell *cell = [tableView dequeueReusableCellWithIdentifier:[DirectPriceByFiancingCell identifier] forIndexPath:indexPath];
    cell.priceLabel.text = [NSString stringWithFormat:@"+1.%zd",indexPath.row];
    cell.bankLabel.text = @"中国银行";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
