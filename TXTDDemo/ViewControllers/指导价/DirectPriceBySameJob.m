//
//  DirectPriceBySameJob.m
//  TXTDDemo
//
//  Created by 郭晓倩 on 16/3/20.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "DirectPriceBySameJob.h"
#import "DirectPriceBySameJobCell.h"

@interface DirectPriceBySameJob ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *menuButtonView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *footerView;


@end

@implementation DirectPriceBySameJob

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.menuButtonView.backgroundColor = [g_commonConfig gray003Color];
        self.menuButtonView.layer.shadowOffset = CGSizeMake(2, 2);
    self.menuButtonView.layer.shadowOpacity = 0.2;
    self.menuButtonView.layer.shadowRadius = 1;
    self.menuButtonView.layer.shadowColor = [UIColor grayColor].CGColor;
    
    [self.tableView registerNib:[DirectPriceBySameJobCell nib] forCellReuseIdentifier:[DirectPriceBySameJobCell identifier]];
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
    DirectPriceBySameJobCell *cell = [tableView dequeueReusableCellWithIdentifier:[DirectPriceBySameJobCell identifier] forIndexPath:indexPath];
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

@end
