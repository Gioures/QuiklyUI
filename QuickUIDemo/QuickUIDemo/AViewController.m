//
//  AViewController.m
//  QuickUIDemo
//
//  Created by 段庆烨 on 2019/4/27.
//  Copyright © 2019年 段庆烨. All rights reserved.
//

#import "AViewController.h"
#import "Quick.h"
@interface AViewController ()

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
    
    
    UILabel.Label().str(@"我是第二个label").borderC(UIColor.orangeColor).borderW(1).corner(10).fram(100,100,20,20).addOn(self.view);
    
    CollectionView(CGRectMake(0, 120, self.view.bounds.size.width, self.view.bounds.size.height), Layout.itemSizeA(50,50)).delegateA.cellP(^UICollectionViewCell * _Nonnull(NSIndexPath * _Nonnull index) {
        UICollectionViewCell * cell = [UICollectionViewCell new];
        cell.bg(UIColor.greenColor);
        return cell;
    }) .addOn(self.view);
}

-(void)dealloc{
    NSLog(@"页面释放");
}

@end
