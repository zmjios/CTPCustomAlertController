//
//  CTPAnimationInnerContext.h
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/22.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTPAnimationContext.h"

@interface CTPAnimationInnerContext : NSObject<CTPAnimationContextTransitioning>


- (instancetype)initWithViewController:(UIViewController *)viewController fromView:(UIView *)fromView toView:(UIView *)toView containerView:(UIView *)containerView;



@end
