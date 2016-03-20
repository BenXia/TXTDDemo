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

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *filterButtonArray2;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *filterButtonArray3;
@property (strong, nonatomic) IBOutlet UIView *filterView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation OfferFilterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"更多筛选";
    self.scrollView.backgroundColor = [g_commonConfig bgGray002Color];
    
    NSMutableArray* buttonArray = [NSMutableArray new];
    [buttonArray addObjectsFromArray:self.filterButtonArray];
    [buttonArray addObjectsFromArray:self.filterButtonArray2];
    [buttonArray addObjectsFromArray:self.filterButtonArray3];
    for (UIButton* button in buttonArray) {
        button.layer.cornerRadius = 3;
        button.layer.borderWidth = 1.f;
        [button setTitleColor:[g_commonConfig gray006Color]];
        [RACObserve(button, selected) subscribeNext:^(NSNumber* x) {
            if (x.boolValue) {
                [button setBorderColor:[g_commonConfig themeGreenColor]];
                [button setBackgroundColor:[g_commonConfig themeGreenColor]];
                [button setTitleColor:[UIColor whiteColor]];
            }else{
                [button setBorderColor:[g_commonConfig gray004Color]];
                [button setBackgroundColor:[UIColor whiteColor]];
                [button setTitleColor:[g_commonConfig fontGray007Color]];
            }
        }];
        if ([[button titleForState:UIControlStateNormal] isEqualToString:@"全部"]) {
            button.selected = YES;
        }
    }
    
    self.filterView.x = 0;
    self.filterView.y = 0;
    self.filterView.width = kScreenWidth;
    [self.scrollView addSubview:self.filterView];
    self.scrollView.contentSize = CGSizeMake(kScreenWidth, self.filterView.height);
}

-(IBAction)didClickFilterButtons1:(id)sender{
    for (UIButton* button in self.filterButtonArray) {
        if (button == sender) {
            button.selected = YES;
        }else{
            button.selected = NO;
        }
    }
}

-(IBAction)didClickFilterButtons2:(id)sender{
    for (UIButton* button in self.filterButtonArray2) {
        if (button == sender) {
            button.selected = YES;
        }else{
            button.selected = NO;
        }
    }
}

-(IBAction)didClickFilterButtons3:(id)sender{
    for (UIButton* button in self.filterButtonArray3) {
        if (button == sender) {
            button.selected = YES;
        }else{
            button.selected = NO;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
