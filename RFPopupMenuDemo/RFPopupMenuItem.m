//
//  RFPopupMenuItem.m
//  RFPopupMenuDemo <https://github.com/wangruofeng/RFPopupMenu>
//
//  Created by 王若风 on 15/10/20.
//  Copyright © 2015年 王若风. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "RFPopupMenuItem.h"
#import "RFPopupMenu.h"

#define UIColorFromRGB(rgbValue, a) \
        [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                        green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
                         blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
                        alpha:a]
#define kLabelFont      [UIFont systemFontOfSize:14]
#define kLabelTextColor UIColorFromRGB(0x4A4A4A, 1)
const CGFloat kRFPopupMenuItemMargin = 5.f;

@interface RFPopupMenuItem ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel     *label;

@property (nonatomic, copy  ) NSString    *title;
@property (nonatomic, strong) UIImage     *image;
@property (nonatomic, weak  ) id          target;
@property (nonatomic, assign) SEL         action;
@end

@implementation RFPopupMenuItem
@synthesize height = _height;

#pragma mark - initialize
- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)action{
    
    self = [super initWithFrame:CGRectZero];
    
    if (self) {
        
        
        NSAssert(title != nil | image != nil, @"title and image can't be nil at same time!");
        
        self.title           = title;
        self.image           = image;
        self.target          = target;
        self.action          = action;
        self.norColor        = [UIColor whiteColor];
        self.selColor        = UIColorFromRGB(0xF4F4F4, 1);
        self.backgroundColor = self.norColor;
        
        [self addTarget:self action:@selector(itemToggle) forControlEvents:UIControlEventTouchUpInside];
        
        //
        if (image) {
            self.imageView           = [[UIImageView alloc] init];
            _imageView.image         = image;
            _imageView.contentMode   = UIViewContentModeScaleAspectFit;
            [self addSubview:_imageView];
        }
        
        //
        if (title) {
            self.label               = [[UILabel alloc] init];
            self.label.text          = title;
            self.label.textAlignment = NSTextAlignmentLeft;
            self.label.font          = kLabelFont;
            self.label.textColor     = kLabelTextColor;
            [self addSubview:_label];
        }
        
        
    }
    
    return self;
}

+ (instancetype)ItemWithTitle:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)action{
    
    return [[self alloc] initWithTitle:title image:image target:target action:action];
}

#pragma mark - layout
- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat initX  = 0.f;
    CGFloat initY  = 0.f;
    CGFloat width  = 0.f;
    CGFloat height = 0.f;
    self.height    = CGRectGetHeight(self.frame);
    
    if (self.image && !self.title) {
        
        width                = ceil(MAX(self.image.size.width, self.height));
        height               = ceil(MIN(self.image.size.height, self.height - 2*kRFPopupMenuItemMargin));
        initX                = kRFPopupMenuItemMargin;
        initY                = (self.height - height) * 0.5;
        self.imageView.frame = CGRectMake(initX, initY, width, height);
    }
    
    if (self.title && !self.image) {
        
        CGSize textSize  = [self.title boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width*0.5, MAXFLOAT)
                                                    options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading
                                                 attributes:@{NSFontAttributeName:kLabelFont}
                                                    context:nil].size;
        
        width            = ceil(textSize.width) + kRFPopupMenuItemMargin;
        height           = ceil(MIN(textSize.height, self.height)) + 6;
        initX            = kRFPopupMenuItemMargin;
        initY            = (self.height - height) * 0.5;
        self.label.frame = CGRectMake(initX, initY, width, height);
        
        
    }
    
    if (self.image && self.title) {
        
        width                = ceil(MAX(self.image.size.width, self.height));
        height               = ceil(MIN(self.image.size.height, self.height - 2*kRFPopupMenuItemMargin));
        initX                = kRFPopupMenuItemMargin;
        initY                = (self.height - height) * 0.5;
        self.imageView.frame = CGRectMake(initX, initY, width, height);
        
        initX                = width + 2 * kRFPopupMenuItemMargin;
        initY                = 0;
        width                = CGRectGetWidth(self.frame) - initX;
        height               = self.height;
        self.label.frame     = CGRectMake(initX, initY, width, height);
    }
}

#pragma mark - Help methods
- (void)setHeight:(CGFloat)height{
    
    _height          = height;
    
    CGRect rect      = self.frame;
    rect.size.height = height;
    self.frame       = rect;
}

- (CGFloat)height{
    return _height;
}

/** calculate the menuItem intrinsic size */
- (CGSize)intrinsicContentSize
{
    CGSize size        = CGSizeZero;
    CGFloat itemWidth  = 0;
    CGFloat itemHeight = 0;
    
    if (self.title) {
        CGSize textSize = [self.title boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width*0.5, MAXFLOAT)
                                                   options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading
                                                attributes:@{NSFontAttributeName:kLabelFont}
                                                   context:nil].size;
        itemWidth  += ceil(textSize.width) + 2 * kRFPopupMenuItemMargin;
        itemHeight += ceil(textSize.height) + 6;
    }
    
    if (self.image) {
        itemWidth += ceil(self.image.size.width) + 2 * kRFPopupMenuItemMargin;
        itemHeight = MAX(ceil(self.image.size.height), itemHeight);
    }
    
    if (self.title && self.image) {
        itemWidth -= kRFPopupMenuItemMargin;
    }
    
    size = CGSizeMake(itemWidth, itemHeight);
    
    return size;
}

- (RFPopupMenu *)findMenuView
{
    UIView *ancestorView = self.superview;
    while (![ancestorView isKindOfClass:[RFPopupMenu class]]) {
        ancestorView = ancestorView.superview;
    }
    
    return (RFPopupMenu *)ancestorView;
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    
    if (highlighted) {
        self.backgroundColor = self.selColor;
    } else {
        self.backgroundColor = self.norColor;
    }
}

#pragma mark - Event handle
- (void)itemToggle
{
    RFPopupMenu *menuView = [self findMenuView];
    [menuView dismissAnimated:YES];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [self.target performSelector:self.action withObject:self];
#pragma clang diagnostic pop
    
}

@end
