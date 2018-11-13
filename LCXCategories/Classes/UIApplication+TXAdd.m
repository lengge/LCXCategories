//
//  UIApplication+TXAdd.m
//  TXFutures
//
//  Created by dong on 2018/10/9.
//  Copyright © 2018年 Shanghai Tianxi Information Technology Co., Ltd. All rights reserved.
//

#import "UIApplication+TXAdd.h"

@implementation UIApplication (TXAdd)

+ (BOOL)openURL:(NSURL*)url {
    __block BOOL openSuccess = YES;
    UIApplication *application = [UIApplication sharedApplication];
    if (@available(iOS 10.0, *)) {
        [application openURL:url options:@{UIApplicationOpenURLOptionsSourceApplicationKey : @YES} completionHandler:^(BOOL success) {
            openSuccess = success;
        }];
    } else {
        openSuccess =  [application openURL:url];
    }
    return openSuccess;
}

@end
