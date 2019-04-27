//
//  UILabel+Quick.h
//  QuickUI
//
//  Created by ytkjs on 2019/4/25.
//  Copyright © 2019年 Gioures. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Quick)

+(UILabel* (^)(void))Label;

-(UILabel* (^)(NSString* str))str;

-(UILabel* (^)(UIColor * c))color;

-(UILabel* (^)(float f))fnt;

-(UILabel* (^)(NSTextAlignment a))alignment;

-(UILabel* (^)(float l))line;

-(UILabel* (^)(BOOL a))adjust;

-(UILabel* (^)(NSAttributedString *a))attr;

@end

NS_ASSUME_NONNULL_END
