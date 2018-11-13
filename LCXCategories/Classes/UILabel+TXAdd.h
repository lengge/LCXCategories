//
//  UILabel+TXAdd.h
//  TXFutures
//
//  Created by dong on 2018/9/20.
//  Copyright © 2018年 Shanghai Tianxi Information Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (TXAdd)

+ (instancetype)tx_labelWithFont:(UIFont *)font
                   textAlignment:(NSTextAlignment)textAlignment
                       textColor:(nullable UIColor *)textColor
                 backgroundColor:(nullable UIColor *)backgroundColor
                            text:(nullable NSString *)text;

+ (instancetype)tx_labelWithFontSize:(CGFloat)fontSize
                       textAlignment:(NSTextAlignment)textAlignment
                           textColor:(nullable UIColor *)textColor
                     backgroundColor:(nullable UIColor *)backgroundColor
                                text:(nullable NSString *)text;

+ (instancetype)tx_labelWithFontSize:(CGFloat)fontSize
                       textAlignment:(NSTextAlignment)textAlignment
                           textColor:(nullable UIColor *)textColor
                                text:(nullable NSString *)text;

+ (instancetype)tx_labelWithFontSize:(CGFloat)fontSize
                           textColor:(nullable UIColor *)textColor
                                text:(nullable NSString *)text;

@end

NS_ASSUME_NONNULL_END
