//
//  CTPBaseAnimation.h
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/20.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTPCustomAlertController.h"
#import "CTPNaviagtionController.h"

@interface CTPBaseAnimation : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign, readonly) BOOL isPresenting; // present . dismiss


+ (instancetype)alertAnimationIsPresenting:(BOOL)isPresenting;

@end
