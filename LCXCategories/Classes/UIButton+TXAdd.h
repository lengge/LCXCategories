//
//  UIButton+TXAdd.h
//  TXFutures
//
//  Created by dong on 2018/9/26.
//  Copyright © 2018年 Shanghai Tianxi Information Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TXButtonImageStyle) {
    TXButtonImageStyleLeft,      // 图片在左，文字在右，整体居中
    TXButtonImageStyleRight,     // 图片在右，文字在左，整体居中
    TXButtonImageStyleTop,       // 图片在上，文字在下，整体居中
    TXButtonImageStyleBottom,    // 图片在下，文字在上，整体居中
};

@interface UIButton (TXAdd)

/**
 设置按钮图片样式

 @param imageStyle 图片样式
 @param spacing 图片与文字间的间距
 */
- (void)setupImageStyle:(TXButtonImageStyle)imageStyle
                spacing:(CGFloat)spacing;

@end
