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
-(UIButton* (^)(NSString* str))str;

-(UIButton* (^)(UIColor * c))color;

-(UIButton* (^)(float f))fnt;

-(UIButton* (^)(BOOL a))adjust;
@end

NS_ASSUME_NONNULL_END
