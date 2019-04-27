//
//  UIImageView+Quick.m
//  QuickUI
//
//  Created by 段庆烨 on 2019/4/26.
//  Copyright © 2019年 Gioures. All rights reserved.
//

#import "UIImageView+Quick.h"

@implementation UIImageView (Quick)

-(UIImageView * _Nonnull (^)(NSString * _Nonnull))img{
    return ^(NSString *name){
        [self setImage:[UIImage imageNamed:name]];
        return self;
    };
}

-(UIImageView * _Nonnull (^)(NSString * _Nonnull))hightLightImg{
    return ^(NSString *name){
        [self setHighlightedImage:[UIImage imageNamed:name]];
        return self;
    };
}

-(UIImageView * _Nonnull (^)(BOOL))hight{
    return ^(BOOL name){
        [self setHighlighted:name];
        return self;
    };
}



@end
