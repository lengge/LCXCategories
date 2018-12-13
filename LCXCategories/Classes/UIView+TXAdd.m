//
//  UIView+TXAdd.m
//  TXFutures
//
//  Created by dong on 2018/9/18.
//  Copyright © 2018年 Shanghai Tianxi Information Technology Co., Ltd. All rights reserved.
//

#import "UIView+TXAdd.h"
#import <objc/runtime.h>

const void * TXBorderShapeLayerKey = "TXBorderShapeLayerKey";

@interface UIView ()

@property (nonatomic, strong) CAShapeLayer *borderShapeLayer;

@end

@implementation UIView (TXAdd)

- (void)borderWithColor:(UIColor *)color
                  width:(CGFloat)width
                   type:(UIBorderSideType)type {
    if (type == UIBorderSideTypeAll) {
        self.layer.borderWidth = width;
        self.layer.borderColor = color.CGColor;
        return;
    }
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    CGRect rect = self.bounds;
    if (type & UIBorderSideTypeLeft) {
        [bezierPath moveToPoint:CGPointMake(0, 0)];
        [bezierPath addLineToPoint:CGPointMake(0, rect.size.height)];
    }
    
    if (type & UIBorderSideTypeRight) {
        [bezierPath moveToPoint:CGPointMake(rect.size.width, 0)];
        [bezierPath addLineToPoint:CGPointMake(rect.size.width, rect.size.height)];
    }
    
    if (type & UIBorderSideTypeTop) {
        [bezierPath moveToPoint:CGPointMake(0, 0)];
        [bezierPath addLineToPoint:CGPointMake(rect.size.width, 0)];
    }
    
    if (type & UIBorderSideTypeBottom) {
        [bezierPath moveToPoint:CGPointMake(0, rect.size.height)];
        [bezierPath addLineToPoint:CGPointMake(rect.size.width, rect.size.height)];
    }
    
    self.borderShapeLayer.strokeColor = color.CGColor;
    self.borderShapeLayer.path = bezierPath.CGPath;
    self.borderShapeLayer.lineWidth = width;
    [self.borderShapeLayer setNeedsDisplay];
}

- (CAShapeLayer *)borderShapeLayer {
    CAShapeLayer *borderShapeLayer = objc_getAssociatedObject(self, TXBorderShapeLayerKey);
    if (borderShapeLayer == nil) {
        borderShapeLayer = [[CAShapeLayer alloc] init];
        borderShapeLayer.fillColor = [UIColor clearColor].CGColor;
        [self.layer addSublayer:borderShapeLayer];
        [self setBorderShapeLayer:borderShapeLayer];
    }
    return borderShapeLayer;
}

- (void)setBorderShapeLayer:(CAShapeLayer *)borderShapeLayer {
    objc_setAssociatedObject(self, TXBorderShapeLayerKey, borderShapeLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end




@implementation UIView (TXAddIBInspectable)
@dynamic cornerRadius, borderWidth, borderColor;

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0 ? YES : NO;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

@end
