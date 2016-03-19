//
//  OfferProductDetailVC.m
//  Dentist
//
//  Created by 郭晓倩 on 16/3/19.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "OfferProductDetailVC.h"

@interface OfferProductDetailVC ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UIView *detailView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIView *descripitionView;
@property (weak, nonatomic) IBOutlet UIView *buttonView;

@end

@implementation OfferProductDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"产品详情";
    
    self.scrollView.backgroundColor = [g_commonConfig bgGray002Color];
    self.detailView.backgroundColor = [g_commonConfig bgGray002Color];
    
    self.descriptionLabel.numberOfLines = 0;
    CGFloat limitWidth = kScreenWidth - 2*PIXEL_12;
    [self.descriptionLabel ajustHeightWithLimitWidth:limitWidth];
    self.descripitionView.height = self.descriptionLabel.height + 2*PIXEL_12;
    self.detailView.height = self.descripitionView.y+self.descripitionView.height + self.buttonView.height + 2;
    self.detailView.x = 0;
    self.detailView.y = 0;
    self.detailView.width = kScreenWidth;
    [self.scrollView addSubview:self.detailView];
    self.scrollView.contentSize = CGSizeMake(kScreenWidth, self.detailView.height);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
