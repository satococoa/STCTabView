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
@property (weak, nonatomic) IBOutlet UILabel *label;

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
    item.text = @"foo";
    item.backgroundColor = [UIColor colorWithRed:26/255.0 green:188/255.0 blue:156/255.0 alpha:1.0];
    item.selectedBackgroundColor = [UIColor colorWithRed:22/255.0 green:160/255.0 blue:133/255.0 alpha:1.0];

    item2.text = @"bar";
    item2.backgroundColor = [UIColor colorWithRed:52/255.0 green:152/255.0 blue:219/255.0 alpha:1.0];
    item2.selectedBackgroundColor = [UIColor colorWithRed:41/255.0 green:128/255.0 blue:185/255.0 alpha:1.0];

    item3.text = @"foobarfoobar";
    item3.textColor = [UIColor whiteColor];
    item3.selectedTextColor = [UIColor whiteColor];
    item3.backgroundColor = [UIColor colorWithRed:52/255.0 green:73/255.0 blue:94/255.0 alpha:1.0];
    item3.selectedBackgroundColor = [UIColor colorWithRed:44/255.0 green:62/255.0 blue:80/255.0 alpha:1.0];

    item4.text = @"star";
    item4.textColor = [UIColor darkGrayColor];
    item4.image = [UIImage imageNamed:@"star"];
    item4.backgroundColor = [UIColor colorWithRed:236/255.0 green:240/255.0 blue:241/255.0 alpha:1.0];
    item4.selectedBackgroundColor = [UIColor colorWithRed:189/255.0 green:195/255.0 blue:199/255.0 alpha:1.0];

    item5.text = @"baz";
    item5.textColor = [UIColor darkGrayColor];
    item5.backgroundColor = [UIColor colorWithRed:241/255.0 green:196/255.0 blue:15/255.0 alpha:1.0];
    item5.selectedBackgroundColor = [UIColor colorWithRed:243/255.0 green:156/255.0 blue:18/255.0 alpha:1.0];

    [self.tabView appendTabItem:item];
    [self.tabView appendTabItem:item2];
    [self.tabView appendTabItem:item3];
    [self.tabView appendTabItem:item4];
    [self.tabView appendTabItem:item5];

    [self.tabView setSelectedTabIndexChangedHandler:^(TabIndex tabIndex) {
        self.label.text = [NSString stringWithFormat:@"Tab #%ld has been selected!", (long)tabIndex];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
