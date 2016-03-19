//
//  OfferFilterVC.m
//  Dentist
//
//  Created by 郭晓倩 on 16/3/19.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "OfferFilterVC.h"

@interface OfferFilterVC ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *filterButtonArray;
@property (strong, nonatomic) IBOutlet UIView *filterView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation OfferFilterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"更多过滤";
    self.scrollView.backgroundColor = [g_commonConfig bgGray002Color];
    
    for (UIButton* button in self.filterButtonArray) {
        button.layer.cornerRadius = 3;
        if (![[button titleForState:UIControlStateNormal] isEqualToString:@"全部"]) {
            button.layer.borderWidth = 1.f;
            button.layer.borderColor = [g_commonConfig lineGray001Color].CGColor;
        }
    }
    
    self.filterView.x = 0;
    self.filterView.y = 0;
    self.filterView.width = kScreenWidth;
    [self.scrollView addSubview:self.filterView];
    self.scrollView.contentSize = CGSizeMake(kScreenWidth, self.filterView.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
