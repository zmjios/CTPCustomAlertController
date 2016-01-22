//
//  CTPAnimationContext.h
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/22.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const CTPAnimationContextFromViewKey;
extern NSString *const CTPAnimationContextToViewKey;
extern NSString *const CTPAnimationContextViewControllerKey;

@protocol CTPAnimationContextTransitioning <NSObject>

- (nullable __kindof UIViewController *)viewController;

- (nullable __kindof UIView *)viewForKey:(NSString *)key;

// The view in which the animated transition is taking place.
- (UIView *)containerView;

@end


@protocol CTPAnimatedTransitioning <NSObject>

// This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <CTPAnimationContextTransitioning>)transitionContext;


- (void)animateTransition:(nullable id <CTPAnimationContextTransitioning>)transitionContext;

@end
