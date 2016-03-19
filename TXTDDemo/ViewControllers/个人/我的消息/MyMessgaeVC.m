//
//  MyMessgaeVC.m
//  TXTDDemo
//
//  Created by 王涛 on 16/3/19.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "MyMessgaeVC.h"
#import "MessageCell.h"

@interface MyMessgaeVC ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MyMessgaeVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Private Method

- (void)initTableView {
    [self.tableView registerNib:[MessageCell nib] forCellReuseIdentifier:[MessageCell identifier]];
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:[MessageCell identifier] forIndexPath:indexPath];
    return cell;
}



@end
