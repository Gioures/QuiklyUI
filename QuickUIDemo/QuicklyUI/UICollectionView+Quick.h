//
//  UICollectionView+Quick.h
//  QuickUIDemo
//
//  Created by 段庆烨 on 2019/4/27.
//  Copyright © 2019年 段庆烨. All rights reserved.
//

#import <UIKit/UIKit.h>
#define CollectionView(x,y) UICollectionView.collectionView(x,y)
#define Layout [UICollectionViewFlowLayout new]

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (Quick)
@property (nonatomic, strong , readonly) UICollectionView * delegateA;
@property (nonatomic, copy) UICollectionView*(^cellP )( UICollectionViewCell* (^cell)(NSIndexPath *index));




+(UICollectionView * (^)(CGRect frame,UICollectionViewLayout *layout))collectionView;

-(UICollectionView * (^)(UICollectionViewLayout *))layout;

#pragma mark ------ 代理方法
-(UICollectionView * (^)(NSInteger (^)(NSInteger)))numberOfItemsInSectionA;

-(UICollectionView * (^)(UICollectionViewCell *(^)(NSIndexPath*)))cellForItemAtIndexPathA;

#pragma mark UIView公共方法 不需要实现
+(UICollectionView * (^)(void))loadFromNib;

-(UICollectionView * (^)(float x , float y , float w, float h))fram;

-(UICollectionView * (^)(BOOL enable))able;

-(UICollectionView * (^)(BOOL hid))hid;

-(UICollectionView * (^)(float x,float y))cent;

-(UICollectionView * (^)(float w, float h))bds;

-(UICollectionView * (^)(BOOL clip))clip;

-(UICollectionView *(^)(UIView * v))addOn;

-(UICollectionView *(^)(UIColor * c))bg;

-(UICollectionView * (^)(float w))corner;

-(UICollectionView * (^)(float w))borderW;

-(UICollectionView * (^)(UIColor * w))borderC;

-(UICollectionView * (^)(int w))tags;
@end

@interface UICollectionViewFlowLayout (Quick)

-  (UICollectionViewFlowLayout*(^)(CGFloat space))minimumLineSpacingA;

- (UICollectionViewFlowLayout*(^)(CGFloat space))minimumInteritemSpacingA;

- (UICollectionViewFlowLayout*(^)(float w,float h))itemSizeA;

- (UICollectionViewFlowLayout*(^)(UICollectionViewScrollDirection))scrollDirectionA;

- (UICollectionViewFlowLayout*(^)(CGFloat top,CGFloat left,CGFloat bottem , CGFloat right))sectionInsetA;
@end

NS_ASSUME_NONNULL_END
