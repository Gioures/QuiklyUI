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
@property (nonatomic, copy) B numberOfSectionsInCollectionViewBlock;
@property (nonatomic, copy) UICollectionReusableView * (^headfootBlock)(BOOL head,NSIndexPath *indexPath);
@property (nonatomic, copy) void(^didselectBlock)(NSIndexPath *indexPath);
@end

@implementation UICollectionView (Quick)
@dynamic numberOfItemsInSectionBlock;
@dynamic cellForItemAtIndexPathBlock;
@dynamic numberOfSectionsInCollectionViewBlock;
@dynamic headfootBlock;
@dynamic didselectBlock;

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


/**
 在init实例化之后暂存所有属性的参数block实现

 @param frame 实例化frame
 @param layout 实例化layout
 @return 实例化之后的collectionView
 */
-(instancetype)initPublicBlockWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout{
    self = [self initPublicBlockWithFrame:frame collectionViewLayout:layout];
    __weak typeof(self)wk = self;
    
    self.cellForItemAtIndexPath = ^UICollectionView * _Nonnull(UICollectionViewCell * _Nonnull (^ _Nonnull cell)(NSIndexPath * _Nonnull)) {
        wk.cellForItemAtIndexPathBlock = cell;
        return wk;
    };
    
    self.regist = ^UICollectionView * _Nonnull(BOOL isNib, Class  _Nonnull __unsafe_unretained cellClass) {
        if (isNib) {
            [wk registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
        }else{
            [wk registerClass:cellClass forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
        }
        return wk;
    };
    
    self.registHeadView = ^UICollectionView * _Nonnull(BOOL isNib, BOOL ishead, Class  _Nonnull __unsafe_unretained cellClass) {
        NSString * string = ishead?UICollectionElementKindSectionHeader:UICollectionElementKindSectionFooter;
        if (isNib) {
            [wk registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:string withReuseIdentifier:NSStringFromClass(cellClass)];
        }else{
            [wk registerClass:cellClass forSupplementaryViewOfKind:string withReuseIdentifier:NSStringFromClass(cellClass)];
        }
        return wk;
    };
    
    self.numberOfItemsInSection = ^UICollectionView * _Nonnull(NSInteger (^ _Nonnull blc)(NSInteger)) {
        wk.numberOfItemsInSectionBlock = blc;
        return wk;
    };
    
    self.numberOfSectionsInCollectionView = ^UICollectionView * _Nonnull(B  _Nonnull blc) {
        wk.numberOfSectionsInCollectionViewBlock = blc;
        return wk;
    };
    
    self.viewForHeadOrFoot = ^UICollectionView * _Nonnull(UICollectionReusableView * _Nonnull (^ _Nonnull blc)(BOOL, NSIndexPath * _Nonnull)) {
        wk.headfootBlock = blc;
        return wk;
    };
    
    self.didSelectAtIndex = ^UICollectionView * _Nonnull(void (^ _Nonnull blc)(NSIndexPath * _Nonnull)) {
        wk.didselectBlock = blc;
        return wk;
    };
    
    return self;
    
}




// MARK: -- 属性

-(void)setDidselectBlock:(void (^)(NSIndexPath *))didselectBlock{
      objc_setAssociatedObject(self, @selector(didselectBlock), didselectBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void (^)(NSIndexPath *))didselectBlock{
     return objc_getAssociatedObject(self, @selector(didselectBlock));
}

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

-(void)setCellForItemAtIndexPath:(UICollectionView * _Nonnull (^)(UICollectionViewCell * _Nonnull (^ _Nonnull)(NSIndexPath * _Nonnull)))cellForItemAtIndexPath{
    objc_setAssociatedObject(self, @selector(cellForItemAtIndexPath), cellForItemAtIndexPath, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UICollectionView * _Nonnull (^)(UICollectionViewCell * _Nonnull (^ _Nonnull)(NSIndexPath * _Nonnull)))cellForItemAtIndexPath{
    return objc_getAssociatedObject(self, @selector(cellForItemAtIndexPath));
}

-(void)setRegist:(UICollectionView * _Nonnull (^)(BOOL, Class  _Nonnull __unsafe_unretained))regist{
    objc_setAssociatedObject(self, @selector(regist), regist, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UICollectionView * _Nonnull (^)(BOOL, Class  _Nonnull __unsafe_unretained))regist{
    return objc_getAssociatedObject(self, @selector(regist));
}

-(void)setRegistHeadView:(UICollectionView * _Nonnull (^)(BOOL, BOOL, Class  _Nonnull __unsafe_unretained))registHeadView{
    objc_setAssociatedObject(self, @selector(registHeadView), registHeadView, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UICollectionView * _Nonnull (^)(BOOL, BOOL, Class  _Nonnull __unsafe_unretained))registHeadView{
    return objc_getAssociatedObject(self, @selector(registHeadView));
}

-(void)setNumberOfItemsInSection:(UICollectionView * _Nonnull (^)(NSInteger (^ _Nonnull)(NSInteger)))numberOfItemsInSection{
    objc_setAssociatedObject(self, @selector(numberOfItemsInSection), numberOfItemsInSection, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UICollectionView * _Nonnull (^)(NSInteger (^ _Nonnull)(NSInteger)))numberOfItemsInSection{
    return objc_getAssociatedObject(self, @selector(numberOfItemsInSection));
}

-(void)setNumberOfSectionsInCollectionViewBlock:(NSInteger (^)(void))numberOfSectionsInCollectionViewBlock{
    objc_setAssociatedObject(self, @selector(numberOfSectionsInCollectionViewBlock), numberOfSectionsInCollectionViewBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSInteger (^)(void))numberOfSectionsInCollectionViewBlock{
    return objc_getAssociatedObject(self, @selector(numberOfSectionsInCollectionViewBlock));
}

-(void)setNumberOfSectionsInCollectionView:(UICollectionView * _Nonnull (^)(B _Nonnull))numberOfSectionsInCollectionView{
    objc_setAssociatedObject(self, @selector(numberOfSectionsInCollectionView), numberOfSectionsInCollectionView, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UICollectionView * _Nonnull (^)(B _Nonnull))numberOfSectionsInCollectionView{
    return objc_getAssociatedObject(self, @selector(numberOfSectionsInCollectionView));
}

-(void)setHeadfootBlock:(UICollectionReusableView *(^)(BOOL, NSIndexPath *))headfootBlock{
    objc_setAssociatedObject(self, @selector(headfootBlock), headfootBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UICollectionReusableView *(^)(BOOL, NSIndexPath *))headfootBlock{
     return objc_getAssociatedObject(self, @selector(headfootBlock));
}

-(void)setViewForHeadOrFoot:(UICollectionView * _Nonnull (^)(UICollectionReusableView * _Nonnull (^ _Nonnull)(BOOL, NSIndexPath * _Nonnull)))viewForHeadOrFoot{
    objc_setAssociatedObject(self, @selector(viewForHeadOrFoot), viewForHeadOrFoot, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UICollectionView * _Nonnull (^)(UICollectionReusableView * _Nonnull (^ _Nonnull)(BOOL, NSIndexPath * _Nonnull)))viewForHeadOrFoot{
    return objc_getAssociatedObject(self, @selector(viewForHeadOrFoot));
}

-(void)setDidSelectAtIndex:(UICollectionView * _Nonnull (^)(void (^ _Nonnull)(NSIndexPath * _Nonnull)))didSelectAtIndex{
    objc_setAssociatedObject(self, @selector(didSelectAtIndex), didSelectAtIndex, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UICollectionView * _Nonnull (^)(void (^ _Nonnull)(NSIndexPath * _Nonnull)))didSelectAtIndex{
    return objc_getAssociatedObject(self, @selector(didSelectAtIndex));
}

-(UICollectionView *)delegateA{
    self.delegate = self;
    self.dataSource = self;
    return self;
}



#pragma mark 方法
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



#pragma mark ------ UICollectionViewDataSource
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
    return 0;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (self.numberOfSectionsInCollectionViewBlock) {
        return self.numberOfSectionsInCollectionViewBlock();
    }
    return 0;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        if (self.headfootBlock) {
            return self.headfootBlock(YES,indexPath);
        }
    }else{
        if (self.headfootBlock) {
            return self.headfootBlock(NO,indexPath);
        }
    }
    return nil;
}

#pragma mark ------ UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if (self.didselectBlock) {
        self.didselectBlock(indexPath);
    }
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

-(void)dealloc{
    NSLog(@"collectionView释放");
}
@end
