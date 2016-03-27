//
//  ChatVC.m
//  TXTDDemo
//
//  Created by 郭晓倩 on 16/3/19.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "ChatVC.h"
#import "ChatSenderCell.h"
#import "ChatReceiverCell.h"
#import "UserDetailPageVC.h"


@interface ChatVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *sendTextField;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak,nonatomic) IBOutlet UITableView* tableView;

@end

@implementation ChatVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"李新林";
    self.view.backgroundColor = [g_commonConfig bgGray002Color];
    
    [self setNavRightItemWithImage:@"geranxinxi" target:self action:@selector(didClickGerenxinxi)];
    
    [self.sendTextField circular:3];
    [self.sendButton circular:3];
    [self.sendButton setBackgroundImage:[UIImage imageWithColor:[g_commonConfig themeDarkBlueColor]] forState:UIControlStateHighlighted];
    
    UINib* senderNib = [UINib nibWithNibName:[ChatSenderCell identifier] bundle:nil];
    UINib* receiverNib = [UINib nibWithNibName:[ChatReceiverCell identifier] bundle:nil];
    [self.tableView registerNib:senderNib forCellReuseIdentifier:[ChatSenderCell identifier]];
    [self.tableView registerNib:receiverNib forCellReuseIdentifier:[ChatReceiverCell identifier]];
    
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
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row%2 == 0) {
        ChatReceiverCell* cell = [tableView dequeueReusableCellWithIdentifier:[ChatReceiverCell identifier] forIndexPath:indexPath];
        
        return cell;
    }else{
        ChatSenderCell* cell = [tableView dequeueReusableCellWithIdentifier:[ChatSenderCell identifier] forIndexPath:indexPath];
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 64;
}

-(void)didClickGerenxinxi{
    UserDetailPageVC* vc = [UserDetailPageVC new];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
