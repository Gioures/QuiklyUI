//
//  AViewController.m
//  QuickUIDemo
//
//  Created by 段庆烨 on 2019/4/27.
//  Copyright © 2019年 段庆烨. All rights reserved.
//

#import "AViewController.h"
#import "Quick.h"
#import "ZCollectionViewCell.h"
#define screenWidth UIScreen.mainScreen.bounds.size.width
#define screenHeight UIScreen.mainScreen.bounds.size.height
@interface AViewController ()
@property (nonatomic , strong)UICollectionView * c ;
@property (nonatomic, strong) UILabel * label;
@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.bg(UIColor.whiteColor);
    [self back];
    [self makeUI];
 
    

}

-(void)back{
     __weak __typeof(self)wk = self;
    _label = UILabel.Label().str(@"返回").color(UIColor.greenColor).fnt(15).addOn(self.view).makeCons(^(MASConstraintMaker *make){
        make.top.left.equalTo(self.view).offset(40);
        make.size.mas_equalTo(CGSizeMake(40, 20));
    }).tap(^(UILabel * z){
        z.bg(UIColor.blackColor);
        [wk dismissViewControllerAnimated:YES completion:nil];
    });
}

-(void)makeUI{
    __weak __typeof(self)wk = self;
    _c = CollectionView(CGRectMake(0, 0,0,0), Layout.itemSizeA((screenWidth - 20*4)/3,100).minimumLineSpacingA(20).sectionInsetA(0,20,0,20))
    .regist(YES, ZCollectionViewCell.class)
    .numberOfSectionsInCollectionView(^NSInteger{
        return 1;
    }).numberOfItemsInSection(^NSInteger(NSInteger section) {
        return 100;
    }).cellForItemAtIndexPath(^UICollectionViewCell * _Nonnull(NSIndexPath * _Nonnull index) {
        ZCollectionViewCell * cell = [wk.c dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ZCollectionViewCell class]) forIndexPath:index];
        if (index.row > 50) {
            cell.bg(UIColor.orangeColor);
        }else{
            cell.bg(UIColor.redColor);
        }
        return cell;
    }).addOn(self.view).delegateA.makeCons(^(MASConstraintMaker *make){
        make.left.bottom.right.equalTo(self.view);
        make.top.equalTo(self.label.mas_bottom).offset(10);
    });
}



-(void)dealloc{
    
    
    NSLog(@" --%ld --%ld 页面释放",CFGetRetainCount((__bridge CFTypeRef)self.label),CFGetRetainCount((CFTypeRef)self
                                                                                                 .c));
}

@end
