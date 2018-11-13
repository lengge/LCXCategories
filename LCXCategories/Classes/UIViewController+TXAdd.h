//
//  UIViewController+TXAdd.h
//  TXFutures
//
//  Created by dong on 2018/10/9.
//  Copyright © 2018年 Shanghai Tianxi Information Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (TXAdd)

/**
 Push的参数字典
 */
@property (nonatomic, strong) NSDictionary<NSString *, id> *pushParameters;

/**
 Pop的参数字典
 */
@property (nonatomic, strong) NSDictionary<NSString *, id> *popParameters;

/**
 通过Clas类名反射创建控制器
 @param className 类名
 @param parameters 参数
 @return 控制器实例
 */
+ (instancetype)controllerWithClassName:(NSString *)className parameters:(NSDictionary *)parameters;

@end
