//
//  UIView+Masonry.h
//  QuickUIDemo
//
//  Created by 段庆烨 on 2019/4/27.
//  Copyright © 2019年 段庆烨. All rights reserved.
//


/**
 
 此处Masonry内部做了处理 ， 不需要用weakSelf
 
 */
#import <UIKit/UIKit.h>
#import "Masonry.h"
typedef void(^ConstraintBlock)(MASConstraintMaker *make);
@interface UIView (Masonry)

-(UIView * (^)(ConstraintBlock block))makeCons;

-(UIView * (^)(ConstraintBlock block))reMakeCons;

-(UIView * (^)(ConstraintBlock block))updateCons;

@end

@interface UILabel (Masonry)

-(UILabel * (^)(ConstraintBlock block))makeCons;

-(UILabel * (^)(ConstraintBlock block))reMakeCons;

-(UILabel * (^)(ConstraintBlock block))updateCons;

@end

@interface UIImageView (Masonry)

-(UIImageView * (^)(ConstraintBlock block))makeCons;

-(UIImageView * (^)(ConstraintBlock block))reMakeCons;

-(UIImageView * (^)(ConstraintBlock block))updateCons;

@end

@interface UITableView (Masonry)

-(UITableView * (^)(ConstraintBlock block))makeCons;

-(UITableView * (^)(ConstraintBlock block))reMakeCons;

-(UITableView * (^)(ConstraintBlock block))updateCons;

@end

@interface UIButton (Masonry)

-(UIButton * (^)(ConstraintBlock block))makeCons;

-(UIButton * (^)(ConstraintBlock block))reMakeCons;

-(UIButton * (^)(ConstraintBlock block))updateCons;

@end

@interface UICollectionView (Masonry)

-(UICollectionView * (^)(ConstraintBlock block))makeCons;

-(UICollectionView * (^)(ConstraintBlock block))reMakeCons;

-(UICollectionView * (^)(ConstraintBlock block))updateCons;

@end


