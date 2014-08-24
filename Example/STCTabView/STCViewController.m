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
    item.text = @"ああああ";
    item2.text = @"いいいいい";
    item3.text = @"ほげ";
    [self.tabView appendTabItem:item];
    [self.tabView appendTabItem:item2];
    [self.tabView appendTabItem:item3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
