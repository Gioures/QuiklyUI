//
//  UICollectionView+Quick.m
//  QuickUIDemo
//
//  Created by 段庆烨 on 2019/4/27.
//  Copyright © 2019年 段庆烨. All rights reserved.
//

#import "UICollectionView+Quick.h"
#import "objc/runtime.h"

@interface UICollectionView (Quick)<UICollectionViewDelegate , UICollectionViewDataSource>
@property (nonatomic, copy) NSInteger (^numberOfItemsInSectionBlock)(NSInteger section);
@property (nonatomic, copy) UICollectionViewCell* (^cellForItemAtIndexPathBlock)(NSIndexPath *index);
@end

@implementation UICollectionView (Quick)
@dynamic numberOfItemsInSectionBlock;
@dynamic cellForItemAtIndexPathBlock;


+(UICollectionView * _Nonnull (^)(CGRect frame,UICollectionViewLayout *layout))collectionView{
    return ^(CGRect frame,UICollectionViewLayout *layout){
        return [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    };
}

+(void)load{
    Method m1 = class_getInstanceMethod([self class], @selector(initPublicBlockWithFrame:collectionViewLayout:));
    Method m2 = class_getInstanceMethod([self class],@selector(initWithFrame:collectionViewLayout:));
    method_exchangeImplementations(m1, m2);
}

-(instancetype)initPublicBlockWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout{
    self = [self initPublicBlockWithFrame:frame collectionViewLayout:layout];
    __weak typeof(self)wk = self;
   self.cellP = ^UICollectionView * _Nonnull(UICollectionViewCell * _Nonnull (^ _Nonnull cell)(NSIndexPath * _Nonnull)) {
        wk.cellForItemAtIndexPathBlock = cell;
        return wk;
    };
    return self;
    
}




// MARK: -- 属性

-(void)setNumberOfItemsInSectionBlock:(NSInteger (^)(NSInteger))numberOfItemsInSectionBlock{
    objc_setAssociatedObject(self, @selector(numberOfItemsInSectionBlock), numberOfItemsInSectionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSInteger (^)(NSInteger))numberOfItemsInSectionBlock{
    return objc_getAssociatedObject(self, @selector(numberOfItemsInSectionBlock));
}

-(void)setCellForItemAtIndexPathBlock:(UICollectionViewCell * _Nonnull (^)(NSIndexPath * _Nonnull))cellForItemAtIndexPathBlock{
    objc_setAssociatedObject(self, @selector(cellForItemAtIndexPathBlock), cellForItemAtIndexPathBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UICollectionViewCell * _Nonnull (^)(NSIndexPath * _Nonnull))cellForItemAtIndexPathBlock{
    return objc_getAssociatedObject(self, @selector(cellForItemAtIndexPathBlock));
}

-(void)setCellP:(UICollectionView * _Nonnull (^)(UICollectionViewCell * _Nonnull (^ _Nonnull)(NSIndexPath * _Nonnull)))cellP{
    objc_setAssociatedObject(self, @selector(cellP), cellP, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UICollectionView * _Nonnull (^)(UICollectionViewCell * _Nonnull (^ _Nonnull)(NSIndexPath * _Nonnull)))cellP{
    return objc_getAssociatedObject(self, @selector(cellP));
}

-(UICollectionView *)delegateA{
    self.delegate = self;
    self.dataSource = self;
    return self;
}
//----

-(UICollectionView * _Nonnull (^)(UICollectionViewLayout * _Nonnull))layout{
    return ^(UICollectionViewLayout *lay){
        self.collectionViewLayout = lay;
        return self;
    };
}

-(UICollectionView * _Nonnull (^)(NSInteger (^)(NSInteger)))numberOfItemsInSectionA{
    return ^(NSInteger(^block)(NSInteger )){
        self.numberOfItemsInSectionBlock = block;
        return self;
    };
}

-(UICollectionView * _Nonnull (^)(UICollectionViewCell * _Nonnull (^ _Nonnull)(NSIndexPath * _Nonnull)))cellForItemAtIndexPathA{
    return ^(UICollectionViewCell*(^blc)(NSIndexPath *)){
        self.cellForItemAtIndexPathBlock = blc;
        return self;
    };
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (self.cellForItemAtIndexPathBlock) {
        return self.cellForItemAtIndexPathBlock(indexPath);
    }
    return nil;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.numberOfItemsInSectionBlock) {
        return self.numberOfItemsInSectionBlock(section);
    }
    return 10;
}



@end

// MARK: -- UICollectionViewFlowLayout
@implementation UICollectionViewFlowLayout (Quick)

-(UICollectionViewFlowLayout * _Nonnull (^)(CGFloat))minimumLineSpacingA{
    return ^(CGFloat z){
        self.minimumLineSpacing = z;
        return self;
    };
}

-(UICollectionViewFlowLayout * _Nonnull (^)(CGFloat))minimumInteritemSpacingA{
    return ^(CGFloat z){
        [self setMinimumInteritemSpacing:z];
        return self;
    };
}

-(UICollectionViewFlowLayout * _Nonnull (^)(float, float))itemSizeA{
    return ^(float a,float b){
        [self setItemSize:CGSizeMake(a, b)];
        return self;
    };
}

-(UICollectionViewFlowLayout * _Nonnull (^)(UICollectionViewScrollDirection))scrollDirectionA{
    return ^(UICollectionViewScrollDirection z){
        [self setScrollDirection:z];
        return self;
    };
}

-(UICollectionViewFlowLayout * _Nonnull (^)(CGFloat, CGFloat, CGFloat, CGFloat))sectionInsetA{
    return ^(CGFloat a,CGFloat b,CGFloat c,CGFloat d){
        [self setSectionInset:UIEdgeInsetsMake(a, b, c, d)];
        return self;
    };
}
@end
