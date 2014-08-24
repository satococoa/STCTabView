//
//  STCTabItemView.h
//  Pods
//
//  Created by Satoshi Ebisawa on 2014/08/24.
//
//

#import <UIKit/UIKit.h>

@interface STCTabItemView : UIView
@property (nonatomic) BOOL selected;

@property (nonatomic, copy) NSString *text;
@property (nonatomic) UIColor *textColor;
@property (nonatomic) UIColor *selectedTextColor;
@property (nonatomic) UIFont *textFont;
@property (nonatomic) UIFont *selectedTextFont;
@property (nonatomic) UIEdgeInsets textInsets;

@property (nonatomic) UIColor *backgroundColor;
@property (nonatomic) UIColor *selectedBackgroundColor;

@property (nonatomic) CGFloat borderWidth;
@property (nonatomic) CGFloat cornerRadius;
@property (nonatomic) UIColor *borderColor;
@property (nonatomic) UIColor *selectedBorderColor;

@property (nonatomic) UIImage *image;
@property (nonatomic) UIImage *selectedImage;

@end
