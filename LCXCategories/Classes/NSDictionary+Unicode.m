//
//  NSDictionary+Unicode.m
//  TXFutures
//
//  Created by dong on 2018/9/7.
//  Copyright © 2018年 Shanghai Tianxi Information Technology Co., Ltd. All rights reserved.
//

#import "NSDictionary+Unicode.h"
#import <objc/runtime.h>

@implementation NSDictionary (Unicode)

+ (void)load {
#if DEBUG
    Method descriptionMethod = class_getInstanceMethod(self, @selector(description));
    Method tx_descriptionMethod = class_getInstanceMethod(self, @selector(tx_description));
    method_exchangeImplementations(descriptionMethod, tx_descriptionMethod);
    
    Method descriptionWithLocaleMethod = class_getInstanceMethod(self, @selector(descriptionWithLocale:));
    Method tx_descriptionWithLocaleMethod = class_getInstanceMethod(self, @selector(tx_descriptionWithLocale:));
    method_exchangeImplementations(descriptionWithLocaleMethod, tx_descriptionWithLocaleMethod);
#endif
}

- (NSString *)tx_description {
    NSString *desc = [self tx_description];
    
    NSString *unicodeDesc = [NSString stringWithCString:[desc cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding];
    
    if (unicodeDesc) {
        return unicodeDesc;
    }
    return desc;
}

- (NSString *)tx_descriptionWithLocale:(id)locale  {
    NSString *desc = [self tx_descriptionWithLocale:locale];
    
    NSString *unicodeDesc = [NSString stringWithCString:[desc cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding];
    
    if (unicodeDesc) {
        return unicodeDesc;
    }
    return desc;
}

@end
