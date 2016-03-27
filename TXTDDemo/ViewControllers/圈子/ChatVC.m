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
#import "MessageModel.h"
#import "IQKeyboardManager.H"

@implementation ChatModel

+(ChatModel*)modelWithName:(NSString*)name Message1:(NSString*)message1 Message2:(NSString*)message2{
    ChatModel* model = [ChatModel new];
    model.userName = name;
    model.message1 = message1;
    model.message2 = message2;
    return model;
}

@end


@interface ChatVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *sendTextField;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak,nonatomic) IBOutlet UITableView* tableView;

@property (strong,nonatomic) NSMutableArray* messageArray;

@end

@implementation ChatVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = self.chatModel.userName;
    self.view.backgroundColor = [g_commonConfig bgGray002Color];
    
    [self setNavRightItemWithImage:@"geranxinxi" target:self action:@selector(didClickGerenxinxi)];
    
    [self.sendTextField circular:3];
    [self.sendButton circular:3];
    [self.sendButton setBackgroundImage:[UIImage imageWithColor:[g_commonConfig themeDarkBlueColor]] forState:UIControlStateHighlighted];
    
    UINib* senderNib = [UINib nibWithNibName:[ChatSenderCell identifier] bundle:nil];
    UINib* receiverNib = [UINib nibWithNibName:[ChatReceiverCell identifier] bundle:nil];
    [self.tableView registerNib:senderNib forCellReuseIdentifier:[ChatSenderCell identifier]];
    [self.tableView registerNib:receiverNib forCellReuseIdentifier:[ChatReceiverCell identifier]];
    
    MessageModel* model1 = [MessageModel new];
    model1.type = Chatter_Other;
    model1.message = self.chatModel.message1;
    
    MessageModel* model2 = [MessageModel new];
    model2.type = Chatter_Me;
    model2.message = self.chatModel.message2;
    
    self.messageArray = [NSMutableArray arrayWithObjects:model1,model2, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    [IQKeyboardManager sharedManager].enable = NO;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
    [IQKeyboardManager sharedManager].enable = YES;
}

#pragma mark - Table

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messageArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageModel* model = [self.messageArray objectAtIndex:indexPath.row];
    if (model.type == Chatter_Other) {
        ChatReceiverCell* cell = [tableView dequeueReusableCellWithIdentifier:[ChatReceiverCell identifier] forIndexPath:indexPath];
        cell.headImageView.image = [UIImage imageNamed:self.chatModel.userHeadName];
        cell.messageLabel.text = model.message;
        return cell;
    }else{
        ChatSenderCell* cell = [tableView dequeueReusableCellWithIdentifier:[ChatSenderCell identifier] forIndexPath:indexPath];
        cell.headImagView.image = [UIImage imageNamed:@"headImage_me.jpg"];
        cell.messageLabel.text = model.message;
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

- (IBAction)didClickSend:(id)sender {
    if (self.sendTextField.text.length > 0) {
        MessageModel* model = [MessageModel new];
        model.type = Chatter_Me;
        model.message = self.sendTextField.text;
        [self.messageArray addObject:model];
        self.sendTextField.text = @"";
    
        [self.tableView reloadData];
    }
}

@end
