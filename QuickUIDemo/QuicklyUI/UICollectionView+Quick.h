//
//  UICollectionView+Quick.h
//  QuickUIDemo
//
//  Created by 段庆烨 on 2019/4/27.
//  Copyright © 2019年 段庆烨. All rights reserved.
//

#import <UIKit/UIKit.h>
#define CollectionView UICollectionView.CollectionView()
#define ColletionLayout [[UICollectionViewFlowLayout alloc] init]
NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (Quick)

+(UICollectionView * (^)(void))collectionView;

-(UICollectionView * (^)(UICollectionViewLayout *))layout;

@end

@interface UICollectionViewFlowLayout (Quick)



@end

NS_ASSUME_NONNULL_END
