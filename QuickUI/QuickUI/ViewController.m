//
//  ViewController.m
//  QuickUI
//
//  Created by ytkjs on 2019/4/25.
//  Copyright © 2019年 Gioures. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Quick.h"
#import "UIButton+Quick.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton * b = (UIButton *)UIButton.Button().fram(0,0,100,100).addOn(self.view);
    b.titleRect = CGRectMake(0, 0, 100, 20);
    b.str(@"basdbfbs").bg(UIColor.redColor);
    b.img(@"1");
    b.imgRect = CGRectMake(0, 80, 100, 20);
    
    
}   

@end
