//
//  CTPSmoothFloatingAnimation.m
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/25.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import "CTPSmoothFloatingAnimation.h"
#import "CTPFloatingViewController.h"
#import "CTPFloatingScreenshootView.h"
#import "UIView+RelativeLayout.h"


#import "UITableView+Util.h"


@implementation CTPSmoothFloatingAnimation


- (NSTimeInterval)transitionDuration:(id<CTPAnimationContextTransitioning>)transitionContext
{
    return 2;
}


- (void)animateTransition:(id<CTPAnimationContextTransitioning>)transitionContext
{
    CTPFloatingViewController *viewController = [transitionContext viewController];
    CTPBaseFloatingView *fromView = [transitionContext viewForKey:CTPAnimationContextFromViewKey];
    CTPBaseFloatingView *toView = [transitionContext viewForKey:CTPAnimationContextToViewKey];
    
    UIView *containerView = [transitionContext containerView];
    
    CTPFloatingScreenshootView *screenshoot = [[CTPFloatingScreenshootView alloc] initWithFloatingView:fromView];
    [containerView addSubview:screenshoot];
    [containerView addSubview:toView];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    fromView.alpha = 1.0;
    toView.alpha = 0.0;
    screenshoot.alpha = 0.5;
    
    
    [UIView animateWithDuration:duration/2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        fromView.alpha = 0.0;
        screenshoot.alpha = 1.0;
        
        [screenshoot changeTopBottomLinePositionToView:toView];
        
    } completion:^(BOOL finished){
        
        toView.topContainerView.transform = CGAffineTransformMakeTranslation(0, -toView.topContainerView.height);
        toView.middleView.transform = CGAffineTransformMakeTranslation(0, toView.middleView.height + toView.bottomContainerView.height + toView.describeInfoView.height);
        toView.bottomContainerView.transform = CGAffineTransformMakeTranslation(0, toView.bottomContainerView.height + toView.describeInfoView.height);
        toView.describeInfoView.transform = CGAffineTransformMakeTranslation(0, toView.describeInfoView.height);
        
        //[toView.middleView startSmoothAnimationWithDuration:duration/2];
        
        [UIView animateWithDuration:duration/2 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            toView.alpha = 1.0;
            toView.topContainerView.transform = CGAffineTransformIdentity;
            toView.middleView.transform = CGAffineTransformIdentity;
            toView.bottomContainerView.transform = CGAffineTransformIdentity;
            toView.describeInfoView.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished){
            
            if (finished) {
                [screenshoot removeFromSuperview];
            }
        }];
        
    }];
    
}




@end
