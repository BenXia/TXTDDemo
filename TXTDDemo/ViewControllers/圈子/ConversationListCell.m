//
//  ConversationListCell.m
//  QQing
//
//  Created by 郭晓倩 on 15/12/17.
//
//

#import "ConversationListCell.h"

@interface ConversationListCell ()

@property (weak, nonatomic) IBOutlet UIView *sepLine;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameLabelTopConstraint;

@end

@implementation ConversationListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)prepareForReuse{

}

@end
