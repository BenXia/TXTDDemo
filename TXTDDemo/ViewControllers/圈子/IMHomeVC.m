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

#define MAKE_MODEL(message1,message2) [ChatModel modelWithMessage1:message1 Message2:message2]

@interface ChatModel : NSObject

@property (strong,nonatomic) NSString* userHeadName;
@property (strong,nonatomic) NSString* userName;
@property (strong,nonatomic) NSString* message1;
@property (strong,nonatomic) NSString* message2;


+(ChatModel*)modelWithMessage1:(NSString*)message1 Message2:(NSString*)message2;

@end

@implementation ChatModel

+(ChatModel*)modelWithMessage1:(NSString*)message1 Message2:(NSString*)message2{
    ChatModel* model = [ChatModel new];
    model.message1 = message1;
    model.message2 = message2;
    return model;
}

@end

@interface IMHomeVC ()<UITableViewDataSource,UITableViewDelegate>

@property (weak,nonatomic) IBOutlet UITableView* tableView;
@property (strong, nonatomic) IBOutlet UIView *menuView;

@property (assign,nonatomic) int cellCount;

@property (strong,nonatomic) NSMutableArray* chatArray;


@end

@implementation IMHomeVC

#pragma mark - View life cycle

- (instancetype)init {
    if (self = [super init]) {
        self.title = @"我的圈子";
        self.tabBarItem.title = @"圈子";
        self.tabBarItem.image = [[UIImage imageNamed:@"tabbtn_quanzi"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbtn_quanzi_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.cellCount = 10;
        
        
        
        self.chatArray = [NSMutableArray arrayWithArray:@[
                                                          MAKE_MODEL(@"你们行的理财产品发行规模是？", @"本期１００亿。"),
                                                          MAKE_MODEL(@"看到你准备收５个亿的资金，可以具体介绍下吗？", @"可以的，电话沟通吧？"),
                                                          MAKE_MODEL(@"债券不行啊", @"为什么不行，你们不收债券？"),
                                                          MAKE_MODEL(@"我们对信托的要求高", @"本期信托的资产不错的？"),
                                                          MAKE_MODEL(@"我们有不良资产１０个亿，２个亿出售", @"暂时没有资金，不收"),
                                                          MAKE_MODEL(@"最近业务开展如何", @"业务指标太大，压力杠杠的"),
                                                          MAKE_MODEL(@"上次的资金到账没啊", @"到账了"),
                                                          MAKE_MODEL(@"在吗？上次的业务没ｏｋ啊？", @"是的，领导不批"),
                                                          MAKE_MODEL(@"窘，大额系统关闭了", @"好啊，只能明天了"),
                                                          ]];
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
        self.menuView.y = self.menuView.y < 0 ? 0 : -self.menuView.height;
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
    return self.cellCount;
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
    self.cellCount --;
    [tableView reloadData];
}

@end
