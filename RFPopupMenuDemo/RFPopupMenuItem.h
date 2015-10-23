//
//  RFPopupMenuItem.h
//  RFPopupMenuDemo
//
//  Created by 王若风 on 15/10/20.
//  Copyright © 2015年 王若风. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RFPopupMenuItem : UIControl

@property (nonatomic, strong) UIColor *norColor;
@property (nonatomic, strong) UIColor *selColor;
@property (nonatomic, assign) CGFloat height;

/**
 *  default initializer
 *
 *  @param title  Item's right title if you are need.
 *  @param image  Item's left image if you are need(Note:both title and image can't be nil at the same time!).
 *  @param target action's target.
 *  @param action action's callback methed.
 *
 *  @return a RFPopupMenuItem instance if init sucessed.
 */
- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)action;
+ (instancetype)ItemWithTitle:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)action;

@end
