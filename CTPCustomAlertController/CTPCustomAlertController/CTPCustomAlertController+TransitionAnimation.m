//
//  CTPCustomAlertController+TransitionAnimation.m
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/20.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import "CTPCustomAlertController.h"
#import "CTPPopUpAnimation.h"
#import "CTPAlertScaleFadeAnimation.h"
#import "CTPAlertDropAnimation.h"

@implementation CTPCustomAlertController (TransitionAnimation)

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    switch (self.transitionAnimation) {
        case CTPAlertTransitionAnimationPopUp:
            return [CTPPopUpAnimation alertAnimationIsPresenting:YES];
        case CTPAlertTransitionAnimationScaleFade:
            return [CTPAlertScaleFadeAnimation alertAnimationIsPresenting:YES];
        case CTPAlertTransitionAnimationDrop:
            return [CTPAlertDropAnimation alertAnimationIsPresenting:YES];
        case CTPAlertTransitionAnimationCustom:
            return [self.class alertAnimationIsPresenting:YES];
        default:
            return nil;
    }
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    switch (self.transitionAnimation) {
        case CTPAlertTransitionAnimationPopUp:
            return [CTPPopUpAnimation alertAnimationIsPresenting:NO];
        case CTPAlertTransitionAnimationScaleFade:
            return [CTPAlertScaleFadeAnimation alertAnimationIsPresenting:NO];
        case CTPAlertTransitionAnimationDrop:
            return [CTPAlertDropAnimation alertAnimationIsPresenting:NO];
        case CTPAlertTransitionAnimationCustom:
            return [self.class alertAnimationIsPresenting:NO];
        default:
            return nil;
    }
}


@end
