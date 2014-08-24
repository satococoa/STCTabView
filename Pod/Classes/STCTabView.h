//
//  STCTabView.h
//  Pods
//
//  Created by Satoshi Ebisawa on 2014/08/24.
//
//

#import <UIKit/UIKit.h>
#import "STCTabItemView.h"

typedef NSUInteger TabIndex;

@interface STCTabView : UIScrollView
@property (nonatomic) UIEdgeInsets tabItemsInsets;
@property (nonatomic) UIColor *backgroundColor;
@property (nonatomic) TabIndex selectedTabIndex;

- (void)appendTabItem:(STCTabItemView *)tabItem;
- (void)insertTabItem:(STCTabItemView *)tabItem atTabIndex:(TabIndex)tabIndex;
- (void)removeTabItem:(STCTabItemView *)tabItem;
- (void)removeTabItemAtTabIndex:(TabIndex)tabIndex;
@end
