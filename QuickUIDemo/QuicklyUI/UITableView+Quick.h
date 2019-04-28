//
//  UITableView+Quick.h
//  QuickUI
//
//  Created by 段庆烨 on 2019/4/27.
//  Copyright © 2019年 Gioures. All rights reserved.
//

#import <UIKit/UIKit.h>
#define PlainTableView(x, y, w, h)  [[UITableView alloc] initWithFrame:CGRectMake(x, y, w, h) style:UITableViewStylePlain]
#define GroupTableView(x, y, w, h)  [[UITableView alloc] initWithFrame:CGRectMake(x, y, w, h) style:UITableViewStyleGrouped]

@interface UITableView (Quick)<UITableViewDelegate , UITableViewDataSource>
@property (nonatomic , assign) NSInteger sectionNum;
@property (nonatomic , assign) NSDictionary<NSNumber*,NSNumber*> *  rowNum;
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


-(UITableView*(^)(UIEdgeInsets insets))insets;

-(UITableView*(^)(UITableViewCellSeparatorStyle style))bottemLineStyle;

-(UITableView*(^)(UIColor* color))bottemLineColor;

-(UITableView*(^)(UIEdgeInsets insets))bottemLineInsets;

-(UITableView*(^)(void))reload;

-(UITableView*(^)(void))beginReload;

-(UITableView*(^)(void))endReload;

-(UITableView*(^)(BOOL fromNib,Class cellClass,NSString* identifier))registCell;

-(UITableView*(^)(BOOL fromNib,Class cellClass,NSString* identifier))registHead;


/**
 设置section个数
 */
-(UITableView*(^)(NSInteger i))setNumOfSection;



/**
 设置cell
 */
-(UITableView*(^)(UITableViewCell*(^)(NSIndexPath *index)))setCellForIndexPath;



/**
 设置cell个数
 */
-(UITableView*(^)(NSDictionary<NSNumber *,NSNumber *> * dic))setRowNumInSection;



/**
 设置cell高度
 */
-(UITableView*(^)(CGFloat (^)(NSIndexPath*)))setRowHeightForIndex;



/**
 cell点击事件
 */
-(UITableView*(^)(void(^)(NSIndexPath*)))setSelectActionForIndex;



/**
 是否高亮
 */
-(UITableView*(^)(BOOL(^)(NSIndexPath*)))setShouldHighlightRowAtIndex;



/**
 设置代理
 */
-(UITableView*(^)(void))setDelegateAndDataSource;



/**
 组头高
 */
-(UITableView*(^)(CGFloat(^)(NSInteger)))setSectionHeadHeight;


/**
 组委高
 */
-(UITableView*(^)(CGFloat(^)(NSInteger)))setSectionFootHeight;


/**
 组头View
 */
-(UITableView*(^)(UIView*(^)(NSInteger)))setSectionHeadView;


/**
 组委View
 */
-(UITableView*(^)(UIView*(^)(NSInteger)))setSectionFootView;


/**
 是否可编辑（默认可以？）
 */
-(UITableView*(^)(BOOL(^)(NSIndexPath*)))setCanEditForIndex;


/**
 设置编辑类型
 */
-(UITableView*(^)(void(^)(UITableViewCellEditingStyle,NSIndexPath*)))setCommitEditStyleForIndex;



/**
 设置编辑按钮文字
 */
-(UITableView*(^)(NSString*(^)(NSIndexPath*)))setEditTextForIndex;


#pragma mark UIView公共方法 不需要实现
+(UITableView * (^)(void))loadFromNib;

-(UITableView * (^)(float x , float y , float w, float h))fram;

-(UITableView * (^)(BOOL enable))able;

-(UITableView * (^)(BOOL hid))hid;

-(UITableView * (^)(float x,float y))cent;

-(UITableView * (^)(float w, float h))bds;

-(UITableView * (^)(BOOL clip))clip;

-(UITableView *(^)(UIView * v))addOn;

-(UITableView *(^)(UIColor * c))bg;

-(UITableView * (^)(float w))corner;

-(UITableView * (^)(float w))borderW;

-(UITableView * (^)(UIColor * w))borderC;

-(UITableView * (^)(int w))tags;

-(UITableView * (^)(void))layout;
@end


