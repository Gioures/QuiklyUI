//
//  UITableView+Quick.m
//  QuickUI
//
//  Created by 段庆烨 on 2019/4/27.
//  Copyright © 2019年 Gioures. All rights reserved.
//

#import "UITableView+Quick.h"
#import <objc/runtime.h>


@implementation UITableView (Quick)


#pragma mark 相关属性设置

-(void)setSectionNum:(NSInteger)sectionNum{
    objc_setAssociatedObject(self, @selector(sectionNum), @(sectionNum), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSInteger)sectionNum{
    return [objc_getAssociatedObject(self, @selector(sectionNum)) integerValue];
}

-(void)setRowNum:(NSDictionary<NSNumber *,NSNumber *> *)rowNum{
    objc_setAssociatedObject(self, @selector(rowNum), rowNum, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSDictionary<NSNumber *,NSNumber *> *)rowNum{
    return (NSDictionary<NSNumber *,NSNumber *> *)objc_getAssociatedObject(self, @selector(rowNum));
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

#pragma mark 相关方法

-(UITableView *(^)(UIEdgeInsets))insets{
    __weak typeof(self) wk = self;
    return ^(UIEdgeInsets insets){
        __strong typeof(wk) self = wk;
        self.contentInset = insets;
        return self;
        
    };
}


-(UITableView *(^)(UITableViewCellSeparatorStyle))bottemLineStyle{
    return ^(UITableViewCellSeparatorStyle style){
        [self setSeparatorStyle:style];
        return self;
    };
}

-(UITableView *(^)(UIColor *))bottemLineColor{
    return ^(UIColor *color){
        [self setSeparatorColor:color];
        return self;
    };
}

-(UITableView *(^)(UIEdgeInsets))bottemLineInsets{
    return ^(UIEdgeInsets insets){
        [self setSeparatorInset:insets];
        return self;
    };
}

-(UITableView *(^)(void))reload{
    return ^{
        [self reloadData];
        return self;
    };
}

-(UITableView *(^)(void))beginReload{
    return ^{
        [self beginUpdates];
        return self;
    };
}

-(UITableView *(^)(void))endReload{
    return ^{
        [self endUpdates];
        return self;
    };
}


-(UITableView *(^)(BOOL, __unsafe_unretained Class, NSString *))registCell{
    return ^(BOOL fromNib,Class cellClass,NSString* identifier){
        if (fromNib) {
            [self registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:identifier];
        }else{
            [self registerClass:cellClass forCellReuseIdentifier:identifier];
        }
        return self;
    };
}

-(UITableView *(^)(BOOL, __unsafe_unretained Class, NSString *))registHead{
    return ^(BOOL fromNib,Class cellClass,NSString* identifier){
        if (fromNib) {
            [self registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:[NSBundle mainBundle]] forHeaderFooterViewReuseIdentifier:identifier];
        }else{
            [self registerClass:cellClass forHeaderFooterViewReuseIdentifier:identifier];
        }
        return self;
    };
}


-(UITableView *(^)(NSInteger))setNumOfSection{
    __weak typeof(self) wk = self;
    return ^(NSInteger i){
        __strong typeof(wk) self = wk;
        self.sectionNum = i;
        return self;
    };
}

-(UITableView *(^)(NSDictionary<NSNumber *,NSNumber *> * dic))setRowNumInSection{
    __weak typeof(self) wk = self;
    return ^(NSDictionary<NSNumber *,NSNumber *> * dic){
        __strong typeof(wk) self = wk;
        self.rowNum = dic;
        return self;
    };
}



-(UITableView *(^)(UITableViewCell *(^)(NSIndexPath *)))setCellForIndexPath{
    __weak typeof(self) wk = self;
    return ^(UITableViewCell*(^cellCallBack)(NSIndexPath *)){
        __strong typeof(wk) self = wk;
        self.cellBlock = cellCallBack;
        return self;
    };
}

-(UITableView *(^)(CGFloat (^)(NSIndexPath *)))setRowHeightForIndex{
    __weak typeof(self) wk = self;
    return ^(CGFloat(^z)(NSIndexPath *)){
        __strong typeof(wk) self = wk;
        self.cellHeight = z;
        return self;
    };
}

-(UITableView *(^)(void (^)(NSIndexPath *)))setSelectActionForIndex{
    __weak typeof(self) wk = self;
    return ^(void (^block)(NSIndexPath *)){
        __strong typeof(wk) self = wk;
        self.selectBlock = block;
        return self;
    };
}

-(UITableView *(^)(BOOL (^)(NSIndexPath *)))setShouldHighlightRowAtIndex{
    __weak typeof(self) wk = self;
    return ^(BOOL (^z)(NSIndexPath *)){
        __strong typeof(wk) self = wk;
        self.shouldHightlit = z;
        return self;
    };
}

-(UITableView *(^)(void))setDelegateAndDataSource{
    __weak typeof(self) wk = self;
    return ^{
        __strong typeof(wk) self = wk;
        self.dataSource = self;
        self.delegate = self;
        return self;
    };
}

-(UITableView *(^)(CGFloat (^)(NSInteger)))setSectionHeadHeight{
    __weak typeof(self) wk = self;
    return ^(CGFloat (^blc)(NSInteger)){
        __strong typeof(wk) self = wk;
        self.heightForHeaderInSectionBlock = blc;
        return self;
    };
}

-(UITableView *(^)(CGFloat (^)(NSInteger)))setSectionFootHeight{
    __weak typeof(self) wk = self;
    return ^(CGFloat (^blc)(NSInteger)){
        __strong typeof(wk) self = wk;
        self.heightForFooterInSectionBlock = blc;
        return self;
    };
}

-(UITableView *(^)(UIView* (^)(NSInteger)))setSectionFootView{
    __weak typeof(self) wk = self;
    return ^(UIView* (^blc)(NSInteger)){
        __strong typeof(wk) self = wk;
        self.viewForFooterInSectionBlock = blc;
        return self;
    };
}

-(UITableView *(^)(UIView* (^)(NSInteger)))setSectionHeadView{
    __weak typeof(self) wk = self;
    return ^(UIView* (^blc)(NSInteger)){
        __strong typeof(wk) self = wk;
        self.viewForHeaderInSectionBlock = blc;
        return self;
    };
}

-(UITableView *(^)(BOOL (^)(NSIndexPath *)))setCanEditForIndex{
    __weak typeof(self) wk = self;
    return ^(BOOL (^blc)(NSIndexPath*)){
        __strong typeof(wk) self = wk;
        self.canEditRowAtIndexPathBlock = blc;
        return self;
    };
}

-(UITableView *(^)(void (^)(UITableViewCellEditingStyle, NSIndexPath *)))setCommitEditStyleForIndex{
    __weak typeof(self) wk = self;
    return ^(void (^blc)(UITableViewCellEditingStyle, NSIndexPath *)){
        __strong typeof(wk) self = wk;
        self.commitEditingForRowAtIndexPathBlock = blc;
        return self;
    };
}

-(UITableView *(^)(NSString *(^)(NSIndexPath *)))setEditTextForIndex{
    __weak typeof(self) wk = self;
    return ^(NSString * (^blc)(NSIndexPath *)){
        __strong typeof(wk) self = wk;
        self.EditButtonTitleBlock = blc;
        return self;
    };
}


#pragma mark UITableViewDataSource && UITableViewDelegate
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return self.cellBlock(indexPath);
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    for (NSNumber * key in self.rowNum) {
        if (section == key.integerValue) {
            return [[self.rowNum objectForKey:key] integerValue];
        }
    }
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.sectionNum) {
        return self.sectionNum;
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
