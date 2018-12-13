//
//  UIView+TXAdd.h
//  TXFutures
//
//  Created by dong on 2018/9/18.
//  Copyright © 2018年 Shanghai Tianxi Information Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger, UIBorderSideType) {
    UIBorderSideTypeAll    = 0,
    UIBorderSideTypeTop    = (1 << 0),
    UIBorderSideTypeBottom = (1 << 1),
    UIBorderSideTypeLeft   = (1 << 2),
    UIBorderSideTypeRight  = (1 << 3),
};

@interface UIView (TXAdd)

- (void)borderWithColor:(nonnull UIColor *)color
                  width:(CGFloat)width
                   type:(UIBorderSideType)type;

@end




@interface UIView (TXAddIBInspectable)

@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

@property (nonatomic, assign) IBInspectable CGFloat borderWidth;

@property (nonatomic, strong, nonnull) IBInspectable UIColor *borderColor;

@end

