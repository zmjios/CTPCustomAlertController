//
//  UIView+CTPUtil.m
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/20.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import "UIView+CTPUtil.h"

@implementation UIView (CTPUtil)


+ (instancetype)createViewFromNibName:(NSString *)nibName
{
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
    return [nib objectAtIndex:0];
}

+ (instancetype)createViewFromNib
{
    return [self createViewFromNibName:NSStringFromClass(self.class)];
}

- (UIViewController*)viewController
{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

@end
