//
//  ChatSenderCell.m
//  TXTDDemo
//
//  Created by 郭晓倩 on 16/3/19.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "ChatSenderCell.h"

@interface ChatSenderCell ()


@end

@implementation ChatSenderCell

- (void)awakeFromNib {
    // Initialization code
    
    self.infoLabel.numberOfLines = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
