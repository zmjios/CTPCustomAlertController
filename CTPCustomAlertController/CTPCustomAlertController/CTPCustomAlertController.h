//
//  CTPCustomAlertController.h
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/20.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CTPAlertTransitionAnimation) {
    CTPAlertTransitionAnimationPopUp = 0,
    CTPAlertTransitionAnimationScaleFade,
    CTPAlertTransitionAnimationDrop,
    CTPAlertTransitionAnimationCustom
};

@interface CTPCustomAlertController : UIViewController

@property (nonatomic, strong, readonly) UIView *alertView;

@property (nonatomic, strong) UIColor *backgroundColor; // set backgroundColor
@property (nonatomic, strong) UIView *backgroundView; // you set coustom view to it

@property (nonatomic, assign, readonly) CTPAlertTransitionAnimation transitionAnimation;

@property (nonatomic, assign, readonly) Class transitionAnimationClass;

@property (nonatomic, assign) BOOL backgoundTapDismissEnable;  // default NO

@property (nonatomic, assign) CGFloat alertViewOriginY;  // default center Y

@property (nonatomic, assign) CGFloat alertStyleEdging; //  when width frame equal to 0,or no width constraint ,this proprty will use, default to 15 edge


// alertView lifecycle block
@property (copy, nonatomic) void (^viewWillShowHandler)(UIView *alertView);
@property (copy, nonatomic) void (^viewDidShowHandler)(UIView *alertView);
@property (copy, nonatomic) void (^viewWillHideHandler)(UIView *alertView);
@property (copy, nonatomic) void (^viewDidHideHandler)(UIView *alertView);

// dismiss controller completed block
@property (nonatomic, copy) void (^dismissComplete)(void);


+ (instancetype)alertControllerWithAlertView:(UIView *)alertView;

+ (instancetype)alertControllerWithAlertView:(UIView *)alertView transitionAnimation:(CTPAlertTransitionAnimation)transitionAnimation;

+ (instancetype)alertControllerWithAlertView:(UIView *)alertView transitionAnimationClass:(Class)transitionAnimationClass;

- (void)dismissViewControllerAnimated:(BOOL)animated;

@end

// Transition Animate
//@interface CTPCustomAlertController (TransitionAnimation)<UIViewControllerTransitioningDelegate>
//
//
//
//@end

