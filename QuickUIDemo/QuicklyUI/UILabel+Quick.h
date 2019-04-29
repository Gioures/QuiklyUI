//
//  UILabel+Quick.h
//  QuickUI
//
//  Created by 段庆烨 on 2019/4/25.
//  Copyright © 2019年 Gioures. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Quick)

+(UILabel* (^)(void))Label;

-(UILabel* (^)(NSString* str))str;

-(UILabel* (^)(UIColor * c))color;

-(UILabel* (^)(float f))fnt;

-(UILabel* (^)(NSTextAlignment a))alignment;

-(UILabel* (^)(float l))line;

-(UILabel* (^)(BOOL a))adjust;

-(UILabel* (^)(NSAttributedString *a))attr;

#pragma mark UIView公共方法 不需要实现
+(UILabel * (^)(void))loadFromNib;

-(UILabel * (^)(float x , float y , float w, float h))fram;

-(UILabel * (^)(BOOL enable))able;

-(UILabel * (^)(BOOL hid))hid;

-(UILabel * (^)(float x,float y))cent;

-(UILabel * (^)(float w, float h))bds;

-(UILabel * (^)(BOOL clip))clip;

-(UILabel *(^)(UIView * v))addOn;

-(UILabel *(^)(UIColor * c))bg;

-(UILabel * (^)(float w))corner;

-(UILabel * (^)(float w))borderW;

-(UILabel * (^)(UIColor * w))borderC;

-(UILabel * (^)(int w))tags;

-(UILabel * (^)(void))layout;

-(UILabel * (^)(void (^action)(UILabel * v)))tap;

@end

NS_ASSUME_NONNULL_END
