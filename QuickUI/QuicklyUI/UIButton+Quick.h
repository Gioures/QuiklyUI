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

-(UIButton* (^)(float t,float l,float b, float r))titleInset;

-(UIButton* (^)(float t,float l,float b, float r))imgInset;

-(UIButton* (^)(BOOL a))select;

-(UIButton* (^)(id tager , SEL s))action;





@end

NS_ASSUME_NONNULL_END
