//
//  UITableView+Quick.m
//  QuickUI
//
//  Created by 段庆烨 on 2019/4/27.
//  Copyright © 2019年 Gioures. All rights reserved.
//
#define WeakSelf  __weak typeof(self) wk = self;
#import "UITableView+Quick.h"
#import <objc/runtime.h>
@interface UITableView (Quick)<UITableViewDelegate , UITableViewDataSource>


@property (nonatomic, copy) NSInteger (^sectionNumBlock)(void);
@property (nonatomic, copy) NSInteger (^rowNumBlock)(NSInteger section);
@property (nonatomic , copy) UITableViewCell * (^cellBlock)(NSIndexPath*indexPath);
@property (nonatomic , copy) CGFloat (^cellHeight)(NSIndexPath* indexPath);
@property (nonatomic , copy) void (^selectBlock)(NSIndexPath* indexPath);
@property (nonatomic , copy) BOOL (^shouldHightlit)(NSIndexPath* indexPath);
@property (nonatomic , copy) CGFloat (^heightForHeaderInSectionBlock)(NSInteger section);
@property (nonatomic , copy) CGFloat (^heightForFooterInSectionBlock)(NSInteger section);
@property (nonatomic , copy , nullable) UIView* (^viewForHeaderInSectionBlock)(NSInteger section);
@property (nonatomic , copy) UIView* (^viewForFooterInSectionBlock)(NSInteger section);
@property (nonatomic , copy , nullable) BOOL (^canEditRowAtIndexPathBlock)(NSIndexPath* indexPath);
@property (nonatomic , copy) void (^commitEditingForRowAtIndexPathBlock)(UITableViewCellEditingStyle style,NSIndexPath* indexPath);
@property (nonatomic , copy) NSString* (^EditButtonTitleBlock)(NSIndexPath* indexPath);
@end

@implementation UITableView (Quick)


#pragma mark 相关属性设置


+(void)load{
    Method m1 = class_getInstanceMethod([self class], @selector(initWithFrame:style:));
    Method m2 = class_getInstanceMethod([self class], @selector(initWithQuickFrame:style:));
    method_exchangeImplementations(m1, m2);
}

-(instancetype)initWithQuickFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [self initWithQuickFrame:frame style:style];
    WeakSelf
    
    self.insets = ^UITableView *(UIEdgeInsets insets) {
        [wk setContentInset:insets];
        return wk;
    };
    
    self.bottemLineColor = ^UITableView *(UIColor *color) {
        [wk setSeparatorColor:color];
        return wk;
    };
    
    self.bottemLineStyle = ^UITableView *(UITableViewCellSeparatorStyle style) {
        [wk setSeparatorStyle:style];
        return wk;
    };
    
    self.bottemLineInsets = ^UITableView *(UIEdgeInsets insets) {
        [wk setSeparatorInset:insets];
        return wk;
    };
    
    self.regist = ^UITableView *(BOOL fromNib, __unsafe_unretained Class cellClass, NSString *identifier) {
        if (fromNib) {
            if (identifier) {
                [wk registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:identifier];
            }else{
                [wk registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass(cellClass)];
            }
        }else{
            if (identifier) {
                [wk registerClass:cellClass  forCellReuseIdentifier:identifier];
            }else{
                [wk registerClass:cellClass  forCellReuseIdentifier:NSStringFromClass(cellClass)];
            }
        }
        return wk;
    };
    
    self.numberOfSectionsA = ^UITableView *(NSInteger (^blc)(void)) {
        wk.sectionNumBlock = blc;
        return wk;
    };
    
    self.numberOfRowsInSectionA = ^UITableView *(NSInteger (^blc)(NSInteger section)) {
        wk.rowNumBlock = blc;
        return wk;
    };
    
    self.cell = ^UITableView *(UITableViewCell * (^blc)(NSIndexPath *indexPath)) {
        wk.cellBlock = blc;
        return wk;
    };
    
    self.heightForRowA = ^UITableView *(CGFloat (^blc)(NSIndexPath *indexPath)) {
        wk.cellHeight = blc;
        return wk;
    };
    
    self.didSelectRowAtIndexPathA = ^UITableView *(void (^blc)(NSIndexPath *indexPath)) {
        wk.selectBlock = blc;
        return wk;
    };
    
    self.shouldHighlightRowAtIndexPathA = ^UITableView *(BOOL (^blc)(NSIndexPath *indexPath)) {
        wk.shouldHightlit = blc;
        return wk;
    };
    
    self.heightForHeaderInSectionA = ^UITableView *(CGFloat (^blc)(NSInteger section)) {
        wk.heightForHeaderInSectionBlock = blc;
        return wk;
    };
    
    self.heightForFooterInSectionA = ^UITableView *(CGFloat (^blc)(NSInteger section)) {
        wk.heightForFooterInSectionBlock = blc;
        return wk;
    };
    
    self.viewForHeaderInSectionA = ^UITableView *(UIView * (^blc)(NSInteger section)) {
        wk.viewForHeaderInSectionBlock = blc;
        return wk;
    };
    
    self.viewForFooterInSectionA = ^UITableView *(UIView * (^blc)(NSInteger section)) {
        wk.viewForFooterInSectionBlock = blc;
        return wk;
    };
    
    self.canEditRowAtIndexPathA = ^UITableView *(BOOL (^blc)(NSIndexPath *indexPath)) {
        wk.canEditRowAtIndexPathBlock = blc;
        return wk;
    };
    
    self.commitEditingStyleForIndexPathA = ^UITableView *(void (^blc)(UITableViewCellEditingStyle style, NSIndexPath *indexPath)) {
        wk.commitEditingForRowAtIndexPathBlock = blc;
        return wk;
    };
    
    self.editTextForIndexA = ^UITableView *(NSString * (^blc)(NSIndexPath *indexPath)) {
        wk.EditButtonTitleBlock = blc;
        return wk;
    };
    
    return self;
}

-(void)setSectionNumBlock:(NSInteger (^)(void))sectionNumBlock{
    objc_setAssociatedObject(self, @selector(sectionNumBlock), sectionNumBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSInteger (^)(void))sectionNumBlock{
    return objc_getAssociatedObject(self, @selector(sectionNumBlock));
}

-(void)setRowNumBlock:(NSInteger (^)(NSInteger))rowNumBlock{
     objc_setAssociatedObject(self, @selector(rowNumBlock), rowNumBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSInteger (^)(NSInteger))rowNumBlock{
    return objc_getAssociatedObject(self, @selector(rowNumBlock));
}

-(void)setCellBlock:(UITableViewCell *(^)(NSIndexPath *))cellBlock{
    objc_setAssociatedObject(self, @selector(cellBlock), cellBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UITableViewCell *(^)(NSIndexPath *))cellBlock{
    return objc_getAssociatedObject(self, @selector(cellBlock));
}

-(void)setCellHeight:(CGFloat (^)(NSIndexPath *))cellHeight{
    objc_setAssociatedObject(self, @selector(cellHeight), cellHeight, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(CGFloat (^)(NSIndexPath *))cellHeight{
    return objc_getAssociatedObject(self, @selector(cellHeight));
}

-(void)setSelectBlock:(void (^)(NSIndexPath *))selectBlock{
        objc_setAssociatedObject(self, @selector(selectBlock), selectBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void (^)(NSIndexPath *))selectBlock{
    return objc_getAssociatedObject(self, @selector(selectBlock));
}

-(void)setShouldHightlit:(BOOL (^)(NSIndexPath *))shouldHightlit{
    objc_setAssociatedObject(self, @selector(shouldHightlit), shouldHightlit, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(BOOL (^)(NSIndexPath *))shouldHightlit{
    return objc_getAssociatedObject(self, @selector(shouldHightlit));
}

-(void)setHeightForHeaderInSectionBlock:(CGFloat (^)(NSInteger))heightForHeaderInSectionBlock{
    objc_setAssociatedObject(self, @selector(heightForHeaderInSectionBlock), heightForHeaderInSectionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(CGFloat (^)(NSInteger))heightForHeaderInSectionBlock{
    return objc_getAssociatedObject(self, @selector(heightForHeaderInSectionBlock));
}

-(void)setHeightForFooterInSectionBlock:(CGFloat (^)(NSInteger))heightForFooterInSectionBlock{
    objc_setAssociatedObject(self, @selector(heightForFooterInSectionBlock), heightForFooterInSectionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(CGFloat (^)(NSInteger))heightForFooterInSectionBlock{
    return objc_getAssociatedObject(self, @selector(heightForFooterInSectionBlock));
}

-(void)setViewForHeaderInSectionBlock:(UIView *(^)(NSInteger))viewForHeaderInSectionBlock{
    objc_setAssociatedObject(self, @selector(viewForHeaderInSectionBlock), viewForHeaderInSectionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UIView *(^)(NSInteger))viewForHeaderInSectionBlock{
    return objc_getAssociatedObject(self, @selector(viewForHeaderInSectionBlock));
}

-(void)setViewForFooterInSectionBlock:(UIView *(^)(NSInteger))viewForFooterInSectionBlock{
    objc_setAssociatedObject(self, @selector(viewForFooterInSectionBlock), viewForFooterInSectionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UIView *(^)(NSInteger))viewForFooterInSectionBlock{
    return objc_getAssociatedObject(self, @selector(viewForFooterInSectionBlock));
}

-(void)setCanEditRowAtIndexPathBlock:(BOOL (^)(NSIndexPath *))canEditRowAtIndexPathBlock{
    objc_setAssociatedObject(self, @selector(canEditRowAtIndexPathBlock), canEditRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(BOOL (^)(NSIndexPath *))canEditRowAtIndexPathBlock{
    return objc_getAssociatedObject(self, @selector(canEditRowAtIndexPathBlock));
}

-(void)setCommitEditingForRowAtIndexPathBlock:(void (^)(UITableViewCellEditingStyle, NSIndexPath *))commitEditingForRowAtIndexPathBlock{
    objc_setAssociatedObject(self, @selector(commitEditingForRowAtIndexPathBlock), commitEditingForRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void (^)(UITableViewCellEditingStyle, NSIndexPath *))commitEditingForRowAtIndexPathBlock{
    return objc_getAssociatedObject(self, @selector(commitEditingForRowAtIndexPathBlock));
}

-(void)setEditButtonTitleBlock:(NSString *(^)(NSIndexPath *))EditButtonTitleBlock{
    objc_setAssociatedObject(self, @selector(EditButtonTitleBlock), EditButtonTitleBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString *(^)(NSIndexPath *))EditButtonTitleBlock{
    return objc_getAssociatedObject(self, @selector(EditButtonTitleBlock));
}

#pragma mark ------ 外部调用的属性

-(void)setInsets:(UITableView *(^)(UIEdgeInsets))insets{
    objc_setAssociatedObject(self, @selector(insets), insets, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UITableView *(^)(UIEdgeInsets))insets{
    return objc_getAssociatedObject(self, @selector(insets));
}

-(void)setBottemLineColor:(UITableView *(^)(UIColor *))bottemLineColor{
    objc_setAssociatedObject(self, @selector(bottemLineColor), bottemLineColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UITableView *(^)(UIColor *))bottemLineColor{
     return objc_getAssociatedObject(self, @selector(bottemLineColor));
}

-(void)setBottemLineStyle:(UITableView *(^)(UITableViewCellSeparatorStyle))bottemLineStyle{
    objc_setAssociatedObject(self, @selector(bottemLineStyle), bottemLineStyle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UITableView *(^)(UITableViewCellSeparatorStyle))bottemLineStyle{
    return objc_getAssociatedObject(self, @selector(bottemLineStyle));
}

-(void)setBottemLineInsets:(UITableView *(^)(UIEdgeInsets))bottemLineInsets{
    objc_setAssociatedObject(self, @selector(bottemLineInsets), bottemLineInsets, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UITableView *(^)(UIEdgeInsets))bottemLineInsets{
    return objc_getAssociatedObject(self, @selector(bottemLineInsets));
}

-(void)setNumberOfRowsInSectionA:(UITableView *(^)(NSInteger (^)(NSInteger)))numberOfRowsInSectionA{
    objc_setAssociatedObject(self, @selector(numberOfRowsInSectionA), numberOfRowsInSectionA, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UITableView *(^)(NSInteger (^)(NSInteger)))numberOfRowsInSectionA{
     return objc_getAssociatedObject(self, @selector(numberOfRowsInSectionA));
}

-(void)setShouldHighlightRowAtIndexPath:(UITableView *(^)(BOOL (^)(NSIndexPath *)))shouldHighlightRowAtIndexPath{
     objc_setAssociatedObject(self, @selector(shouldHighlightRowAtIndexPath), shouldHighlightRowAtIndexPath, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UITableView *(^)(BOOL (^)(NSIndexPath *)))shouldHighlightRowAtIndexPath{
    return objc_getAssociatedObject(self, @selector(shouldHighlightRowAtIndexPath));
}

-(UITableView *)delegateA{
    self.delegate = self;
    self.dataSource = self;
    return self;
}




-(UITableView *)beginload{
    [self beginUpdates];
    return self;
}

-(UITableView *)endload{
    [self endUpdates];
    return self;
}

-(void)setRegist:(UITableView *(^)(BOOL, __unsafe_unretained Class, NSString *))regist{
    objc_setAssociatedObject(self, @selector(regist), regist, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UITableView *(^)(BOOL, __unsafe_unretained Class, NSString *))regist{
    return objc_getAssociatedObject(self, @selector(regist));
}

-(void)setNumberOfSectionsA:(UITableView *(^)(NSInteger (^)(void)))numberOfSectionsA{
    objc_setAssociatedObject(self, @selector(numberOfSectionsA), numberOfSectionsA, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UITableView *(^)(NSInteger (^)(void)))numberOfSectionsA{
     return objc_getAssociatedObject(self, @selector(numberOfSectionsA));
}

-(void)setCell:(UITableView *(^)(UITableViewCell *(^)(NSIndexPath *)))cell{
    objc_setAssociatedObject(self, @selector(cell), cell, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UITableView *(^)(UITableViewCell *(^)(NSIndexPath *)))cell{
    return objc_getAssociatedObject(self, @selector(cell));
}

-(void)setHeightForRowA:(UITableView *(^)(CGFloat (^)(NSIndexPath *)))heightForRowA{
    objc_setAssociatedObject(self, @selector(heightForRowA), heightForRowA, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UITableView *(^)(CGFloat (^)(NSIndexPath *)))heightForRowA{
    return objc_getAssociatedObject(self, @selector(heightForRowA));
}

-(void)setDidSelectRowAtIndexPathA:(UITableView *(^)(void (^)(NSIndexPath *)))didSelectRowAtIndexPathA{
    objc_setAssociatedObject(self, @selector(didSelectRowAtIndexPathA), didSelectRowAtIndexPathA, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UITableView *(^)(void (^)(NSIndexPath *)))didSelectRowAtIndexPathA{
    return objc_getAssociatedObject(self, @selector(didSelectRowAtIndexPathA));
}

-(void)setShouldHighlightRowAtIndexPathA:(UITableView *(^)(BOOL (^)(NSIndexPath *)))shouldHighlightRowAtIndexPathA{
    objc_setAssociatedObject(self, @selector(shouldHighlightRowAtIndexPathA), shouldHighlightRowAtIndexPathA, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UITableView *(^)(BOOL (^)(NSIndexPath *)))shouldHighlightRowAtIndexPathA{
    return objc_getAssociatedObject(self, @selector(shouldHighlightRowAtIndexPathA));
}

-(void)setHeightForHeaderInSectionA:(UITableView *(^)(CGFloat (^)(NSInteger)))heightForHeaderInSectionA{
      objc_setAssociatedObject(self, @selector(heightForHeaderInSectionA), heightForHeaderInSectionA, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UITableView *(^)(CGFloat (^)(NSInteger)))heightForHeaderInSectionA{
    return objc_getAssociatedObject(self, @selector(heightForHeaderInSectionA));
}


-(void)setHeightForFooterInSectionA:(UITableView *(^)(CGFloat (^)(NSInteger)))heightForFooterInSectionA{
     objc_setAssociatedObject(self, @selector(heightForFooterInSectionA), heightForFooterInSectionA, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UITableView *(^)(CGFloat (^)(NSInteger)))heightForFooterInSectionA{
     return objc_getAssociatedObject(self, @selector(heightForFooterInSectionA));
}

-(void)setViewForHeaderInSectionA:(UITableView *(^)(UIView *(^)(NSInteger)))viewForHeaderInSectionA{
    objc_setAssociatedObject(self, @selector(viewForHeaderInSectionA), viewForHeaderInSectionA, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UITableView *(^)(UIView *(^)(NSInteger)))viewForHeaderInSectionA{
    return objc_getAssociatedObject(self, @selector(viewForHeaderInSectionA));
}

- (void)setViewForFooterInSectionA:(UITableView *(^)(UIView *(^)(NSInteger)))viewForFooterInSectionA{
    objc_setAssociatedObject(self, @selector(viewForFooterInSectionA), viewForFooterInSectionA, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UITableView *(^)(UIView *(^)(NSInteger)))viewForFooterInSectionA{
    return objc_getAssociatedObject(self, @selector(viewForFooterInSectionA));
}

- (void)setCanEditRowAtIndexPathA:(UITableView *(^)(BOOL (^)(NSIndexPath *)))canEditRowAtIndexPathA{
    objc_setAssociatedObject(self, @selector(canEditRowAtIndexPathA), canEditRowAtIndexPathA, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UITableView *(^)(BOOL (^)(NSIndexPath *)))canEditRowAtIndexPathA{
    return objc_getAssociatedObject(self, @selector(canEditRowAtIndexPathA));
}

- (void)setCommitEditingStyleForIndexPathA:(UITableView *(^)(void (^)(UITableViewCellEditingStyle, NSIndexPath *)))commitEditingStyleForIndexPathA{
    objc_setAssociatedObject(self, @selector(commitEditingStyleForIndexPathA), commitEditingStyleForIndexPathA, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UITableView *(^)(void (^)(UITableViewCellEditingStyle, NSIndexPath *)))commitEditingStyleForIndexPathA{
    return objc_getAssociatedObject(self, @selector(commitEditingStyleForIndexPathA));
}

- (void)setEditTextForIndexA:(UITableView *(^)(NSString *(^)(NSIndexPath *)))editTextForIndexA{
    objc_setAssociatedObject(self, @selector(editTextForIndexA), editTextForIndexA, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UITableView *(^)(NSString *(^)(NSIndexPath *)))editTextForIndexA{
    return objc_getAssociatedObject(self, @selector(editTextForIndexA));
}




#pragma mark  代理方法 UITableViewDataSource && UITableViewDelegate
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return self.cellBlock(indexPath);
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.rowNumBlock) {
        return self.rowNumBlock(section);
    }
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.sectionNumBlock) {
        return self.sectionNumBlock();
    };
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.cellHeight) {
        return self.cellHeight(indexPath);
    }
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self deselectRowAtIndexPath:indexPath animated:YES];
    if (self.selectBlock) {
        return self.selectBlock(indexPath);
    }
}

-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.shouldHightlit) {
        return self.shouldHightlit(indexPath);
    }
    return YES;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.heightForHeaderInSectionBlock) {
        return self.heightForHeaderInSectionBlock(section);
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (self.heightForFooterInSectionBlock) {
        return self.heightForFooterInSectionBlock(section);
    }
    
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.viewForHeaderInSectionBlock(section);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return self.viewForFooterInSectionBlock(section);
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.canEditRowAtIndexPathBlock) {
        return self.canEditRowAtIndexPathBlock(indexPath);
    }
    return self.isEditing;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.commitEditingForRowAtIndexPathBlock) {
        return self.commitEditingForRowAtIndexPathBlock(editingStyle,indexPath);
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.EditButtonTitleBlock) {
        return self.EditButtonTitleBlock(indexPath);
    }
    return nil;
}

-(void)dealloc{
    self.delegate = nil;
    self.dataSource = nil;
#if DEBUG
    NSLog(@"TableView 释放");
#endif

}
@end
