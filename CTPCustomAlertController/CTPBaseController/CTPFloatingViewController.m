//
//  CTPFloatingViewController.m
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/22.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import "CTPFloatingViewController.h"
#import "UIView+CTPAutoLayout.h"
#import "CTPPopUpFloatingAnimation.h"

#import "CTPAnimationInnerContext.h"

@interface CTPFloatingViewController ()

@property (nonatomic, strong) UIView *backgroundView;   //黑色背景图
@property (nonatomic, strong) UITapGestureRecognizer *singleTap;   //点击黑色背景手势

@property (nonatomic, strong) NSLayoutConstraint *topViewCenterYConstraint;

@property (nonatomic, assign) CTPFloatingViewControllerOperation operation;

@end

@implementation CTPFloatingViewController


#pragma mark - init

- (instancetype)init
{
    if (self = [super init]) {
        [self configureController];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self configureController];
    }
    return self;
}


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self configureController];
    }
    return self;
}

- (instancetype)initWithRootView:(CTPBaseFloatingView *)rootView
{
    if (self = [super init]) {
        
        [self configureController];
        
        [self.viewList addObject:rootView];
    }
    
    return self;
}


#pragma mark - public

- (void)pushView:(CTPBaseFloatingView *)floatingView animated:(BOOL)animated
{
    self.topView = self.viewList.lastObject;
    CTPBaseFloatingView *currentView = self.topView;
    
    self.operation = CTPFloatingViewControllerPush;
    
    if ([self.viewList containsObject:floatingView]) {
        [self.viewList removeObject:floatingView];
    }
    
    [self.viewList addObject:floatingView];
    
    if (animated) {
        
        [self showAnimationFromView:currentView toView:floatingView animationType:self.animationType];
    }else
    {
        [currentView removeFromSuperview];
        [self.backgroundView addSubview:floatingView];
    }
}

- (void)pushView:(CTPBaseFloatingView *)floatingView animationType:(CTPFloatingViewAnimationType)animationType
{
    self.topView = self.viewList.lastObject;
    CTPBaseFloatingView *currentView = self.topView;
    
    self.operation = CTPFloatingViewControllerPush;
    
    if ([self.viewList containsObject:floatingView]) {
        [self.viewList removeObject:floatingView];
    }
    
    [self.viewList addObject:floatingView];
    
    
    
    [self showAnimationFromView:currentView toView:floatingView animationType:animationType];
}


- (CTPBaseFloatingView *)popViewAnimated:(BOOL)animated
{
    if (self.viewList.count < 2) {
        return self.viewList.firstObject;
    }
    
    self.operation = CTPFloatingViewControllerPop;
    
    CTPBaseFloatingView *fromView = self.topView;
    CTPBaseFloatingView *toView = [self.viewList objectAtIndex:self.viewList.count - 2];
    
    [self.viewList removeLastObject];
    
    if (animated) {
        
        [self showAnimationFromView:fromView toView:toView animationType:self.animationType];
    }else
    {
        [fromView removeFromSuperview];
        [self.backgroundView addSubview:toView];
    }
    
    return toView;
}


- (NSArray<__kindof CTPBaseFloatingView *> *)popToView:(CTPBaseFloatingView *)toView animated:(BOOL)animated
{
    if (![self.viewList containsObject:toView]) {
        NSAssert(nil,@"toView must be in views stack");
    }
    if (self.viewList.count < 2) {
        return self.viewList;
    }
    
    self.operation = CTPFloatingViewControllerPop;
    
    CTPBaseFloatingView *fromView = self.topView;
    
    NSMutableArray *result = [NSMutableArray array];
    
    for (NSInteger i = [self.viewList indexOfObject:self.topView]; i  > [self.viewList indexOfObject:toView]; i --) {
        [result addObject:[self.viewList objectAtIndex:i]];
    }
    
    if (animated) {
        
        [self showAnimationFromView:fromView toView:toView animationType:self.animationType];
    }else
    {
        [fromView removeFromSuperview];
        [self.backgroundView addSubview:toView];
    }
    
    return result;
}


- (NSArray<__kindof CTPBaseFloatingView *> *)popToRootViewAniamted:(BOOL)animated
{
    CTPBaseFloatingView *toView = self.viewList.firstObject;

    return [self popToView:toView animated:YES];
}


#pragma mark - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addBackgroundView];
    [self addSingleTapGesture];
    
    [self.view layoutIfNeeded];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - layout
- (void)layoutTopView
{
    // center X
    self.topView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.backgroundView addConstraintCenterXToView:self.topView CenterYToView:nil];
    _topViewCenterYConstraint = [self.backgroundView addConstraintCenterYToView:self.topView constant:0];
     [self.topView addConstarintWidth:CGRectGetWidth(self.topView.frame) height:CGRectGetHeight(self.topView.frame)];
}

#pragma mark - action

- (void)singleTap:(UITapGestureRecognizer *)sender
{
    [self dismissViewControllerAnimated:NO completion:nil];
}


#pragma mark - private
- (void)configureController
{
    if (nil == _viewList) {
        _viewList = [NSMutableArray array];
    }
    _backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    _backgoundTapDismissEnable = NO;
    
    self.animationType = CTPFloatingViewPopUp;
}


- (void)addBackgroundView
{
    if (_backgroundView == nil) {
        UIView *backgroundView = [[UIView alloc]init];
        backgroundView.backgroundColor = _backgroundColor;
        _backgroundView = backgroundView;
    }
    _backgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view insertSubview:_backgroundView atIndex:0];
    [self.view addConstraintToView:_backgroundView edageInset:UIEdgeInsetsZero];
}

- (void)setBackgroundView:(UIView *)backgroundView
{
    if (_backgroundView == nil) {
        
        _backgroundView = backgroundView;
    } else if (_backgroundView != backgroundView) {
        backgroundView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view insertSubview:backgroundView aboveSubview:_backgroundView];
        [self.view addConstraintToView:backgroundView edageInset:UIEdgeInsetsZero];
        backgroundView.alpha = 0;
        [UIView animateWithDuration:0.3 animations:^{
            backgroundView.alpha = 1;
        } completion:^(BOOL finished) {
            [_backgroundView removeFromSuperview];
            _backgroundView = backgroundView;
            [self addSingleTapGesture];
        }];
    }
}

- (void)addSingleTapGesture
{
    self.view.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    singleTap.enabled = _backgoundTapDismissEnable;
    
    [_backgroundView addGestureRecognizer:singleTap];
    _singleTap = singleTap;
}

- (void)setBackgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable
{
    _backgoundTapDismissEnable = backgoundTapDismissEnable;
    _singleTap.enabled = backgoundTapDismissEnable;
}


- (void)showAnimationFromView:(CTPBaseFloatingView *)fromView toView:(CTPBaseFloatingView *)toView animationType:(CTPFloatingViewAnimationType)animationType
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    
    CTPAnimationInnerContext *context = [[CTPAnimationInnerContext alloc] initWithViewController:self fromView:fromView toView:toView containerView:self.backgroundView];
   
    id<CTPAnimatedTransitioning> animation = nil;
    if (self.transtionViewDelegate && [self.transtionViewDelegate respondsToSelector:@selector(floatingViewController:animationViewForOperation:fromView:toView:)]) {
       animation =  [self.transtionViewDelegate floatingViewController:self animationViewForOperation:self.operation fromView:fromView toView:toView];
    }else
    {
        animation = [[CTPPopUpFloatingAnimation alloc] init];
    }
    
    [animation animateTransition:context];
}


#pragma mark - notification

- (void)keyboardWillShow:(NSNotification*)notification
{
    CGRect keyboardRect = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGFloat topFloatingViewBottomEdge = CGRectGetHeight(self.view.frame) -  CGRectGetMaxY(self.topView.frame);
    
    CGFloat differ = CGRectGetHeight(keyboardRect) - topFloatingViewBottomEdge;
    
    if (differ > 0) {
        
        _topViewCenterYConstraint.constant = - differ;
        [UIView animateWithDuration:0.25 animations:^{
            [self.view layoutIfNeeded];
        }];
    }
}

- (void)keyboardWillHide:(NSNotification*)notification{
    
    _topViewCenterYConstraint.constant = 0;
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}



#pragma mark - property

- (void)setTopView:(CTPBaseFloatingView *)topView
{
    _topView = topView;
    [self layoutTopView];
}

// If animated is YES, then simulate a push or pop depending on whether the new top view controller was previously in the stack.
- (void)setViewList:(NSMutableArray<__kindof CTPBaseFloatingView *> *)viewList animated:(BOOL)animated
{
    CTPBaseFloatingView *oldTopView = self.topView;
    CTPBaseFloatingView *anewTopView = viewList.lastObject;
    
    [self.viewList removeAllObjects];
    [_viewList addObjectsFromArray:viewList];
    
    if (animated) {
        [self showAnimationFromView:oldTopView toView:anewTopView animationType:self.animationType];
    }
}


@end
