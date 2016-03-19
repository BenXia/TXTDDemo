//
//  ConversationListCell.h
//  QQing
//
//  Created by 郭晓倩 on 15/12/17.
//
//

#import <UIKit/UIKit.h>

@interface ConversationListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
