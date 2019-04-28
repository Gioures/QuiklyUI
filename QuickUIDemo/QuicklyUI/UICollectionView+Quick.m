//
//  UICollectionView+Quick.m
//  QuickUIDemo
//
//  Created by 段庆烨 on 2019/4/27.
//  Copyright © 2019年 段庆烨. All rights reserved.
//

#import "UICollectionView+Quick.h"

@implementation UICollectionView (Quick)

+(UICollectionView * _Nonnull (^)(void))collectionView{
    return ^{
        return [[UICollectionView alloc] init];
    };
}

-(UICollectionView * _Nonnull (^)(UICollectionViewLayout * _Nonnull))layout{
    return ^(UICollectionViewLayout *lay){
        self.collectionViewLayout = lay;
        return self;
    };
}

@end


@implementation UICollectionViewFlowLayout (Quick)



@end
