//
//  CTPAlertScaleFadeAnimation.m
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/20.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import "CTPAlertScaleFadeAnimation.h"

@implementation CTPAlertScaleFadeAnimation


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3;
}

- (void)presentAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    CTPCustomAlertController *alertController = (CTPCustomAlertController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    alertController.backgroundView.alpha = 0.0;
    alertController.alertView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:alertController.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        alertController.backgroundView.alpha = 1.0;
        alertController.alertView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];
    }];
}

- (void)dismissAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    CTPCustomAlertController *alertController = (CTPCustomAlertController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        alertController.backgroundView.alpha = 0.0;
        alertController.alertView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}



@end
