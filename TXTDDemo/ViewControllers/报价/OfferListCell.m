//
//  OfferListCell.m
//  Dentist
//
//  Created by 郭晓倩 on 16/3/19.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "OfferListCell.h"

@implementation OfferListCell

- (void)awakeFromNib {
    // Initialization code
    [self.typeIcon bringToFront];
    
    for (UIButton* button in self.bottomButtonArray) {
        [button setBackgroundImage:[UIImage imageWithColor:[g_commonConfig gray003Color]] forState:UIControlStateHighlighted];
    }
}

-(void)prepareForReuse{
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [super setHighlighted:highlighted animated:animated];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)didClickCallButton:(id)sender {
    [Utilities makePhoneCall:@"13166666666"];
}

@end
