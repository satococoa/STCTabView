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

    self.selectedTabIndex = 0;
}

- (void)setTabsBackgroundColor:(UIColor *)tabsBackgroundColor
{
    _tabsBackgroundColor = tabsBackgroundColor;
    self.scrollView.backgroundColor = tabsBackgroundColor;
}

- (void)appendTabItem:(STCTabItemView *)tabItem
{
    [self.tabItems addObject:tabItem];
    [self.scrollView addSubview:tabItem];
}

- (void)setTabItemsInsets:(UIEdgeInsets)tabItemsInsets
{
    self.scrollView.contentInset = tabItemsInsets;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];

    STCTabItemView *selectedTabItem = self.tabItems[self.selectedTabIndex];
    selectedTabItem.selected = YES;
    self.backgroundColor = selectedTabItem.selectedBackgroundColor;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    self.scrollView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - 5);
    CGFloat contentHeight = self.scrollView.bounds.size.height - self.tabItemsInsets.top - self.tabItemsInsets.bottom - 5;

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
