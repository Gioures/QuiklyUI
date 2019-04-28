//
//  UILabel+Quick.m
//  QuickUI
//
//  Created by 段庆烨 on 2019/4/25.
//  Copyright © 2019年 Gioures. All rights reserved.
//

#import "UILabel+Quick.h"

@implementation UILabel (Quick)

+(UILabel * _Nonnull (^)(void))Label{
    return ^{
        return [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    };
}

-(UILabel * _Nonnull (^)(NSString * _Nonnull))str{
    return ^(NSString * s){
        [self setText:s];
        return self;
    };
}

-(UILabel * _Nonnull (^)(UIColor * _Nonnull))color{
    return ^(UIColor * c){
        [self setTextColor:c];
        return self;
    };
}

-(UILabel * _Nonnull (^)(float))fnt{
    return ^(float f){
        [self setFont:[UIFont systemFontOfSize:f] ];
        return self;
    };
}

-(UILabel * _Nonnull (^)(NSTextAlignment))alignment{
    return ^(NSTextAlignment s){
        [self setTextAlignment:s];
        return self;
    };
}

-(UILabel * _Nonnull (^)(float))line{
    return ^(float l){
        [self setNumberOfLines:l];
        return self;
    };
}

-(UILabel * _Nonnull (^)(BOOL))adjust{
    return ^(BOOL z){
        [self setAdjustsFontSizeToFitWidth:z];
        return self;
    };
}

-(UILabel * _Nonnull (^)(NSAttributedString * _Nonnull))attr{
    return ^(NSAttributedString *z){
        [self setAttributedText:z];
        return self;
    };
}




@end
