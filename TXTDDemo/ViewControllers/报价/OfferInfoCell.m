//
//  OfferInfoCell.m
//  Dentist
//
//  Created by 郭晓倩 on 16/3/19.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "OfferInfoCell.h"

@implementation OfferInfoCell

- (void)awakeFromNib {
    // Initialization code
    
    [self.headImageView circular:self.headImageView.height/2];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
