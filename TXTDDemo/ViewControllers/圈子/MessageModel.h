//
//  MessageModel.h
//  TXTDDemo
//
//  Created by 郭晓倩 on 16/3/27.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ChatterType) {
    Chatter_Other,
    Chatter_Me,
};

@interface MessageModel : NSObject

@property (assign,nonatomic) ChatterType type;
@property (strong,nonatomic) NSString* message;

@end
