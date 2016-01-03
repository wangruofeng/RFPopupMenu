//
//  RFPopupMenuContentView.m
//  RFPopupMenuDemo <https://github.com/wangruofeng/RFPopupMenu>
//
//  Created by 王若风 on 15/10/20.
//  Copyright © 2015年 王若风. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "RFPopupMenuContentView.h"

#define kSeperateLineColor    [UIColor colorWithRed:225/255.0 green:225/255.f blue:225/255.0 alpha:1]
const CGFloat kArrowHeight = 6.f;

@interface RFPopupMenuContentView()<UIGestureRecognizerDelegate>



@property (nonatomic, assign) BOOL            isShow;
@property (nonatomic, strong) NSArray<RFPopupMenuItem *> *items;
@property (nonatomic, strong) NSMutableArray  *lineViews;
@end

@implementation RFPopupMenuContentView

#pragma mark - LifeCircle
+ (instancetype)popupMenuWithItems:(NSArray<RFPopupMenuItem *> *)items{
    return [[self alloc] initWithItems:items];
}

- (instancetype)initWithItems:(NSArray<RFPopupMenuItem *> *)items{
    
    self = [super initWithFrame:CGRectZero];
    
    if (self) {
     
        NSAssert(items.count > 0, @"items count at least one!");
        
        self.isShow                 = NO;
        self.items                  = items;
        self.lineViews              = [NSMutableArray arrayWithCapacity:items.count];
        self.userInteractionEnabled = YES;
        CGSize size                 = [self popupMenuSize];
        
        //init frame
        self.frame                  = CGRectMake(0, 0, size.width, size.height);
        
        //clip RFPopupMenuItem to round,cornerRadius is 4.f
        self.popupMenuBackGroundView                        = [[UIView alloc] init];
        self.popupMenuBackGroundView.userInteractionEnabled = YES;
        self.popupMenuBackGroundView.layer.cornerRadius     = 4.f;
        self.popupMenuBackGroundView.clipsToBounds          = YES;
        self.popupMenuBackGroundView.frame                  = self.bounds;
        [self addSubview:_popupMenuBackGroundView];
        
        //
        self.arrowImageView             = [[UIImageView alloc] init];
        self.arrowImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.direction                  = RFPopupMenuArrowDirectionUp;
        self.arrowHorizontalOffset      = size.width * 0.5;
        [self addSubview:_arrowImageView];
        
        
        CGSize itemMaxIntrinsicContentSize = [self itemMaxIntrinsicContentSize];
        
        //layout
        [items enumerateObjectsUsingBlock:^(RFPopupMenuItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
            
            [self.popupMenuBackGroundView addSubview:item];
            
            item.frame = CGRectMake(0, (itemMaxIntrinsicContentSize.height + 0.5) * idx, itemMaxIntrinsicContentSize.width, itemMaxIntrinsicContentSize.height);
            
            //add line
            if (idx < self.items.count - 1) {
                
                UIView *lineView = [[UIView alloc] init];
                
                lineView.backgroundColor = kSeperateLineColor;
                lineView.frame = CGRectMake(0, CGRectGetMaxY(item.frame),CGRectGetWidth(item.frame), 0.5);
                
                [self.popupMenuBackGroundView addSubview:lineView];
                [self.lineViews addObject:lineView];
            }
        }];
    }
    
    return self;
}

- (void)setDirection:(RFPopupMenuArrowDirection)direction{
    
    _direction = direction;
    
    CGSize size = [self popupMenuSize];
    
    switch (direction) {
        case RFPopupMenuArrowDirectionUp: {
            
            UIImage *arrowImage                     = [UIImage imageNamed:@"Triangle_white_up"];
            self.arrowImageView.image               = arrowImage;
            self.arrowImageView.frame               = CGRectMake(self.arrowHorizontalOffset - arrowImage.size.width * 0.5, -arrowImage.size.height, arrowImage.size.width, arrowImage.size.height);
    
            break;
        }
        case RFPopupMenuArrowDirectionDown: {
            
            UIImage *arrowImage                     = [UIImage imageNamed:@"Triangle_white_down"];
            self.arrowImageView.image               = arrowImage;
            self.arrowImageView.frame               = CGRectMake(self.arrowHorizontalOffset  - arrowImage.size.width * 0.5, size.height, arrowImage.size.width, arrowImage.size.height);
            
            break;
        }
    }
}

- (void)setArrowHorizontalOffset:(CGFloat)arrowHorizontalOffset{
    _arrowHorizontalOffset = arrowHorizontalOffset;
    
    
    CGRect arrowFrame         = self.arrowImageView.frame;
    arrowFrame.origin.x       = arrowHorizontalOffset;
    self.arrowImageView.frame = arrowFrame;
}

#pragma mark - Help methods
- (CGSize)itemMaxIntrinsicContentSize{
    
    __block  CGFloat maxWidth  = 0;
    __block  CGFloat maxHeight = 0;
    
    [self.items enumerateObjectsUsingBlock:^(RFPopupMenuItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGSize itemSize = [item intrinsicContentSize];
        
        if (itemSize.height > maxHeight) {
            maxHeight = itemSize.height;
        }
        
        if (itemSize.width > maxWidth) {
            maxWidth = itemSize.width;
        }
    }];
    
    return CGSizeMake(maxWidth, maxHeight);
}

- (CGSize)popupMenuSize
{
    CGSize popupMenuSize = CGSizeZero;
    CGSize itemMaxIntrinsicContentSize = [self itemMaxIntrinsicContentSize];
    popupMenuSize = CGSizeMake(itemMaxIntrinsicContentSize.width, itemMaxIntrinsicContentSize.height * self.items.count + 0.5 * (self.items.count - 1));
    
    return popupMenuSize;
}

@end
