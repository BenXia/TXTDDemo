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
    NSMutableAttributedString *moneyAttributedString = [[NSMutableAttributedString alloc] initWithString:@"2000" attributes:@{NSForegroundColorAttributeName:[UIColor redColor], NSFontAttributeName:[UIFont systemFontOfSize:25]}];
    
    [moneyAttributedString appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"\n%@",@"万元"] attributes:@{NSForegroundColorAttributeName:[UIColor gray006Color], NSFontAttributeName:[UIFont systemFontOfSize:10]}]];
    self.moneyLabel.attributedText = moneyAttributedString;
    
    NSMutableAttributedString *mouthAttributedString = [[NSMutableAttributedString alloc] initWithString:@"12" attributes:@{NSForegroundColorAttributeName:[UIColor themeBlueColor], NSFontAttributeName:[UIFont systemFontOfSize:25]}];
    
    [mouthAttributedString appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"\n%@",@"个月"] attributes:@{NSForegroundColorAttributeName:[UIColor gray006Color], NSFontAttributeName:[UIFont systemFontOfSize:10]}]];
    self.mouthLabel.attributedText = mouthAttributedString;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
