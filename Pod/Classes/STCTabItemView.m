//
//  STCTabItemView.m
//  Pods
//
//  Created by Satoshi Ebisawa on 2014/08/24.
//
//

#import "STCTabItemView.h"

@interface STCTabItemView ()
@property (nonatomic) UILabel *textLabel;
@property (nonatomic) UIImageView *imageView;

@end

@implementation STCTabItemView

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
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.selected = NO;

    self.textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.textLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self addSubview:self.textLabel];

    self.imageView = [[UIImageView alloc] initWithImage:self.image];
    self.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self addSubview:self.imageView];


    self.text = @"";
    self.textColor = [UIColor darkTextColor];
    self.selectedTextColor = [UIColor lightTextColor];
    self.textFont = [UIFont systemFontOfSize:15];
    self.selectedTextFont = [UIFont systemFontOfSize:15];
    self.textInsets = UIEdgeInsetsMake(5, 8, 0, 8);

    super.backgroundColor = [UIColor lightGrayColor];
    self.selectedBackgroundColor = [UIColor whiteColor];

    self.borderWidth = 1.0;
    self.cornerRadius = 6.0;
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

- (void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
    self.textLabel.textColor = textColor;
}

- (void)setTextFont:(UIFont *)textFont
{
    _textFont = textFont;
    self.textLabel.font = textFont;
}

- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize labelSize = [self.textLabel sizeThatFits:size];
    CGSize frameSize = CGSizeMake(
                             labelSize.width + self.textInsets.left + self.textInsets.right,
                             labelSize.height + self.textInsets.top + self.textInsets.bottom);
    return frameSize;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

@end
