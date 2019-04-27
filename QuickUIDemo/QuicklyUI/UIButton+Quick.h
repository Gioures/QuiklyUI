//
//  UIButton+Quick.h
//  QuickUI
//
//  Created by ytkjs on 2019/4/25.
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

#pragma warning 写成继承最好
/*
-(UIButton* (^)(float t,float l,float b, float r))titleInset;

-(UIButton* (^)(float t,float l,float b, float r))imgInset;
*/




-(UIButton* (^)(BOOL a))select;

-(UIButton* (^)(id tager , SEL s))action;

-(UIButton* (^)(void (^action)(UIButton * v)))click;



@end

NS_ASSUME_NONNULL_END
