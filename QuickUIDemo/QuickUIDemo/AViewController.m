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
    __weak typeof(self)wk = self;
    UILabel.Label().str(@"我是一个label").fnt(15).bg(UIColor.redColor).color(UIColor.greenColor).addOn(self.view).makeCons(^(MASConstraintMaker* make){
        make.top.left.equalTo(self.view).offset(50);
        make.right.equalTo(self.view).offset(-50);
        make.height.equalTo(@40);
    }).tap(^(UIView * v){
        [wk dismissViewControllerAnimated:YES completion:nil];
    });
    
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
