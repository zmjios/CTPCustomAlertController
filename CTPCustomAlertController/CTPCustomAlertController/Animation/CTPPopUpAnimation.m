//
//  CTPPopUpAnimation.m
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/20.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import "CTPPopUpAnimation.h"

@implementation CTPPopUpAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if (self.isPresenting) {
        return 0.3;
    }
    return 0.25;
}

- (void)presentAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *controller = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CTPCustomAlertController *alertController = nil;
    if ([controller isKindOfClass:[CTPNaviagtionController class]]) {
        alertController = ((CTPNaviagtionController *)controller).viewControllers.firstObject;
    }else
    {
        alertController = (CTPCustomAlertController *)controller;
    }
    
    
    alertController.backgroundView.alpha = 0.0;
    alertController.alertView.alpha = 0.0;
    alertController.alertView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:controller.view];
    
    [UIView animateWithDuration:0.10 animations:^{
        
        alertController.backgroundView.alpha = 1.0;
        alertController.alertView.alpha = 1.0;
        alertController.alertView.transform = CGAffineTransformMakeScale(1.2, 1.2);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.2 animations:^{
            
            alertController.alertView.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            
            [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        }];
    }];
    
}

- (void)dismissAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{

    UIViewController *controller = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    CTPCustomAlertController *alertController = nil;
    
    if ([controller isKindOfClass:[CTPNaviagtionController class]]) {
        alertController = ((CTPNaviagtionController *)controller).viewControllers.firstObject;
    }else
    {
        alertController = (CTPCustomAlertController *)controller;
    }
    
//    UIView *containerView = [transitionContext containerView];
//    NSLog(@"containerView = %@",containerView);
//    [containerView insertSubview:controller.view belowSubview:<#(nonnull UIView *)#>];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        alertController.backgroundView.alpha = 0.0;
        alertController.alertView.alpha = 0.0;
        alertController.alertView.transform = CGAffineTransformMakeScale(0.9, 0.9);
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}


@end
