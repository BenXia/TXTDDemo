//
//  DirectPriceVC.m
//  TXTDDemo
//
//  Created by 郭晓倩 on 16/3/20.
//  Copyright © 2016年 iOSStudio. All rights reserved.
//

#import "DirectPriceVC.h"
#import "DirectPriceByFinancing.h"
#import "DirectPriceBySameJob.h"

@interface DirectPriceVC ()

@property (strong,nonatomic) DirectPriceBySameJob* childVC1;
@property (strong,nonatomic) DirectPriceByFinancing* childVC2;
@property (strong, nonatomic) UISegmentedControl *segementedControl;


@end

@implementation DirectPriceVC

-(instancetype)init{
    if (self = [super init]) {
        self.childVC1 = [DirectPriceBySameJob new];
        self.childVC2 = [DirectPriceByFinancing new];
        [self addChildViewController:self.childVC1];
        [self addChildViewController:self.childVC2];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.titleView = self.segementedControl;
    self.segementedControl.selectedSegmentIndex = 0;
    [self didSelectedOnSegment:self.segementedControl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didSelectedOnSegment:(UISegmentedControl *)sender {
    NSInteger selectedIndex = sender.selectedSegmentIndex;
    if (selectedIndex == 0) {
        //切换我的关注
        [self.view removeAllSubviews];
        [self.view addSubview:self.childVC1.view];
        self.childVC1.view.backgroundColor = [UIColor yellowColor];
        self.childVC1.view.frame = self.view.bounds;
    } else if (selectedIndex == 1) {
        //切换智能推荐
        [self.view removeAllSubviews];
        [self.view addSubview:self.childVC2.view];
        self.childVC2.view.backgroundColor = [UIColor blueColor];
        self.childVC2.view.frame = self.view.bounds;
    }
}

-(UISegmentedControl*)segementedControl{
    if (_segementedControl == nil) {
        _segementedControl = [[UISegmentedControl alloc]initWithItems:@[@"同业指导价", @"理财指导价"]];
        _segementedControl.size=CGSizeMake(160, 30);
        UIColor* selectedColor = [g_commonConfig themeLightBlueColor];
        
        //文字颜色
        [_segementedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateSelected];
        [_segementedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateHighlighted];
        [_segementedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:selectedColor,NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
        //背景颜色
        UIImage* selectedImage = [UIImage imageWithColor:selectedColor andSize:CGSizeMake(_segementedControl.width/2,_segementedControl.height)];
        UIImage* unselectedImage = [UIImage imageWithColor:[UIColor whiteColor] andSize:CGSizeMake(_segementedControl.width/2,_segementedControl.height)];
        [_segementedControl setBackgroundImage:selectedImage forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        [_segementedControl setBackgroundImage:selectedImage forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        [_segementedControl setBackgroundImage:unselectedImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        //分割线
        UIImage* dividerImage = [UIImage imageWithColor:selectedColor andSize:CGSizeMake(1, _segementedControl.height)];
        [_segementedControl setDividerImage:dividerImage forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        [_segementedControl setDividerImage:dividerImage forLeftSegmentState:UIControlStateSelected rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        //边角
        _segementedControl.layer.cornerRadius = 5.f;
        _segementedControl.layer.masksToBounds = YES;
        [_segementedControl setBorderColor:selectedColor];
        [_segementedControl setBorderWidth:1.f];
        //事件
        [_segementedControl addTarget:self action:@selector(didSelectedOnSegment:) forControlEvents:UIControlEventValueChanged];
    }
    return _segementedControl;
}

@end
