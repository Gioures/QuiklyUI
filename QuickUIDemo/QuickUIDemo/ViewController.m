//
//  ViewController.m
//  QuickUIDemo
//
//  Created by 段庆烨 on 2019/4/27.
//  Copyright © 2019年 段庆烨. All rights reserved.
//

#import "ViewController.h"
#import "Quick.h"
#import "AViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton.Button().bg(UIColor.blueColor).click(^(UIButton * button){
        [self presentViewController:[AViewController new] animated:YES completion:nil];
    }).addOn(self.view).makeCons(^(MASConstraintMaker * make){
        make.size.equalTo([NSValue valueWithCGSize:CGSizeMake(100, 100)]);
        make.center.equalTo(self.view);
    });
    
    
}


@end
