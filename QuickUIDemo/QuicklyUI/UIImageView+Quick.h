//
//  UIImageView+Quick.h
//  QuickUI
//
//  Created by 段庆烨 on 2019/4/26.
//  Copyright © 2019年 Gioures. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ImgViewWithFrame(x, y, w, h) [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)]
#define ImgViewWithImg(imgName) [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]]


NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (Quick)

-(UIImageView *(^)(NSString *))img;
-(UIImageView *(^)(NSString *))hightLightImg;
-(UIImageView *(^)(BOOL ishight))hight;

#pragma mark UIView公开方法 只写方法 不需做实现
+(UIImageView * (^)(void))loadFromNib;

-(UIImageView * (^)(float x , float y , float w, float h))fram;

-(UIImageView * (^)(BOOL enable))able;

-(UIImageView * (^)(BOOL hid))hid;

-(UIImageView * (^)(float x,float y))cent;

-(UIImageView * (^)(float w, float h))bds;

-(UIImageView * (^)(BOOL clip))clip;

-(UIImageView *(^)(UIView * v))addOn;

-(UIImageView *(^)(UIColor * c))bg;

-(UIImageView * (^)(float w))corner;

-(UIImageView * (^)(float w))borderW;

-(UIImageView * (^)(UIColor * w))borderC;

-(UIImageView * (^)(int w))tags;

-(UIImageView * (^)(void))layout;

@end

NS_ASSUME_NONNULL_END
