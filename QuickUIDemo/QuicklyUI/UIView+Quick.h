//
//  UIView+Quick.h
//  QuickUI
//
//  Created by ytkjs on 2019/4/25.
//  Copyright © 2019年 Gioures. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN



@interface UIView (Quick)

@property (nonatomic, copy) void(^tapBlock)(UIView * v);

+(UIView * (^)(void))View;

-(UIView * (^)(float x , float y , float w, float h))fram;

-(UIView * (^)(BOOL enable))able;

-(UIView * (^)(BOOL hid))hid;

-(UIView * (^)(float x,float y))cent;

-(UIView * (^)(float w, float h))bds;

-(UIView * (^)(BOOL clip))clip;

-(UIView * (^)(void (^action)(UIView * v)))tap;

-(UIView *(^)(UIView * v))addOn;

-(UIView *(^)(UIColor * c))bg;

-(UIView * (^)(float w))corner;

-(UIView * (^)(float w))borderW;

-(UIView * (^)(UIColor * w))borderC;

-(UIView * (^)(int w))tags;

-(UIView * (^)(void))layout;

@end

NS_ASSUME_NONNULL_END
