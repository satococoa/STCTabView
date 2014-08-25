//
//  STCViewController.m
//  STCTabView
//
//  Created by Satoshi Ebisawa on 08/19/2014.
//  Copyright (c) 2014 Satoshi Ebisawa. All rights reserved.
//

#import "STCViewController.h"
#import <STCTabView/STCTabView.h>

@interface STCViewController ()
@property (weak, nonatomic) IBOutlet STCTabView *tabView;

@end

@implementation STCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    STCTabItemView *item = [[STCTabItemView alloc] initWithFrame:CGRectZero];
    STCTabItemView *item2 = [[STCTabItemView alloc] initWithFrame:CGRectZero];
    STCTabItemView *item3 = [[STCTabItemView alloc] initWithFrame:CGRectZero];
    STCTabItemView *item4 = [[STCTabItemView alloc] initWithFrame:CGRectZero];
    STCTabItemView *item5 = [[STCTabItemView alloc] initWithFrame:CGRectZero];
    item.text = @"ああああ";
    item2.text = @"いいいいい";
    item2.backgroundColor = [UIColor blueColor];
    item2.selectedBackgroundColor = [UIColor greenColor];
    item3.text = @"ほげ";
    item4.text = @"ほげ";
    item4.image = [UIImage imageNamed:@"star"];
    item5.text = @"ほげほげ";
    [self.tabView appendTabItem:item];
    [self.tabView appendTabItem:item2];
    [self.tabView appendTabItem:item3];
    [self.tabView appendTabItem:item4];
    [self.tabView appendTabItem:item5];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        STCTabItemView *item6 = [[STCTabItemView alloc] initWithFrame:CGRectZero];
        item6.text = @"あとから挿入";
        [self.tabView insertTabItem:item6 atTabIndex:2];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tabView removeTabItemAtTabIndex:2];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tabView setSelectedTabIndex:1];
    });

    [self.tabView setSelectedTabIndexChangedHandler:^(TabIndex tabIndex) {
        NSLog(@"選択: %d", tabIndex);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
