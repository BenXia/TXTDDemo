//
//  DirectPriceByFiancingCell.m
//  TXTDDemo
//
//  Created by 郭晓倩 on 16/3/20.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "DirectPriceByFiancingCell.h"

@implementation DirectPriceByFiancingCell

- (void)awakeFromNib {
    // Initialization code
    self.bankLabel.textColor = [g_commonConfig gray006Color];
    self.typeLabel.textColor = [g_commonConfig gray006Color];
    self.targetLabel.textColor = [g_commonConfig gray006Color];
    self.priceLabel.textColor = [g_commonConfig themeRedColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
