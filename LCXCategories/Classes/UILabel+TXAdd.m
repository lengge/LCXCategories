//
//  UILabel+TXAdd.m
//  TXFutures
//
//  Created by dong on 2018/9/20.
//  Copyright © 2018年 Shanghai Tianxi Information Technology Co., Ltd. All rights reserved.
//

#import "UILabel+TXAdd.h"

@implementation UILabel (TXAdd)

+ (instancetype)tx_labelWithFont:(UIFont *)font
                   textAlignment:(NSTextAlignment)textAlignment
                       textColor:(nullable UIColor *)textColor
                 backgroundColor:(nullable UIColor *)backgroundColor
                            text:(nullable NSString *)text; {
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textColor = textColor;
    label.backgroundColor = backgroundColor;
    label.textAlignment = textAlignment;
    label.text = text;
    return label;
}

+ (instancetype)tx_labelWithFontSize:(CGFloat)fontSize
                       textAlignment:(NSTextAlignment)textAlignment
                           textColor:(nullable UIColor *)textColor
                     backgroundColor:(nullable UIColor *)backgroundColor
                                text:(nullable NSString *)text {
    return [self tx_labelWithFont:[UIFont systemFontOfSize:fontSize]
                    textAlignment:textAlignment
                        textColor:textColor
                  backgroundColor:backgroundColor
                             text:text];
}

+ (instancetype)tx_labelWithFontSize:(CGFloat)fontSize
                       textAlignment:(NSTextAlignment)textAlignment
                           textColor:(nullable UIColor *)textColor
                                text:(nullable NSString *)text {
    return [self tx_labelWithFontSize:fontSize
                        textAlignment:textAlignment
                            textColor:textColor
                      backgroundColor:[UIColor clearColor]
                                 text:text];
}

+ (instancetype)tx_labelWithFontSize:(CGFloat)fontSize
                           textColor:(nullable UIColor *)textColor
                                text:(nullable NSString *)text {
    return [self tx_labelWithFontSize:fontSize
                        textAlignment:NSTextAlignmentLeft
                            textColor:textColor
                      backgroundColor:nil
                                 text:text];
}

@end
