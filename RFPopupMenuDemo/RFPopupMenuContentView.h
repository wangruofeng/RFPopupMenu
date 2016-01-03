//
//  RFPopupMenuContentView.h
//  RFPopupMenuDemo <https://github.com/wangruofeng/RFPopupMenu>
//
//  Created by 王若风 on 15/10/20.
//  Copyright © 2015年 王若风. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
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
