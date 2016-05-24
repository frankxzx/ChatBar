//
//  ViewController.m
//  ChatBar
//
//  Created by Xuzixiang on 16/5/23.
//  Copyright © 2016年 TouchSpring. All rights reserved.
//

#import "ViewController.h"
#import "ChatBar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGSize s = [UIScreen mainScreen].bounds.size;
    CGFloat x = 100;
    CGFloat y = s.height - 50;
    CGFloat h = 50;
    CGFloat w= s.width;
    ChatBar *chatBar = [[ChatBar alloc] initWithFrame:CGRectMake(x, y, w, h)];
    
    [self.view addSubview:chatBar];
}

//键盘覆盖输入框

//当键盘调出时将输入框覆盖时，可以用下方法：

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField

{
    
    [self.view setFrame:CGRectMake(0, -100, 320, 480) ];
    
    return YES;
    
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField

{
    
    [self.view setFrame:CGRectMake(0, 0, 320, 480)];
    
    return YES;
    
}

-(void)injected {
    [self viewDidLoad];
    [self viewWillLayoutSubviews];
    [self viewDidLayoutSubviews];
}

@end
