//
//  STCTabView.m
//  Pods
//
//  Created by Satoshi Ebisawa on 2014/08/24.
//
//

#import "STCTabView.h"

@interface STCTabView ()
@property (nonatomic) NSMutableArray *tabItems;
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
    self.tabItems = [[NSMutableArray alloc] init];
    super.backgroundColor = [UIColor blueColor];
}

- (void)appendTabItem:(STCTabItemView *)tabItem
{
    CGFloat currentTabsWidth = 0;
    for (STCTabItemView *item in self.tabItems) {
        currentTabsWidth += [item sizeThatFits:self.bounds.size].width;
    }
    [self.tabItems addObject:tabItem];

    CGSize tabItemSize = [tabItem sizeThatFits:self.bounds.size];
    tabItem.frame = CGRectMake(self.tabItemsInsets.left + currentTabsWidth,
                               self.tabItemsInsets.top,
                               tabItemSize.width,
                               tabItemSize.height);
    [self addSubview:tabItem];
}

@end
