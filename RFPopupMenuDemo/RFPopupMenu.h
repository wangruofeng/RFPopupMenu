//
//  RFPopupMenu.h
//  RFPopupMenuDemo <https://github.com/wangruofeng/RFPopupMenu>
//
//  Created by 王若风 on 15/10/21.
//  Copyright © 2015年 王若风. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import <UIKit/UIKit.h>
#import "RFPopupMenuItem.h"

@interface RFPopupMenu : UIView

typedef NS_ENUM(NSUInteger, RFMenuPopDirection) {
    RFMenuPopDirectionTopLeft,        //topLeft
    RFMenuPopDirectionTopMiddle,      //topMiddle
    RFMenuPopDirectionTopRight,       //topRight
    RFMenuPopDirectionBottomLeft,     //bottomLeft
    RFMenuPopDirectionBottomMiddle,   //bottomMiddle
    RFMenuPopDirectionBottomRight     //bottomRight
};

/** set edge margin when popDirection is not RFMenuPopDirectionTopMiddle or RFMenuPopDirectionBottomMiddle, default is 6.f */
@property (nonatomic, assign) CGFloat edgeMargin;

/** set arrow's horizontal offset in the menuView, default is menuView width's half */
@property (nonatomic, assign) CGFloat arrowHorizontalOffset;

/**
 *  default initializer
 *
 *  @param items RFPopupMenuItem array, at least two.
 *
 *  @return a RFPopupMenu instance
 */
+ (instancetype)popupMenuWithItems:(NSArray<RFPopupMenuItem *> *)items;
- (instancetype)initWithItems:(NSArray<RFPopupMenuItem *> *)items;

/**
 *  add RFPopupMenu instance to a target view to show
 *
 *  @param view       target view.
 *  @param targetRect target rect it decide to the menuView popup point.
 *  @param direction  menuView pop direction.
 *  @param animated   whether need animation or not.
 */
- (void)showInView:(UIView *)view
        targetRect:(CGRect)targetRect
      popDirection:(RFMenuPopDirection)direction
          animated:(BOOL)animated;

/**
 *  remove RFPopupMenu instance frome it's superView if there exist.
 *
 *  @param animated whether need animation or not.
 */
- (void)dismissAnimated:(BOOL)animated;

@end
