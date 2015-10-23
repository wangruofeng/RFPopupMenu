# RFPopupMenu
RFPopupMenu is popupMenu is support  six pop directions.
***It is very easy to use!***
### It supports three types view.
> 1. Only a image.
> 2. Only a label.
> 3. a image on left and a label on right.


##  Requirements
_**iOS7.0 and later.**_


##  Usage
1. `#import "RFPopupMenu.h"`.
2. use `+ (instancetype)popupMenuWithItems:(NSArray<RFPopupMenuItem *> *)items;` or ` - (instancetype)initWithItems:(NSArray<RFPopupMenuItem *> *)items;` to initialize.
3. set `arrowHorizontalOffset` if need to adjust arrow's position.
4. use

```objective-c
- (void)showInView:(UIView *)view
        targetRect:(CGRect)targetRect
      popDirection:(RFMenuPopDirection)direction
          animated:(BOOL)animated;
```

method to show in a view.



#### below is sample code
```objective-c
RFPopupMenuItem *item1 = [[RFPopupMenuItem alloc] initWithTitle:@"扫一扫" image:[UIImage imageNamed:@"scan"] target:self action:@selector(itemClicked:)];
RFPopupMenuItem *item2 = [[RFPopupMenuItem alloc] initWithTitle:@"加好友" image:[UIImage imageNamed:@"add"] target:self action:@selector(itemClicked:)];
RFPopupMenuItem *item3 = [[RFPopupMenuItem alloc] initWithTitle:@"创建讨论组" image:[UIImage imageNamed:@"chat"] target:self action:@selector(itemClicked:)];
RFPopupMenuItem *item4 = [[RFPopupMenuItem alloc] initWithTitle:@"发送到电脑" image:[UIImage imageNamed:@"computer"] target:self action:@selector(itemClicked:)];
RFPopupMenuItem *item5 = [[RFPopupMenuItem alloc] initWithTitle:@"面对面传" image:[UIImage imageNamed:@"change"] target:self action:@selector(itemClicked:)];
RFPopupMenuItem *item6 = [[RFPopupMenuItem alloc] initWithTitle:@"收钱" image:[UIImage imageNamed:@"money"] target:self action:@selector(itemClicked:)];

self.popupMenu = [[RFPopupMenu alloc] initWithItems:@[item1, item2, item3, item4, item5, item6]];
self.popupMenu.arrowHorizontalOffset = 90.f;

[self.popupMenu showInView:self.view targetRect:_button3.frame popDirection:RFMenuPopDirectionTopRight animated:YES];
```

##Screenshot
![(Screenshot)](https://github.com/wangruofeng/RFSPopupMenu/blob/master/Sample.gif)


##  Download
####  You can download binary release from the [latest releases](https://github.com/wangruofeng/RFPopupMenu/archive/master.zip).


## License
RFPopupMenu is released under the MIT license. See [LICENSE](/LICENSE) for details.
