//
//  UIButton+TXAdd.m
//  TXFutures
//
//  Created by dong on 2018/9/26.
//  Copyright © 2018年 Shanghai Tianxi Information Technology Co., Ltd. All rights reserved.
//

#import "UIButton+TXAdd.h"

@implementation UIButton (TXAdd)

- (void)setupImageStyle:(TXButtonImageStyle)imageStyle
                spacing:(CGFloat)spacing {
    if (self.imageView.image == nil ||
        self.titleLabel.text == nil) {
        return;
    }
    
    switch (imageStyle) {
        case TXButtonImageStyleLeft:
        {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
            break;
        }
        case TXButtonImageStyleRight:
        {
            CGFloat labelWidth = CGRectGetWidth(self.titleLabel.frame);
            CGFloat imageViewWidth = CGRectGetWidth(self.imageView.frame);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageViewWidth, 0, imageViewWidth + spacing);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth, 0, -labelWidth);
            break;
        }
        case TXButtonImageStyleTop:
        {
            CGFloat buttonCenterX = CGRectGetMidX(self.bounds);
            CGFloat labelCenterX = CGRectGetMidX(self.titleLabel.frame);
            CGFloat imageViewCenterX = CGRectGetMidX(self.imageView.frame);
            CGFloat buttonHeight = CGRectGetHeight(self.bounds);
            CGFloat labelHeight = CGRectGetHeight(self.titleLabel.frame);
            CGFloat labelY = CGRectGetMinY(self.titleLabel.frame);
            CGFloat imageViewHeight = CGRectGetHeight(self.imageView.frame);
            CGFloat imageViewY = CGRectGetMinY(self.imageView.frame);
            CGFloat totalHeight = labelHeight + imageViewHeight + spacing;
            self.titleEdgeInsets = UIEdgeInsetsMake((buttonHeight - totalHeight) / 2 + imageViewHeight + spacing - labelY, -(labelCenterX - buttonCenterX), -((buttonHeight - totalHeight) / 2 + imageViewHeight + spacing - labelY), labelCenterX - buttonCenterX);
            self.imageEdgeInsets = UIEdgeInsetsMake((buttonHeight - totalHeight) / 2 - imageViewY, buttonCenterX - imageViewCenterX, -((buttonHeight - totalHeight) / 2 - imageViewY), -(buttonCenterX - imageViewCenterX));
            break;
        }
        case TXButtonImageStyleBottom:
        {
            CGFloat buttonCenterX = CGRectGetMidX(self.bounds);
            CGFloat labelCenterX = CGRectGetMidX(self.titleLabel.frame);
            CGFloat imageViewCenterX = CGRectGetMidX(self.imageView.frame);
            CGFloat buttonHeight = CGRectGetHeight(self.bounds);
            CGFloat labelHeight = CGRectGetHeight(self.titleLabel.frame);
            CGFloat labelY = CGRectGetMinY(self.titleLabel.frame);
            CGFloat imageViewHeight = CGRectGetHeight(self.imageView.frame);
            CGFloat imageViewY = CGRectGetMinY(self.imageView.frame);
            CGFloat totalHeight = labelHeight + imageViewHeight + spacing;
            self.titleEdgeInsets = UIEdgeInsetsMake((buttonHeight - totalHeight) / 2 - labelY, -(labelCenterX - buttonCenterX), -((buttonHeight - totalHeight) / 2 - labelY), labelCenterX - buttonCenterX);
            self.imageEdgeInsets = UIEdgeInsetsMake((buttonHeight - totalHeight) / 2 + labelHeight + spacing - imageViewY, buttonCenterX - imageViewCenterX, -((buttonHeight - totalHeight) / 2 + labelHeight + spacing - imageViewY), -(buttonCenterX - imageViewCenterX));
            break;
        }
            
        default:
            break;
    }
    
}

@end
