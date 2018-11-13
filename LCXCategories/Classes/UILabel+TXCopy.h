//
//  UILabel+TXCopy.h
//  TXFutures
//
//  Created by dong on 2018/9/26.
//  Copyright © 2018年 Shanghai Tianxi Information Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (TXCopy)

@property (nonatomic, assign, getter=isCanCopy) IBInspectable BOOL canCopy;

@end
