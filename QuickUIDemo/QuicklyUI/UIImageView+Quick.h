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


@end

NS_ASSUME_NONNULL_END
