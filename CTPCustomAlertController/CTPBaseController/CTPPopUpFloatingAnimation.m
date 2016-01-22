//
//  CTPPopUpFloatingAnimation.m
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/22.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import "CTPPopUpFloatingAnimation.h"
#import "CTPFloatingViewController.h"

@implementation CTPPopUpFloatingAnimation


- (NSTimeInterval)transitionDuration:(id<CTPAnimationContextTransitioning>)transitionContext
{
    return 0.5;
}


- (void)animateTransition:(id<CTPAnimationContextTransitioning>)transitionContext
{
    CTPFloatingViewController *viewController = [transitionContext viewController];
    CTPBaseFloatingView *fromView = [transitionContext viewForKey:CTPAnimationContextFromViewKey];
    CTPBaseFloatingView *toView = [transitionContext viewForKey:CTPAnimationContextToViewKey];
    
    UIView *containerView = [transitionContext containerView];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration/2
                          delay:0
                        options: UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         
                         fromView.alpha = 0.0f;
                         
                     }
                     completion:^(BOOL finished) {
                         
                         [fromView removeFromSuperview];
                         
                         //show push view
                         [containerView addSubview:toView];
                         viewController.topView = toView;
                         [viewController layoutTopView];
                         
                         
                         toView.layer.transform = CATransform3DMakeScale(1.2f, 1.2f, 1.0f);
                         toView.alpha = 0.0f;
                         
                         [UIView animateWithDuration:duration/2
                                               delay:0.0
                                             options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState
                                          animations:^{
                                              
                                              toView.layer.transform = CATransform3DIdentity;
                                              toView.alpha = 1.0f;
                                              
                                          } completion:^(BOOL finished) {
                                              
                                              
                                          }];
                         
                     }];
}


@end
