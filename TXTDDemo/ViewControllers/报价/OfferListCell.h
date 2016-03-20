//
//  OfferListCell.h
//  Dentist
//
//  Created by 郭晓倩 on 16/3/19.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FramedView.h"

@interface OfferListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *typeIcon;
@property (weak, nonatomic) IBOutlet FramedView *containerView;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *bottomButtonArray;

@end
