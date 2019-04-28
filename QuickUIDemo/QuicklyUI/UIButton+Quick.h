//
//  UIButton+Quick.h
//  QuickUI
//
//  Created by 段庆烨 on 2019/4/25.
//  Copyright © 2019年 Gioures. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface UIButton (Quick)


@property (nonatomic , assign)CGRect titleRect;
@property (nonatomic , assign)CGRect imgRect;
@property (nonatomic , copy)void(^clickBlock)(UIButton *b);


+(UIButton* (^)(void))Button;

-(UIButton* (^)(NSString* str))str;

-(UIButton* (^)(NSString* str))hightStr;

-(UIButton* (^)(NSString* str))img;

-(UIButton* (^)(NSString* str))selectImg;

-(UIButton* (^)(NSString* str))bgImge;

-(UIButton* (^)(NSString* str))selectBgImge;

-(UIButton* (^)(NSString* str))hightImg;

-(UIButton* (^)(UIColor * c))color;

-(UIButton* (^)(float f))fnt;

-(UIButton* (^)(BOOL a))adjust;


#pragma mark UIView公开方法 只写方法 不需做实现
+(UIButton * (^)(void))loadFromNib;

-(UIButton * (^)(float x , float y , float w, float h))fram;

-(UIButton * (^)(BOOL enable))able;

-(UIButton * (^)(BOOL hid))hid;

-(UIButton * (^)(float x,float y))cent;

-(UIButton * (^)(float w, float h))bds;

-(UIButton * (^)(BOOL clip))clip;

-(UIButton * (^)(UIView * v))addOn;

-(UIButton * (^)(UIColor * c))bg;

-(UIButton * (^)(float w))corner;

-(UIButton * (^)(float w))borderW;

-(UIButton * (^)(UIColor * w))borderC;

-(UIButton * (^)(int w))tags;

-(UIButton * (^)(void))layout;


#pragma mark 随意设置文字和图片位置，本想用runtime写在这里 但是有BUG 以后写成继承吧
/*
-(UIButton* (^)(float t,float l,float b, float r))titleInset;

-(UIButton* (^)(float t,float l,float b, float r))imgInset;
*/




-(UIButton * (^)(BOOL a))select;

-(UIButton * (^)(id tager , SEL s))action;

-(UIButton * (^)(void (^action)(UIButton * v)))click;



@end

NS_ASSUME_NONNULL_END
