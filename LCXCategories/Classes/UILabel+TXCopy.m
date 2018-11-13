//
//  UILabel+TXCopy.m
//  TXFutures
//
//  Created by dong on 2018/9/26.
//  Copyright © 2018年 Shanghai Tianxi Information Technology Co., Ltd. All rights reserved.
//

#import "UILabel+TXCopy.h"
#import <objc/runtime.h>

static const void * TXLabelCanCopyKey = "tx.label.cancopy.key";
static const void * TXLabelLongPressGestureKey = "tx.label.longpressgesture.key";

@interface UILabel ()

@property (nonatomic, weak) UILongPressGestureRecognizer *longPressGesture;

@end

@implementation UILabel (TXCopy)

- (void)setCanCopy:(BOOL)canCopy {
    objc_setAssociatedObject(self, TXLabelCanCopyKey, @(canCopy), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.userInteractionEnabled = canCopy;
    if (canCopy) {
        if (!self.longPressGesture) {
            UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
            self.longPressGesture = longPressGesture;
        }
    } else {
        self.longPressGesture = nil;
    }
}

- (BOOL)isCanCopy {
    return [objc_getAssociatedObject(self, TXLabelCanCopyKey) boolValue];
}

- (void)setLongPressGesture:(UILongPressGestureRecognizer *)longPressGesture {
    if (longPressGesture) {
        [self addGestureRecognizer:longPressGesture];
    } else {
        [self removeGestureRecognizer:self.longPressGesture];
    }
    objc_setAssociatedObject(self, TXLabelLongPressGestureKey, longPressGesture, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILongPressGestureRecognizer *)longPressGesture {
    return objc_getAssociatedObject(self, TXLabelLongPressGestureKey);
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return (action == @selector(copy:));
}

- (void)copy:(id)sender {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.text;
}

- (void)longPressAction:(UILongPressGestureRecognizer *)longPressGesture {
    if (longPressGesture.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
        [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
    }
}

@end
