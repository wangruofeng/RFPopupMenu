//
//  RFPopupMenuContentView.h
//  RFPopupMenuDemo
//
//  Created by 王若风 on 15/10/20.
//  Copyright © 2015年 王若风. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RFPopupMenuItem.h"

typedef NS_ENUM(NSUInteger, RFPopupMenuArrowDirection) {
    RFPopupMenuArrowDirectionUp,
    RFPopupMenuArrowDirectionDown,
};

@interface RFPopupMenuContentView : UIView

@property (nonatomic, strong) UIView      *popupMenuBackGroundView;
@property (nonatomic, strong) UIImageView *arrowImageView;

/** default direction is RFPopupMenuArrowDirectionUp */
@property (nonatomic, assign) RFPopupMenuArrowDirection direction;
/** default arrow Horizontal Offset is arrow menuView width's half */
@property (nonatomic, assign) CGFloat arrowHorizontalOffset;

+ (instancetype)popupMenuWithItems:(NSArray<RFPopupMenuItem *> *)items;
- (instancetype)initWithItems:(NSArray<RFPopupMenuItem *> *)items;

- (CGSize)popupMenuSize;

@end
