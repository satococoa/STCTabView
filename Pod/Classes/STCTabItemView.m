//
//  STCTabItemView.m
//  Pods
//
//  Created by Satoshi Ebisawa on 2014/08/24.
//
//

#import "STCTabItemView.h"
#import <QuartzCore/QuartzCore.h>

@interface STCTabItemView ()
@property (nonatomic) UILabel *textLabel;
@property (nonatomic) UIImageView *imageView;
@property (nonatomic) CALayer *backgroundLayer;

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
    [self addSubview:self.imageView];

    self.text = @"";
    self.textColor = [UIColor lightTextColor];
    self.selectedTextColor = [UIColor darkTextColor];
    self.textFont = [UIFont systemFontOfSize:12];
    self.selectedTextFont = [UIFont systemFontOfSize:12];
    self.textInsets = UIEdgeInsetsMake(0, 16, 0, 16);

    self.backgroundColor = [UIColor darkGrayColor];
    self.selectedBackgroundColor = [UIColor whiteColor];

    self.borderWidth = 0.0;
    self.cornerRadius = 10.0;
    self.borderColor = [UIColor blackColor];
    self.selectedBorderColor = [UIColor blackColor];

    self.image = nil;
    self.selectedImage = nil;
}

- (void)setText:(NSString *)text
{
    _text = text;
    self.textLabel.text = text;
}

- (void)setSelected:(BOOL)selected
{
    _selected = selected;
    [self updateTextLabel];
}

- (CGSize)sizeThatFits:(CGSize)size
{
    [self updateTextLabel];
    CGSize labelSize = [self.textLabel sizeThatFits:size];
    CGSize frameSize = CGSizeMake(
                             labelSize.width + self.textInsets.left + self.textInsets.right,
                             size.height);
    return frameSize;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];

    self.backgroundLayer = [CALayer layer];
    self.backgroundLayer.backgroundColor = self.backgroundColor.CGColor;
    self.backgroundLayer.frame = self.bounds;
    [self.layer insertSublayer:self.backgroundLayer atIndex:0];

    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                           cornerRadii:CGSizeMake(self.cornerRadius, self.cornerRadius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;

    [self updateTextLabel];
}

- (void)updateTextLabel
{
    if (self.isSelected) {
        self.textLabel.textColor = self.selectedTextColor;
        self.textLabel.font = self.selectedTextFont;
        [self setBackgroundColor:self.selectedBackgroundColor];
        self.layer.borderColor = self.selectedBorderColor.CGColor;
        if (self.selectedImage) {
            self.imageView.image = self.selectedImage;
        }
    } else {
        self.textLabel.textColor = self.textColor;
        self.textLabel.font = self.textFont;
        [self setBackgroundColor:self.backgroundColor];
        self.layer.borderColor = self.borderColor.CGColor;
        if (self.image) {
            self.imageView.image = self.image;
        }
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.textLabel.frame = CGRectMake(self.textInsets.left,
                                      0,
                                      self.textLabel.bounds.size.width,
                                      self.textLabel.bounds.size.height);
}

@end
