//
//  STCTabView.m
//  Pods
//
//  Created by Satoshi Ebisawa on 2014/08/24.
//
//

#import "STCTabView.h"
#import <QuartzCore/QuartzCore.h>

@interface STCTabView ()
@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) NSMutableArray *tabItems;
@property (nonatomic) CALayer *borderLayer;
@property (nonatomic) CALayer *backgroundLayer;
@end

@implementation STCTabView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupDefaults];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupDefaults];
    }
    return self;
}

- (void)setupDefaults
{
    self.backgroundLayer = [CALayer layer];
    self.backgroundLayer.backgroundColor = self.backgroundColor.CGColor;
    [self.layer insertSublayer:self.backgroundLayer atIndex:0];

    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.scrollEnabled = YES;
    [self addSubview:self.scrollView];

    self.borderLayer = [CALayer layer];
    self.borderLayer.borderColor = [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0].CGColor;
    self.borderLayer.borderWidth = 1;
    [self.layer addSublayer:self.borderLayer];

    self.tabsBackgroundColor = [UIColor lightGrayColor];
    self.tabItems = [[NSMutableArray alloc] init];
    self.tabItemsInsets = UIEdgeInsetsMake(5, 10, 0, 10);
    self.tabItemMargin = 2;

    _selectedTabIndex = 0;
}

- (void)setSelectedTab:(STCTabItemView *)selectedTab
{
    _selectedTabIndex = [self.tabItems indexOfObject:selectedTab];
    for (STCTabItemView *tabItem in self.tabItems) {
        tabItem.selected = (tabItem == selectedTab);
    }
    self.backgroundLayer.backgroundColor = selectedTab.selectedBackgroundColor.CGColor;
    [self layoutSubviews];

    if (self.selectedTabIndexChangedHandler) {
        self.selectedTabIndexChangedHandler(_selectedTabIndex);
    }
}

- (void)setSelectedTabIndex:(TabIndex)selectedTabIndex
{
    STCTabItemView *selectedTab = self.tabItems[selectedTabIndex];
    [self setSelectedTab:selectedTab];
    [self.scrollView scrollRectToVisible:selectedTab.frame animated:YES];
}

- (void)setTabsBackgroundColor:(UIColor *)tabsBackgroundColor
{
    _tabsBackgroundColor = tabsBackgroundColor;
    self.scrollView.backgroundColor = tabsBackgroundColor;
}

- (void)appendTabItem:(STCTabItemView *)tabItem
{
    tabItem.tabView = self;
    [self.scrollView addSubview:tabItem];

    [self.tabItems addObject:tabItem];
    [self layoutSubviews];
}

- (void)insertTabItem:(STCTabItemView *)tabItem atTabIndex:(TabIndex)tabIndex
{
    tabItem.tabView = self;
    [self.scrollView addSubview:tabItem];

    [self.tabItems insertObject:tabItem atIndex:tabIndex];
    [self layoutSubviews];
}

- (void)removeTabItem:(STCTabItemView *)tabItem
{
    [self.tabItems removeObject:tabItem];
    [tabItem removeFromSuperview];
    [self layoutSubviews];
}

- (void)removeTabItemAtTabIndex:(TabIndex)tabIndex
{
    STCTabItemView *removedTab = self.tabItems[tabIndex];
    [self removeTabItem:removedTab];
}

- (void)removeAllTabItems
{
    for (STCTabItemView *item in self.tabItems) {
        [self removeTabItem:item];
    }
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];

    STCTabItemView *selectedTabItem = self.tabItems[self.selectedTabIndex];
    selectedTabItem.selected = YES;
    self.backgroundLayer.backgroundColor = selectedTabItem.selectedBackgroundColor.CGColor;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    self.backgroundLayer.frame = self.bounds;

    self.scrollView.contentInset = self.tabItemsInsets;
    self.scrollView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - 5);
    CGFloat contentHeight = self.scrollView.bounds.size.height - 5; // 下部の区切り線 + border(1pt)

    CGFloat currentTabsWidth = 0;
    for (STCTabItemView *tabItem in self.tabItems) {
        CGSize tabItemSize = [tabItem sizeThatFits:CGSizeMake(self.scrollView.frame.size.width, contentHeight)];
        tabItem.frame = CGRectMake(currentTabsWidth,
                                   0,
                                   tabItemSize.width,
                                   tabItemSize.height);
        currentTabsWidth += tabItemSize.width + self.tabItemMargin;
    }

    // マージンが一つ余計なので引く
    CGFloat contentWidth = currentTabsWidth - self.tabItemMargin;
    self.scrollView.contentSize = CGSizeMake(contentWidth, contentHeight);
    self.borderLayer.frame = CGRectMake(0, self.bounds.size.height + 1, self.bounds.size.width, 1);
}

@end
