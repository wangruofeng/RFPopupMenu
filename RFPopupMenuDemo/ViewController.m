//
//  ViewController.m
//  RFPopupMenuDemo
//
//  Created by 王若风 on 15/10/20.
//  Copyright © 2015年 王若风. All rights reserved.
//

#import "ViewController.h"
#import "RFPopupMenuItem.h"
#import "RFPopupMenuContentView.h"
#import "RFPopupMenu.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;
@property (nonatomic, strong) UIButton *button3;
@property (nonatomic, strong) UIButton *button4;
@property (nonatomic, strong) UIButton *button5;
@property (nonatomic, strong) UIButton *button6;

@property (nonatomic, strong) RFPopupMenuContentView *menu;
@property (nonatomic, strong) RFPopupMenu *popupMenu;
@end

@implementation ViewController

#pragma mark - life circle
- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self testShowPopupMenuTopLeft];
    [self testShowPopupMenuTopMiddle];
    [self testShowPopupMenuTopRight];
    
    [self testShowPopupMenuBottomLeft];
    [self testShowPopupMenuBottomMiddle];
    [self testShowPopupMenuBottomRight];
    
}

#pragma mark - test methods
- (void)testShowPopupMenuTopLeft{
    self.button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    _button1.frame = CGRectMake(10, 64, 60, 20);
    _button1.backgroundColor = [UIColor orangeColor];
    [_button1 setTitle:@"Show1" forState:UIControlStateNormal];
    [_button1 addTarget:self action:@selector(showPopupMenuTopLeft) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button1];
}

- (void)testShowPopupMenuTopMiddle{
    
    self.button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    _button2.frame = CGRectMake(155, 64, 60, 20);
    _button2.backgroundColor = [UIColor orangeColor];
    [_button2 setTitle:@"Show2" forState:UIControlStateNormal];
    [_button2 addTarget:self action:@selector(showPopupMenuTopMiddle) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button2];
}

- (void)testShowPopupMenuTopRight{
    
    self.button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    _button3.frame = CGRectMake(300, 64, 60, 20);
    _button3.backgroundColor = [UIColor orangeColor];
    [_button3 setTitle:@"Show3" forState:UIControlStateNormal];
    [_button3 addTarget:self action:@selector(showPopupMenuTopRight) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button3];
}

- (void)testShowPopupMenuBottomMiddle{
    self.button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    _button4.frame = CGRectMake(10, 667 - 64 - 20, 60, 20);
    _button4.backgroundColor = [UIColor orangeColor];
    [_button4 setTitle:@"Show4" forState:UIControlStateNormal];
    [_button4 addTarget:self action:@selector(showPopupMenuBottomLeft) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button4];
}

- (void)testShowPopupMenuBottomLeft{
    
    self.button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    _button5.frame = CGRectMake(155, 667 - 64 - 20, 60, 20);
    _button5.backgroundColor = [UIColor orangeColor];
    [_button5 setTitle:@"Show5" forState:UIControlStateNormal];
    [_button5 addTarget:self action:@selector(showPopupMenuBottomMiddle) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button5];
}

- (void)testShowPopupMenuBottomRight{
    self.button6 = [UIButton buttonWithType:UIButtonTypeCustom];
    _button6.frame = CGRectMake(300, 667 - 64 - 20, 60, 20);
    _button6.backgroundColor = [UIColor orangeColor];
    [_button6 setTitle:@"Show6" forState:UIControlStateNormal];
    [_button6 addTarget:self action:@selector(showPopupMenuBottomRight) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button6];
}

#pragma mark - show methods
- (void)showPopupMenuTopLeft{
    
    RFPopupMenuItem *item1 = [[RFPopupMenuItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"scan"] target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item2 = [[RFPopupMenuItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"add"] target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item3 = [[RFPopupMenuItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"chat"] target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item4 = [[RFPopupMenuItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"computer"] target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item5 = [[RFPopupMenuItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"change"] target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item6 = [[RFPopupMenuItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"money"] target:self action:@selector(itemClicked:)];
    
    self.popupMenu = [[RFPopupMenu alloc] initWithItems:@[item1, item2, item3, item4, item5, item6]];
    self.popupMenu.arrowHorizontalOffset = 8.f;
    
    [self.popupMenu showInView:self.view targetRect:_button1.frame popDirection:RFMenuPopDirectionTopLeft animated:YES];
}

- (void)showPopupMenuTopMiddle{
    
    RFPopupMenuItem *item1 = [[RFPopupMenuItem alloc] initWithTitle:@"扫一扫" image:nil target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item2 = [[RFPopupMenuItem alloc] initWithTitle:@"加好友" image:nil target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item3 = [[RFPopupMenuItem alloc] initWithTitle:@"创建讨论组" image:nil target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item4 = [[RFPopupMenuItem alloc] initWithTitle:@"发送到电脑" image:nil target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item5 = [[RFPopupMenuItem alloc] initWithTitle:@"面对面传" image:nil target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item6 = [[RFPopupMenuItem alloc] initWithTitle:@"收钱" image:nil target:self action:@selector(itemClicked:)];
    
    self.popupMenu = [[RFPopupMenu alloc] initWithItems:@[item1, item2, item3, item4, item5, item6]];
//    self.popupMenu.arrowHorizontalOffset = 30.f;
    
    [self.popupMenu showInView:self.view targetRect:_button2.frame popDirection:RFMenuPopDirectionTopMiddle animated:YES];
}

- (void)showPopupMenuTopRight{
    
    RFPopupMenuItem *item1 = [[RFPopupMenuItem alloc] initWithTitle:@"扫一扫" image:[UIImage imageNamed:@"scan"] target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item2 = [[RFPopupMenuItem alloc] initWithTitle:@"加好友" image:[UIImage imageNamed:@"add"] target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item3 = [[RFPopupMenuItem alloc] initWithTitle:@"创建讨论组" image:[UIImage imageNamed:@"chat"] target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item4 = [[RFPopupMenuItem alloc] initWithTitle:@"发送到电脑" image:[UIImage imageNamed:@"computer"] target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item5 = [[RFPopupMenuItem alloc] initWithTitle:@"面对面传" image:[UIImage imageNamed:@"change"] target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item6 = [[RFPopupMenuItem alloc] initWithTitle:@"收钱" image:[UIImage imageNamed:@"money"] target:self action:@selector(itemClicked:)];
    
    self.popupMenu = [[RFPopupMenu alloc] initWithItems:@[item1, item2, item3, item4, item5, item6]];
    self.popupMenu.arrowHorizontalOffset = 90.f;
    
    [self.popupMenu showInView:self.view targetRect:_button3.frame popDirection:RFMenuPopDirectionTopRight animated:YES];
}

- (void)showPopupMenuBottomLeft{
    RFPopupMenuItem *item1 = [[RFPopupMenuItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"scan"] target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item2 = [[RFPopupMenuItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"add"] target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item3 = [[RFPopupMenuItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"chat"] target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item4 = [[RFPopupMenuItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"computer"] target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item5 = [[RFPopupMenuItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"change"] target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item6 = [[RFPopupMenuItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"money"] target:self action:@selector(itemClicked:)];
    
    self.popupMenu = [[RFPopupMenu alloc] initWithItems:@[item1, item2, item3, item4, item5, item6]];
    self.popupMenu.arrowHorizontalOffset = 15.f;
    
    [self.popupMenu showInView:self.view targetRect:_button4.frame popDirection:RFMenuPopDirectionBottomLeft animated:YES];
}

- (void)showPopupMenuBottomMiddle{
    
    RFPopupMenuItem *item1 = [[RFPopupMenuItem alloc] initWithTitle:@"扫一扫" image:nil target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item2 = [[RFPopupMenuItem alloc] initWithTitle:@"加好友" image:nil target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item3 = [[RFPopupMenuItem alloc] initWithTitle:@"创建讨论组" image:nil target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item4 = [[RFPopupMenuItem alloc] initWithTitle:@"发送到电脑" image:nil target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item5 = [[RFPopupMenuItem alloc] initWithTitle:@"面对面传" image:nil target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item6 = [[RFPopupMenuItem alloc] initWithTitle:@"收钱" image:nil target:self action:@selector(itemClicked:)];
    
    self.popupMenu = [[RFPopupMenu alloc] initWithItems:@[item1, item2, item3, item4, item5, item6]];
//    self.popupMenu.arrowHorizontalOffset = 16;
    
    [self.popupMenu showInView:self.view targetRect:_button5.frame popDirection:RFMenuPopDirectionBottomMiddle animated:YES];
}

- (void)showPopupMenuBottomRight{
    
    RFPopupMenuItem *item1 = [[RFPopupMenuItem alloc] initWithTitle:@"扫一扫" image:[UIImage imageNamed:@"scan"] target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item2 = [[RFPopupMenuItem alloc] initWithTitle:@"加好友" image:[UIImage imageNamed:@"add"] target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item3 = [[RFPopupMenuItem alloc] initWithTitle:@"创建讨论组" image:[UIImage imageNamed:@"chat"] target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item4 = [[RFPopupMenuItem alloc] initWithTitle:@"发送到电脑" image:[UIImage imageNamed:@"computer"] target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item5 = [[RFPopupMenuItem alloc] initWithTitle:@"面对面传" image:[UIImage imageNamed:@"change"] target:self action:@selector(itemClicked:)];
    RFPopupMenuItem *item6 = [[RFPopupMenuItem alloc] initWithTitle:@"收钱" image:[UIImage imageNamed:@"money"] target:self action:@selector(itemClicked:)];
    
    self.popupMenu = [[RFPopupMenu alloc] initWithItems:@[item1, item2, item3, item4, item5, item6]];
    self.popupMenu.arrowHorizontalOffset = 90.f;
    
    [self.popupMenu showInView:self.view targetRect:_button6.frame popDirection:RFMenuPopDirectionBottomRight animated:YES];
}
#pragma mark - handle event
- (void)itemClicked:(RFPopupMenuItem *)item{
    
    NSLog(@"item:%@ frame:%@",item, NSStringFromCGRect(item.frame));
}

@end
