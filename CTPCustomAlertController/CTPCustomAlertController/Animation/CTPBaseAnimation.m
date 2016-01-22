//
//  CTPBaseAnimation.m
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/20.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import "CTPBaseAnimation.h"

@interface CTPBaseAnimation ()

@property (nonatomic, assign) BOOL isPresenting;

@end

@implementation CTPBaseAnimation

- (instancetype)initWithIsPresenting:(BOOL)isPresenting
{
    if (self = [super init]) {
        self.isPresenting = isPresenting;
    }
    return self;
}

+ (instancetype)alertAnimationIsPresenting:(BOOL)isPresenting
{
    return [[self alloc]initWithIsPresenting:isPresenting];
}

// override this moethod
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if (_isPresenting) {
        [self presentAnimateTransition:transitionContext];
    }else {
        [self dismissAnimateTransition:transitionContext];
    }
}

- (void)presentAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
}

- (void)dismissAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
}



@end
