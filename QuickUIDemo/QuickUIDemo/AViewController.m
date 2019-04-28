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
        make.edges.equalTo(self.view).inset(10);
    }).tap(^(UIView * v){
        [wk dismissViewControllerAnimated:YES completion:nil];
    });
    
    
    UILabel.Label().str(@"我是第二个label").borderC(UIColor.orangeColor).borderW(1).corner(10).fram(100,100,20,20).addOn(self.view);
    
    
    
    
    // Do any additional setup after loading the view.
}

-(void)dealloc{
    NSLog(@"页面释放");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
