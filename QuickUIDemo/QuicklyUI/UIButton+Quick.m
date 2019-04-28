//
//  UIButton+Quick.m
//  QuickUI
//
//  Created by 段庆烨 on 2019/4/25.
//  Copyright © 2019年 Gioures. All rights reserved.
//

#import "UIButton+Quick.h"
#import <objc/runtime.h>
@implementation UIButton (Quick)
@dynamic titleRect;
@dynamic imgRect;
/*  设置随意改变文字和图片位置， 建议写成继承
+(void)load{
    Method img1 = class_getInstanceMethod([UIButton class], @selector(imgRectForContentRect:));
    Method img2 = class_getInstanceMethod([UIButton class], @selector(imageRectForContentRect:));
    method_exchangeImplementations(img1, img2);
    
    Method title1 = class_getInstanceMethod([UIButton class], @selector(labelRectForContentRect:));
    Method title2 = class_getInstanceMethod([UIButton class], @selector(titleRectForContentRect:));
    method_exchangeImplementations(title1, title2);

}


-(CGRect)imgRectForContentRect:(CGRect)contentRect{
    if (CGRectEqualToRect(self.imgRect, CGRectZero) || CGRectIsEmpty(self.imgRect)) {
        return [self imageRectForContentRect:contentRect];
    }else{
        return self.imgRect;
    }
}

-(CGRect)labelRectForContentRect:(CGRect)contentRect{
    if (CGRectEqualToRect(self.titleRect, CGRectZero) || CGRectIsEmpty(self.titleRect)) {
        return [self titleRectForContentRect:contentRect];
    }else{
        return self.titleRect;
    }
}
*/

// 设置属性的修饰词必须用强引用类型或者copy类型否则运行会报错 传数字用number修饰， 其他基础类型用NSValue修饰
-(void)setTitleRect:(CGRect)titleRect{
    objc_setAssociatedObject(self, @selector(titleRect), [NSValue valueWithCGRect:titleRect], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CGRect)titleRect{
    return [objc_getAssociatedObject(self, @selector(titleRect)) CGRectValue];
}

-(void)setImgRect:(CGRect)imgRect{
        objc_setAssociatedObject(self, @selector(imgRect), [NSValue valueWithCGRect:imgRect], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CGRect)imgRect{
    if (objc_getAssociatedObject(self, @selector(imgRect))) {
        return [objc_getAssociatedObject(self, @selector(imgRect)) CGRectValue];;
    }else{
        return CGRectZero;
    }
}

-(void)setClickBlock:(void (^)(UIButton * _Nonnull))clickBlock{
    objc_setAssociatedObject(self, @selector(clickBlock), clickBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void (^)(UIButton * _Nonnull))clickBlock{
    return objc_getAssociatedObject(self, @selector(clickBlock));
}



+(UIButton * _Nonnull (^)(void))Button{
    return ^{
        return [UIButton buttonWithType:UIButtonTypeCustom];
    };
}

- (UIButton * _Nonnull (^)(NSString * _Nonnull))str{
    return ^(NSString * s){
        [self setTitle:s forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton * _Nonnull (^)(NSString * _Nonnull))img{
    return ^(NSString * s){
        [self setImage:[UIImage imageNamed:s] forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton * _Nonnull (^)(NSString * _Nonnull))selectImg{
    return ^(NSString * s){
        [self setImage:[UIImage imageNamed:s] forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton * _Nonnull (^)(NSString * _Nonnull))bgImge{
    return ^(NSString * s){
        [self setBackgroundImage:[UIImage imageNamed:s] forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton * _Nonnull (^)(NSString * _Nonnull))selectBgImge{
    return ^(NSString * s){
        [self setBackgroundImage:[UIImage imageNamed:s] forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton * _Nonnull (^)(NSString * _Nonnull))hightStr{
    return ^(NSString * s){
        [self setTitle:s forState:UIControlStateHighlighted];
        return self;
    };
}

- (UIButton * _Nonnull (^)(NSString * _Nonnull))hightImg{
    return ^(NSString * s){
        [self setImage:[UIImage imageNamed:s] forState:UIControlStateHighlighted];
        return self;
    };
}

- (UIButton * _Nonnull (^)(UIColor * _Nonnull))color{
    return ^(UIColor *c){
        [self setTitleColor:c forState:0];
        return self;
    };
}

- (UIButton * _Nonnull (^)(float))fnt{
    return ^(float f){
        [self.titleLabel setFont:[UIFont systemFontOfSize:f]];
        return self;
    };
}

- (UIButton * _Nonnull (^)(BOOL))adjust{
    return ^(BOOL a){
        self.adjustsImageWhenDisabled = a;
        return self;
    };
}

-(UIButton * _Nonnull (^)(float t,float l,float b, float r))titleInset{
    return ^(float t,float l,float b, float r){
        [self setTitleEdgeInsets:UIEdgeInsetsMake(t, l, b, r)];
        return self;
    };
}

-(UIButton * _Nonnull (^)(float, float, float, float))imgInset{
    return ^(float t,float l,float b, float r){
        [self setImageEdgeInsets:UIEdgeInsetsMake(t, l, b, r)];
        return self;
    };
}

-(UIButton * _Nonnull (^)(BOOL))select{
    return ^(BOOL s){
        [self setSelected:s];
        return self;
    };
}

-(UIButton * _Nonnull (^)(id _Nonnull, SEL _Nonnull))action{
    __weak typeof(self) wk = self;
    return ^(id _Nonnull t, SEL _Nonnull s){
        __strong typeof(wk) strongSelf = wk;
        [strongSelf addTarget:t action:s forControlEvents:UIControlEventTouchUpInside];
        return self;
    };
}

-(UIButton * _Nullable (^)(void (^ _Nullable)(UIButton * _Nullable)))click{
    __weak typeof(self) wk = self;
    return ^(void (^z)(UIButton * b)){
        __strong typeof(wk) st = wk;
        [st addTarget:st action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        st.clickBlock = z;
        return self;
    };
}

-(void)click:(UIButton*)button{
    self.clickBlock(button);
}

-(void)dealloc{
    NSLog(@"button 释放");
}

@end
