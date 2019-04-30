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

@interface UITableView (Quick)

@property (nonatomic, copy)  UITableView*(^insets)(UIEdgeInsets insets);
@property (nonatomic, copy)  UITableView*(^bottemLineStyle)(UITableViewCellSeparatorStyle style);
@property (nonatomic, copy)  UITableView*(^bottemLineColor)(UIColor* color);
@property (nonatomic, copy)  UITableView*(^bottemLineInsets)(UIEdgeInsets insets);
@property (nonatomic, copy)  UITableView* (^regist)(BOOL fromNib,Class cellClass,NSString* identifier);

@property (nonatomic, strong , readonly)  UITableView* reload;
@property (nonatomic, strong , readonly)  UITableView* beginload;
@property (nonatomic, strong , readonly)  UITableView* endload;
@property (nonatomic, strong , readonly)  UITableView* delegateA;

@property (nonatomic, copy) UITableView* (^numberOfSectionsA)(NSInteger (^blc)(void));
@property (nonatomic, copy) UITableView* (^numberOfRowsInSectionA)(NSInteger (^blc)(NSInteger section));
@property (nonatomic, copy) UITableView* (^cell)(UITableViewCell* (^blc)(NSIndexPath*indexPath));
@property (nonatomic, copy) UITableView* (^heightForRowA)(CGFloat (^blc)(NSIndexPath*indexPath));
@property (nonatomic, copy) UITableView* (^didSelectRowAtIndexPathA)(void(^blc)(NSIndexPath*indexPath));
@property (nonatomic, copy) UITableView* (^shouldHighlightRowAtIndexPathA)(BOOL(^blc)(NSIndexPath*indexPath));
@property (nonatomic, copy) UITableView* (^heightForHeaderInSectionA)(CGFloat(^blc)(NSInteger section));
@property (nonatomic, copy) UITableView* (^heightForFooterInSectionA)(CGFloat(^blc)(NSInteger section));
@property (nonatomic, copy) UITableView* (^viewForHeaderInSectionA)(UIView *(^blc)(NSInteger section));
@property (nonatomic, copy) UITableView* (^viewForFooterInSectionA)(UIView *(^blc)(NSInteger section));
@property (nonatomic, copy) UITableView* (^canEditRowAtIndexPathA)(BOOL (^blc)(NSIndexPath* indexPath));
@property (nonatomic, copy) UITableView* (^commitEditingStyleForIndexPathA)( void(^blc)( UITableViewCellEditingStyle style,NSIndexPath* indexPath));
@property (nonatomic, copy) UITableView* (^editTextForIndexA)(NSString *(^blc)(NSIndexPath* indexPath));




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


