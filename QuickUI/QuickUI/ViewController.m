//
//  ViewController.m
//  QuickUI
//
//  Created by ytkjs on 2019/4/25.
//  Copyright © 2019年 Gioures. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Quick.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) weakself = self;
    UIView.View().fram(0,0,500,500).bg(UIColor.redColor).addOn(self.view).tap(^(UIView * v){
        v.bg(UIColor.orangeColor);
        weakself.view.bg(UIColor.blueColor);
    });
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


@end
