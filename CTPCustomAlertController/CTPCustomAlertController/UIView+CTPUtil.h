//
//  UIView+CTPUtil.h
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/20.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CTPUtil)

+ (instancetype)createViewFromNib;

+ (instancetype)createViewFromNibName:(NSString *)nibName;

- (UIViewController*)viewController;

@end
