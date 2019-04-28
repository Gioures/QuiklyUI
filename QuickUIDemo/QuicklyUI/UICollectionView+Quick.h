//
//  UICollectionView+Quick.h
//  QuickUIDemo
//
//  Created by 段庆烨 on 2019/4/27.
//  Copyright © 2019年 段庆烨. All rights reserved.
//

#import <UIKit/UIKit.h>
#define CollectionView(fram,layout) UICollectionView.collectionView(fram,layout)
#define Layout [UICollectionViewFlowLayout new]

NS_ASSUME_NONNULL_BEGIN

typedef NSInteger(^B)(void);

@interface UICollectionView (Quick)

/**
 设置代理
 */
@property (nonatomic, strong , readonly) UICollectionView * delegateA;

/**
 cell的代理方法
 */
@property (nonatomic, copy) UICollectionView*(^cellForItemAtIndexPath)(UICollectionViewCell* (^cell)(NSIndexPath *index));

@property (nonatomic, copy) UICollectionView*(^numberOfItemsInSection)(NSInteger (^blc)(NSInteger section));

@property (nonatomic, copy) UICollectionView*(^numberOfSectionsInCollectionView)(B blc);

/**
 注册Cell isNib：从xib拉取写YES，其他写NO，cellClass：类名
 */
@property (nonatomic , copy) UICollectionView*(^regist)(BOOL isNib,Class cellClass);

/**
 注册head/foot
 */
@property (nonatomic , copy) UICollectionView*(^registHeadView)(BOOL isNib,BOOL ishead,Class cellClass);





#pragma mark 方法
/**
 从frame和layout实例化
 */
+(UICollectionView * (^)(CGRect frame,UICollectionViewLayout *layout))collectionView;

/**
 设置layout
 */
-(UICollectionView * (^)(UICollectionViewLayout *))layout;

#pragma mark ------ 数据代理方法
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
