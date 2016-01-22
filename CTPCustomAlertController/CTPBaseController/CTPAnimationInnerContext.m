//
//  CTPAnimationInnerContext.m
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/22.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import "CTPAnimationInnerContext.h"


NSString *const CTPAnimationContextFromViewKey = @"CTPAnimationContextFromViewKey";
NSString *const CTPAnimationContextToViewKey = @"CTPAnimationContextToViewKey";
NSString *const CTPAnimationContextViewControllerKey = @"CTPAnimationContextViewControllerKey";
NSString *const CTPAnimationContextContainerView = @"CTPAnimationContextContainerView";

@interface CTPAnimationInnerContext ()

@property (nonatomic, strong) NSDictionary *contextDic;


@end

@implementation CTPAnimationInnerContext

- (instancetype)initWithViewController:(UIViewController *)viewController fromView:(UIView *)fromView toView:(UIView *)toView containerView:(UIView *)containerView
{
    if (self = [super init])
    {
        self.contextDic = @{CTPAnimationContextFromViewKey:fromView,
                            CTPAnimationContextToViewKey:toView,
                            CTPAnimationContextViewControllerKey:viewController,
                            CTPAnimationContextContainerView:containerView
                            };
        
    }
    
    return self;
}


- (nullable __kindof UIViewController *)viewController
{
    return self.contextDic[CTPAnimationContextViewControllerKey];
}

- (nullable __kindof UIView *)viewForKey:(NSString *)key
{
    return self.contextDic[key];
}

// The view in which the animated transition is taking place.
- (UIView *)containerView
{
    return self.contextDic[CTPAnimationContextContainerView];
}

@end
