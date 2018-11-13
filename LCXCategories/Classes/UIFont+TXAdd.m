//
//  UIFont+TXAdd.m
//  TXFutures
//
//  Created by dong on 2018/10/17.
//  Copyright © 2018年 Shanghai Tianxi Information Technology Co., Ltd. All rights reserved.
//

#import "UIFont+TXAdd.h"

@implementation UIFont (TXAdd)

+ (UIFont *)pingFangSCRegularFontOfSize:(CGFloat)size {
    if (@available(iOS 9.0, *)) {
        return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
    } else {
        return [UIFont systemFontOfSize:size];
    }
}

+ (UIFont *)pingFangSCMediumFontOfSize:(CGFloat)size {
    if (@available(iOS 9.0, *)) {
        return [UIFont fontWithName:@"PingFangSC-Medium" size:size];
    } else if (@available(iOS 8.2, *)) {
        return [UIFont systemFontOfSize:size weight:UIFontWeightMedium];
    } else {
        // Fallback on earlier versions
        return [UIFont systemFontOfSize:size];
    }
}

+ (UIFont *)pingFangSCSemiboldFontOfSize:(CGFloat)size {
    if (@available(iOS 9.0, *)) {
        return [UIFont fontWithName:@"PingFangSC-Semibold" size:size];
    } else if (@available(iOS 8.2, *)) {
        return [UIFont systemFontOfSize:size weight:UIFontWeightSemibold];
    } else {
        // Fallback on earlier versions
        return [UIFont systemFontOfSize:size];
    }
}

@end
