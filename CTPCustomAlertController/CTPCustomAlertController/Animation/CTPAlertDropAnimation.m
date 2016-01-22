//
//  CTPAlertDropAnimation.m
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/20.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import "CTPAlertDropAnimation.h"

@implementation CTPAlertDropAnimation



- (void)presentAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    CTPCustomAlertController *alertController = (CTPCustomAlertController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    alertController.backgroundView.alpha = 0.0;
    alertController.alertView.transform = CGAffineTransformMakeTranslation(0, CGRectGetMaxY(alertController.alertView.frame));
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:alertController.view];
    
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.65 initialSpringVelocity:0.5 options:0 animations:^{
        
        alertController.backgroundView.alpha = 1.0;
        alertController.alertView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (void)dismissAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    CTPCustomAlertController *alertController = (CTPCustomAlertController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [UIView animateWithDuration:0.25 animations:^{
        
        alertController.backgroundView.alpha = 0.0;
        alertController.alertView.transform = CGAffineTransformMakeTranslation(0, -CGRectGetMaxY(alertController.alertView.frame));;
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];
    }];
}


@end
