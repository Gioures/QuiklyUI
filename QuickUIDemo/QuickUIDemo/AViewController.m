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
@interface AViewController ()
@property (nonatomic , strong)UICollectionView * c ;
@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.bg(UIColor.whiteColor);
    [self back];
    
 
    

}

-(void)back{
    UILabel.Label().str(@"返回").color(UIColor.greenColor).fnt(15).addOn(self.view).makeCons(^(MASConstraintMaker *make){
        make.top.left.equalTo(self.view).offset(40);
        make.size.mas_equalTo(CGSizeMake(40, 20));
    }).tap(^(UILabel * z){
        z.bg(UIColor.blackColor);
    });
}

-(void)makeUI{
    __weak __typeof(self)wk = self;
    _c = CollectionView(CGRectMake(0, 100,370,667), Layout.itemSizeA(100,100)).regist(YES, ZCollectionViewCell.class).numberOfSectionsInCollectionView(^NSInteger{
        return 1;
    }).numberOfItemsInSection(^NSInteger(NSInteger section) {
        return 20;
    }).cellForItemAtIndexPath(^UICollectionViewCell * _Nonnull(NSIndexPath * _Nonnull index) {
        ZCollectionViewCell * cell = [wk.c dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ZCollectionViewCell class]) forIndexPath:index];
        return cell;
    }).addOn(self.view).delegateA;
}



-(void)dealloc{
    NSLog(@"页面释放");
}

@end
