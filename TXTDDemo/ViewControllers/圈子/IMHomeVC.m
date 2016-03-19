//
//  IMHomeVC.m
//  TXTDDemo
//
//  Created by Ben on 16/3/19.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "IMHomeVC.h"
#import "ConversationListCell.h"
#import "ChatVC.h"

@interface IMHomeVC ()<UITableViewDataSource,UITableViewDelegate>

@property (weak,nonatomic) IBOutlet UITableView* tableView;
@property (strong, nonatomic) IBOutlet UIView *menuView;

@end

@implementation IMHomeVC

#pragma mark - View life cycle

- (instancetype)init {
    if (self = [super init]) {
        self.title = @"我的圈子";
        self.tabBarItem.title = @"圈子";
        self.tabBarItem.image = [[UIImage imageNamed:@"tabbtn_quanzi"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbtn_quanzi_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self addNavRightItemWithImage:@"tianjia" position:UINavigationItemPositionLeft target:self action:@selector(didClickAddItem)];
    [self addNavRightItemWithImage:@"tongxunlu" position:UINavigationItemPositionLeft target:self action:@selector(didClickContactItem)];
    
    self.menuView.frame = CGRectMake(kScreenWidth-100, -80, 100, 80);
    [self.view addSubview:self.menuView];
    
    UINib* cellNib = [UINib nibWithNibName:[ConversationListCell identifier] bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:[ConversationListCell identifier]];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.menuView.y = -self.menuView.height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action

-(void)didClickAddItem{
    [UIView animateWithDuration:0.3 animations:^{
        self.menuView.y = 0;
    }];
}

-(void)didClickContactItem{

}
- (IBAction)didClickAddFriend:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        self.menuView.y = -self.menuView.height;
    } completion:^(BOOL finished) {
        
    }];
}
- (IBAction)didClickStartGroupChat:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        self.menuView.y = -self.menuView.height;
    } completion:^(BOOL finished) {
        
    }];
}


#pragma mark - Table

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ConversationListCell* cell = [tableView dequeueReusableCellWithIdentifier:[ConversationListCell identifier] forIndexPath:indexPath];
   
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 72;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ChatVC* vc = [ChatVC new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{

}

@end
