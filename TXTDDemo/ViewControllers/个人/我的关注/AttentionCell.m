//
//  AttentionCell.m
//  TXTDDemo
//
//  Created by 王涛 on 16/3/19.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "AttentionCell.h"

@interface AttentionCell ()
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *mouthLabel;
@end

@implementation AttentionCell

- (void)awakeFromNib {
    NSMutableAttributedString *moneyAttributedString = [[NSMutableAttributedString alloc] initWithString:@"2000" attributes:@{NSForegroundColorAttributeName:[UIColor redColor], NSFontAttributeName:[UIFont systemFontOfSize:30]}];
    
    [moneyAttributedString appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",@"万元"] attributes:@{NSForegroundColorAttributeName:[g_commonConfig gray006Color], NSFontAttributeName:[UIFont systemFontOfSize:14]}]];
    self.moneyLabel.attributedText = moneyAttributedString;
    
    NSMutableAttributedString *mouthAttributedString = [[NSMutableAttributedString alloc] initWithString:@"12" attributes:@{NSForegroundColorAttributeName:[g_commonConfig themeBlueColor], NSFontAttributeName:[UIFont systemFontOfSize:30]}];
    
    [mouthAttributedString appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",@"个月"] attributes:@{NSForegroundColorAttributeName:[g_commonConfig gray006Color], NSFontAttributeName:[UIFont systemFontOfSize:14]}]];

    self.mouthLabel.attributedText = mouthAttributedString;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
