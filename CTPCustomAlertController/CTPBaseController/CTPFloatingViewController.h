//
//  CTPFloatingViewController.h
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/22.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTPBaseFloatingView.h"
#import "CTPFloatingDefine.h"
#import "CTPAnimationContext.h"

/**
 *  浮层 的 baseViewController
 */

typedef NS_ENUM(NSInteger,CTPFloatingViewControllerOperation) {
    
    CTPFloatingViewControllerPush = 0,
    CTPFloatingViewControllerPop = 1
};

@protocol CTPFloatingViewControllerTransitioningDelegate;

@interface CTPFloatingViewController : UIViewController

@property (nonatomic, assign) CTPFloatingViewAnimationType animationType;
@property (nonatomic, copy) NSMutableArray<__kindof CTPBaseFloatingView *> *viewList; // The current view stack.

@property (nonatomic, assign) BOOL backgoundTapDismissEnable;  // default NO
@property (nonatomic, strong) UIColor *backgroundColor; // set backgroundColor
@property (nonatomic, strong, readonly) UIView *backgroundView;   //黑色背景图

@property (nonatomic, strong) CTPBaseFloatingView *topView;

@property (nonatomic, weak) id<CTPFloatingViewControllerTransitioningDelegate> transtionViewDelegate;

- (instancetype)initWithRootView:(CTPBaseFloatingView *)rootView;

- (void)pushView:(CTPBaseFloatingView *)floatingView animated:(BOOL)animated;

- (void)pushView:(CTPBaseFloatingView *)floatingView animationType:(CTPFloatingViewAnimationType)animationType;

- (CTPBaseFloatingView *)popViewAnimated:(BOOL)animated;

- (NSArray<__kindof CTPBaseFloatingView *> *)popToView:(CTPBaseFloatingView *)view animated:(BOOL)animated;

- (NSArray<__kindof CTPBaseFloatingView *> *)popToRootViewAniamted:(BOOL)animated;


- (void)setViewList:(NSMutableArray<__kindof CTPBaseFloatingView *> *)viewList animated:(BOOL)animated;


- (void)layoutTopView;


@end



@protocol CTPFloatingViewControllerTransitioningDelegate <NSObject>

@optional
- (id <CTPAnimatedTransitioning>)floatingViewController:(CTPFloatingViewController *)floatingController
                              animationViewForOperation:(CTPFloatingViewControllerOperation)operation
                                               fromView:(CTPBaseFloatingView *)fromView
                                                 toView:(CTPBaseFloatingView *)toView;

@end
