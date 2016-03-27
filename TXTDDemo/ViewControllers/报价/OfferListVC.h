//
//  OfferListVC.h
//  Dentist
//
//  Created by 郭晓倩 on 16/3/19.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OffeListModel : NSObject
@property (strong, nonatomic) NSString *headImageName;
@property (strong, nonatomic) NSString *nick;
@property (strong, nonatomic) NSString *backName;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *rate;
@end

@interface OfferListVC : BaseViewController

@end
