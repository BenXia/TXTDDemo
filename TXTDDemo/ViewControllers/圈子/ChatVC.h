//
//  ChatVC.h
//  TXTDDemo
//
//  Created by 郭晓倩 on 16/3/19.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MAKE_MODEL(name,message1,message2) [ChatModel modelWithName:name Message1:message1 Message2:message2]

@interface ChatModel : NSObject

@property (strong,nonatomic) NSString* userHeadName;
@property (strong,nonatomic) NSString* userName;
@property (strong,nonatomic) NSString* message1;
@property (strong,nonatomic) NSString* message2;


+(ChatModel*)modelWithName:(NSString*)name Message1:(NSString*)message1 Message2:(NSString*)message2;

@end


@interface ChatVC : BaseViewController

@property (strong,nonatomic) ChatModel* chatModel;

@end
