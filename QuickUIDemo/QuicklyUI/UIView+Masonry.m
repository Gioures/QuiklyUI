//
//  UIView+Masonry.m
//  QuickUIDemo
//
//  Created by 段庆烨 on 2019/4/27.
//  Copyright © 2019年 段庆烨. All rights reserved.
//

#import "UIView+Masonry.h"

@implementation UIView (Masonry)

-(UIView *(^)(ConstraintBlock))makeCons{
    return ^(ConstraintBlock block){
        [self mas_makeConstraints:block];
        return self;
    };
}

- (UIView *(^)(ConstraintBlock))reMakeCons{
    return ^(ConstraintBlock block){
        [self mas_remakeConstraints:block];
        return self;
    };
}

-(UIView *(^)(ConstraintBlock))updateCons{
    return ^(ConstraintBlock block){
        [self mas_updateConstraints:block];
        return self;
    };
}

@end
