//
//  FramedView.h
//  QQing
//
//  Created by 李杰 on 3/23/15.
//
//

#import <UIKit/UIKit.h>

@interface FramedView : UIView

@property (nonatomic, copy) NSString *backgroundImage;
@property (nonatomic, strong) UIImageView *background;

/**
 * 这个很重要
 */
@property (nonatomic, assign) UIEdgeInsets edgeInsets;

+ (UIEdgeInsets)defaultEdgeInsets;

- (id)initWithFrame:(CGRect)frame image:(NSString *)image;

/**
 *- (void)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context;
 */
- (void)addContentHeightObserver:(NSObject *)obj forKeyPath:(NSString *)keyPath;

@end