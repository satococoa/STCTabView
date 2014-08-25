//
//  STCTabItemView.m
//  Pods
//
//  Created by Satoshi Ebisawa on 2014/08/24.
//
//

#import "STCTabItemView.h"
#import "STCTabView.h"
#import <QuartzCore/QuartzCore.h>

@interface STCTabItemView ()
@property (nonatomic) UILabel *textLabel;
@property (nonatomic) UIImageView *imageView;
@property (nonatomic) CALayer *backgroundLayer;
@property (nonatomic) CAShapeLayer *maskLayer;
@end

@implementation STCTabItemView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupDefaults];
        [super setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupDefaults];
        [super setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)setupDefaults
{
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.selected = NO;

    self.textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.textLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self addSubview:self.textLabel];

    self.imageView = [[UIImageView alloc] initWithImage:self.image];
    self.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.imageView];

    self.text = @"";
    self.textColor = [UIColor lightTextColor];
    self.selectedTextColor = [UIColor darkTextColor];
    self.textFont = [UIFont systemFontOfSize:12];
    self.textInsets = UIEdgeInsetsMake(0, 20, 0, 20);

    self.backgroundColor = [UIColor darkGrayColor];
    self.selectedBackgroundColor = [UIColor whiteColor];

    self.borderWidth = 0.0;
    self.cornerRadius = 10.0;
    self.borderColor = [UIColor blackColor];
    self.selectedBorderColor = [UIColor blackColor];

    self.imageMargin = 2.0;
    self.image = nil;

    self.backgroundLayer = [CALayer layer];
    [self.layer insertSublayer:self.backgroundLayer atIndex:0];
    self.maskLayer = [[CAShapeLayer alloc] init];
    self.layer.mask = self.maskLayer;

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didSelected:)];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tapGesture];
}

- (void)didSelected:(UIGestureRecognizer *)gesture
{
    [self.tabView setSelectedTab:self];
}

- (void)setText:(NSString *)text
{
    _text = text;
    self.textLabel.text = text;
}

- (void)setSelected:(BOOL)selected
{
    _selected = selected;
    [self update];
}

- (CGSize)sizeThatFits:(CGSize)size
{
    [self update];
    CGSize labelSize = [self.textLabel sizeThatFits:size];
    CGSize frameSize = CGSizeMake(
                             labelSize.width + self.textInsets.left + self.textInsets.right,
                             size.height);
    return frameSize;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    self.backgroundLayer.backgroundColor = self.backgroundColor.CGColor;
    self.backgroundLayer.frame = self.bounds;

    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                           cornerRadii:CGSizeMake(self.cornerRadius, self.cornerRadius)];
    self.maskLayer.frame = self.bounds;
    self.maskLayer.path = maskPath.CGPath;

    [self update];
}

- (void)update
{
    self.textLabel.font = self.textFont;
    if (self.isSelected) {
        self.textLabel.textColor = self.selectedTextColor;
        self.backgroundLayer.backgroundColor = self.selectedBackgroundColor.CGColor;
        self.layer.borderColor = self.selectedBorderColor.CGColor;
    } else {
        self.textLabel.textColor = self.textColor;
        self.backgroundLayer.backgroundColor = self.backgroundColor.CGColor;
        self.layer.borderColor = self.borderColor.CGColor;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.textLabel.frame = CGRectMake(self.textInsets.left,
                                      0,
                                      self.textLabel.bounds.size.width,
                                      self.textLabel.bounds.size.height);
    if (self.image) {
        CGSize labelSize = [self.textLabel sizeThatFits:self.bounds.size];
        CGSize imageSize = CGSizeMake(labelSize.height, labelSize.height);
        self.imageView.image = self.image;
        self.imageView.frame = CGRectMake(self.textInsets.left - self.imageMargin - imageSize.width,
                                          (self.bounds.size.height - imageSize.height)/2.0,
                                          imageSize.width,
                                          imageSize.height);
    }
}

@end
