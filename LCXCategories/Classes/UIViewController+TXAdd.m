//
//  UIViewController+TXAdd.m
//  TXFutures
//
//  Created by dong on 2018/10/9.
//  Copyright © 2018年 Shanghai Tianxi Information Technology Co., Ltd. All rights reserved.
//

#import "UIViewController+TXAdd.h"
#import <objc/runtime.h>

const void * TXPushParametersKey = "TXPushParametersKey";

const void * TXPopParametersKey = "TXPopParametersKey";

@implementation UIViewController (TXAdd)
@dynamic pushParameters, popParameters;

+ (instancetype)controllerWithClassName:(NSString *)className parameters:(NSDictionary *)parameters {
    UIViewController *controller = [[NSClassFromString(className) alloc] init];
    // 使用runtime给对应的属性赋值，只能查到当前类的属性，父类的属性无法赋值
    if (parameters && parameters.count > 0) {
        unsigned int count = 0;
        objc_property_t * propertyList = class_copyPropertyList([controller class], &count);
        for (unsigned int i = 0; i < count; i++) {
            objc_property_t property = propertyList[i];
            NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
            if (parameters[propertyName]) {
                [controller setValue:parameters[propertyName] forKey:propertyName];
            }
        }
    }
    // 记录参数字典，如果需要给父类中的属性赋值，在控制器中从这个字典中取
    controller.pushParameters = parameters;
    
    return controller;
}

- (void)setPushParameters:(NSDictionary<NSString *,id> *)pushParameters {
    objc_setAssociatedObject(self, TXPushParametersKey, pushParameters, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDictionary<NSString *,id> *)pushParameters {
    return objc_getAssociatedObject(self, TXPushParametersKey);
}

- (void)setPopParameters:(NSDictionary<NSString *,id> *)popParameters {
    objc_setAssociatedObject(self, TXPopParametersKey, popParameters, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDictionary<NSString *,id> *)popParameters {
    return objc_getAssociatedObject(self, TXPopParametersKey);
}


@end
