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
}

-(void)prepareForReuse{
    self.containerViewTopConstraint.constant = PIXEL_12;
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [super setHighlighted:highlighted animated:animated];
    if (highlighted) {
        self.containerView.backgroundColor = [UIColor gray003Color];
    }else{
        self.containerView.backgroundColor = [UIColor whiteColor];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
