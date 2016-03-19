//
//  FramedView.m
//  QQing
//
//  Created by 李杰 on 3/23/15.
//
//

#import "FramedView.h"
#define EDGEINSETS UIEdgeInsetsMake(5.f/2, 5.f/2, 5.f/2, 5.f/2)

@interface FramedView ()

@end

@implementation FramedView

#pragma mark - Intialization

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        // Xib init
        
        [self initEdge];
        
        // 默认图片
        [self setBackgroundImage:@"frame_bg01"];
        [self initBackground];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self initEdge];
        
        // 默认图片
        [self setBackgroundImage:@"frame_bg01"];
        [self initBackground];
    }
    
    return self;
}

- (void)initEdge {
    
    self.edgeInsets = EDGEINSETS;
    // fixme: 可以宏化
//    Block retinaBlock = ^() {
//        self.edgeInsets = UIEdgeInsetsMake(4.f/2, 4.f/2, 4.f/2, 4.f/2);
//    };
//    Block retinaPlusBlock = ^() {
//    self.edgeInsets = EDGEINSETS;
//    };
//    [DeviceUtil adaptPhone4s:retinaBlock phone5s:retinaBlock phone6:retinaBlock phone6p:retinaPlusBlock];
}

- (void)initBackground {
    self.backgroundColor = [UIColor clearColor];
    
    UIImage *image = [[UIImage imageNamed:self.backgroundImage] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    self.background = [[UIImageView alloc] initWithImage:image];
//    [self.background setFrame:self.frame];
    
    [super addSubview:self.background];
    [self.background sendToBack];
    self.background.translatesAutoresizingMaskIntoConstraints = NO; // !!!!
//    [self.background setCenter:CGPointMake(self.width/2, self.height/2)];
    
    // Constraint
    NSLayoutConstraint *constWidth = [NSLayoutConstraint constraintWithItem:self.background
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.background.superview
                                                                  attribute:NSLayoutAttributeWidth
                                                                 multiplier:1.0f
                                                                   constant:0.0f];
    NSLayoutConstraint *constHeight = [NSLayoutConstraint constraintWithItem:self.background
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.background.superview
                                                                  attribute:NSLayoutAttributeHeight
                                                                  multiplier:1.0f
                                                                   constant:0.0f];
    NSLayoutConstraint *constCenterX = [NSLayoutConstraint constraintWithItem:self.background
                                                                  attribute:NSLayoutAttributeCenterX
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.background.superview
                                                                  attribute:NSLayoutAttributeCenterX multiplier:1.0f
                                                                   constant:0.0f];
    NSLayoutConstraint *constCenterY = [NSLayoutConstraint constraintWithItem:self.background
                                                                  attribute:NSLayoutAttributeCenterY
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.background.superview
                                                                  attribute:NSLayoutAttributeCenterY multiplier:1.0f
                                                                   constant:0.0f];
    [self.background.superview addConstraints:[NSArray arrayWithObjects:constWidth, constHeight, constCenterX, constCenterY, nil]];
}

- (void)resizeBackground {
    [self.background setFrame:self.frame];
    [self.background setCenter:CGPointMake(self.width/2, self.height/2)];
}

#pragma mark - Override

- (void)addSubview:(UIView *)view {
    [super addSubview:view];
    
    // 根据 self.edgeInsets 将坐标系做x/y偏移
    // FIXME. 貌似欠考虑
//    view.x = view.x > self.edgeInsets.left ? self.edgeInsets.left : view.x;
//    view.y = view.y > self.edgeInsets.top ? self.edgeInsets.top : view.y;
//    
//    if (view.x+view.width>self.width-self.edgeInsets.right) {
//        view.width = self.width-view.x-self.edgeInsets.right;
//    }
//    if (view.y+view.height>)
    // 不做这个处理，外部注意即可
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    // 这应该用约束实现 fixme
//    [self resizeBackground];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/**
 * fixme：需要自适应sub views的/内容的大小
 */
- (void)layoutSubviews {
    [super layoutSubviews];

}

// kvo 观察子view的变化，修正自己的高度，键值观察
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    QQLog(@"framedview observer = %@", change);
}

#pragma mark - Properties setting



#pragma mark - External initialization

- (id)initWithFrame:(CGRect)frame image:(NSString *)image {
    if (self = [self initWithFrame:frame]) {
        [self setBackgroundImage:image];
        
        [self initBackground];
    }

    return self;
}

- (void)addContentHeightObserver:(NSObject *)obj forKeyPath:(NSString *)keyPath {
    if (obj && keyPath && [keyPath length]) {
        [obj addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:nil];
    }
}

+(UIEdgeInsets)defaultEdgeInsets{

    return EDGEINSETS;
}
@end
