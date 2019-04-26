//
//  UIView+Quick.m
//  QuickUI
//
//  Created by ytkjs on 2019/4/25.
//  Copyright © 2019年 Gioures. All rights reserved.
//

#import "UIView+Quick.h"
#import <objc/runtime.h>

@interface UIView ()

@end

@implementation UIView (Quick)
@dynamic tapBlock;

-(void)setTapBlock:(void (^)(UIView * _Nonnull))tapBlock{
    objc_setAssociatedObject(self, @selector(tapBlock), tapBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void (^)(UIView * _Nonnull))tapBlock{
    return objc_getAssociatedObject(self, @selector(tapBlock));
}

+(UIView * _Nonnull (^)(void))View{
    return ^{
        return [UIView new];
    };
}


-(UIView * _Nonnull (^)(float, float, float, float))fram{
    return ^(float x , float y , float w, float h){
        [self setFrame:CGRectMake(x, y, w, h)];
        return self;
    };
}

-(UIView * _Nonnull (^)(BOOL))able{
    return ^(BOOL enable){
        self.userInteractionEnabled = enable;
        return self;
    };
}

-(UIView * _Nonnull (^)(BOOL))hid{
    return ^(BOOL hid){
        self.hidden = hid;
        return self;
    };
}

-(UIView * _Nonnull (^)(float, float))cent{
    return ^(float x, float y){
        [self setCenter:CGPointMake(x, y)];
        return self;
    };
}

-(UIView * _Nonnull (^)(float, float))bds{
    return ^(float x, float y){
        [self setBounds:CGRectMake(0,0,x, y)];
        return self;
    };
}

-(UIView * _Nonnull (^)(BOOL))clip{
    return ^(BOOL clip){
        [self setClipsToBounds:clip];
        return self;
    };
}

-(UIView * _Nonnull (^)(void (^ _Nonnull)(UIView * _Nonnull)))tap{
    __weak typeof(self) weakView = self;
    self.userInteractionEnabled = YES;
    
    if (self.gestureRecognizers > 0) {
        for (UITapGestureRecognizer * z in self.gestureRecognizers) {
            [self removeGestureRecognizer:z];
        }
    }
    
    return ^(void (^block)(UIView * v)){
        __strong typeof(weakView) strongView = weakView;
        UITapGestureRecognizer * t = [[UITapGestureRecognizer alloc] initWithTarget:strongView action:@selector(tapG:)];
        [strongView addGestureRecognizer:t];
        strongView.tapBlock = block;
        return strongView;
    };
}

-(UIView * _Nonnull (^)(UIView * _Nonnull))addOn{
    return ^(UIView *v){
        [v addSubview:self];
        return self;
    };
}

-(UIView * _Nonnull (^)(UIColor * _Nonnull))bg{
    return ^(UIColor * c){
        [self setBackgroundColor:c];
        return self;
    };
}

-(UIView * _Nonnull (^)(float))corner{
    return ^(float z){
        self.layer.cornerRadius = z;
        self.clipsToBounds = YES;
        return self;
    };
}

-(UIView * _Nonnull (^)(float))borderW{
    return ^(float z){
        self.layer.borderWidth = z;
        return self;
    };
}

-(UIView * _Nonnull (^)(UIColor * _Nonnull))borderC{
    return ^(UIColor *z){
        self.layer.borderColor = z.CGColor;
        return self;
    };
}

-(void)tapG:(UITapGestureRecognizer *)t{
    self.tapBlock(t.view);
}

-(UIView * _Nonnull (^)(int))tags{
    return ^(int i){
        [self setTag:i];
        return self;
    };
}

@end
