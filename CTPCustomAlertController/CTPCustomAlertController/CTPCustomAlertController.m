//
//  CTPCustomAlertController.m
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/20.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import "CTPCustomAlertController.h"
#import "UIView+CTPAutoLayout.h"

@interface CTPCustomAlertController ()

@property (nonatomic, strong) UIView *alertView;

@property (nonatomic, assign) CTPAlertTransitionAnimation transitionAnimation;

@property (nonatomic, assign) Class transitionAnimationClass;

@property (nonatomic, weak) UITapGestureRecognizer *singleTap;

@property (nonatomic, strong) NSLayoutConstraint *alertViewCenterYConstraint;

@property (nonatomic, assign) CGFloat alertViewCenterYOffset;

@end

@implementation CTPCustomAlertController

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

- (instancetype)initWithAlertView:(UIView *)alertView transitionAnimation:(CTPAlertTransitionAnimation)transitionAnimation transitionAnimationClass:(Class)transitionAnimationClass
{
    if (self = [self initWithNibName:nil bundle:nil]) {
        _alertView = alertView;
        _transitionAnimation = transitionAnimation;
        _transitionAnimationClass = transitionAnimationClass;
    }
    return self;
}

+ (instancetype)alertControllerWithAlertView:(UIView *)alertView
{
    return [[self alloc]initWithAlertView:alertView
                      transitionAnimation:CTPAlertTransitionAnimationPopUp
                 transitionAnimationClass:nil];
}


+ (instancetype)alertControllerWithAlertView:(UIView *)alertView transitionAnimation:(CTPAlertTransitionAnimation)transitionAnimation
{
    return [[self alloc]initWithAlertView:alertView
                      transitionAnimation:transitionAnimation
                 transitionAnimationClass:nil];
}

+ (instancetype)alertControllerWithAlertView:(UIView *)alertView transitionAnimationClass:(Class)transitionAnimationClass
{
    return [[self alloc]initWithAlertView:alertView
                      transitionAnimation:CTPAlertTransitionAnimationCustom
                 transitionAnimationClass:transitionAnimationClass];
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self addBackgroundView];
    
    [self addSingleTapGesture];
    
    [self configureAlertView];
    
    [self.view layoutIfNeeded];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (_viewWillShowHandler) {
        _viewWillShowHandler(_alertView);
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (_viewDidShowHandler) {
        _viewDidShowHandler(_alertView);
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if (_viewWillHideHandler) {
        _viewWillHideHandler(_alertView);
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    if (_viewDidHideHandler) {
        _viewDidHideHandler(_alertView);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    //NSLog(@"%@ dealloc",NSStringFromClass([self class]));
}


#pragma mark - private 

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




#pragma mark - configure

- (void)configureController
{
//    self.providesPresentationContextTransitionStyle = YES;
//    self.definesPresentationContext = YES;
//    self.modalPresentationStyle = UIModalPresentationCustom;
//    self.transitioningDelegate = self;
    
    _backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    _backgoundTapDismissEnable = NO;
    _alertStyleEdging = 15;
}

- (void)configureAlertView
{
    if (_alertView == nil) {
        NSLog(@"%@: alertView is nil",NSStringFromClass([self class]));
        return;
    }
    _alertView.userInteractionEnabled = YES;
    [self.view addSubview:_alertView];
    _alertView.translatesAutoresizingMaskIntoConstraints = NO;
   [self layoutAlertStyleView];
}

- (void)configureAlertViewWidth
{
    // width, height
    if (!CGSizeEqualToSize(_alertView.frame.size,CGSizeZero)) {
        [_alertView addConstarintWidth:CGRectGetWidth(_alertView.frame) height:CGRectGetHeight(_alertView.frame)];
        
    }else {
        BOOL findAlertViewWidthConstraint = NO;
        for (NSLayoutConstraint *constraint in _alertView.constraints) {
            if (constraint.firstAttribute == NSLayoutAttributeWidth) {
                findAlertViewWidthConstraint = YES;
                break;
            }
        }
        
        if (!findAlertViewWidthConstraint) {
            [_alertView addConstarintWidth:CGRectGetWidth(self.view.frame)-2*_alertStyleEdging height:0];
        }
    }
}

#pragma mark - layout

- (void)layoutAlertStyleView
{
    // center X
    [self.view addConstraintCenterXToView:_alertView CenterYToView:nil];
    
    [self configureAlertViewWidth];
    
    // top Y
    _alertViewCenterYConstraint = [self.view addConstraintCenterYToView:_alertView constant:0];
    
    if (_alertViewOriginY > 0) {
        [_alertView layoutIfNeeded];
        _alertViewCenterYOffset = _alertViewOriginY - (CGRectGetHeight(self.view.frame) - CGRectGetHeight(_alertView.frame))/2;
        _alertViewCenterYConstraint.constant = _alertViewCenterYOffset;
    }else{
        _alertViewCenterYOffset = 0;
    }
}


- (void)dismissViewControllerAnimated:(BOOL)animated
{
    [self dismissViewControllerAnimated:YES completion:self.dismissComplete];
}

#pragma mark - action

- (void)singleTap:(UITapGestureRecognizer *)sender
{
    [self dismissViewControllerAnimated:YES];
}

#pragma mark - notifycation

- (void)keyboardWillShow:(NSNotification*)notification{
    CGRect keyboardRect = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGFloat alertViewBottomEdge = CGRectGetHeight(self.view.frame) -  CGRectGetMaxY(_alertView.frame);
    CGFloat differ = CGRectGetHeight(keyboardRect) - alertViewBottomEdge;
    
    if (differ > 0) {
        _alertViewCenterYConstraint.constant = _alertViewCenterYOffset - differ;
        [UIView animateWithDuration:0.25 animations:^{
            [self.view layoutIfNeeded];
        }];
    }
}

- (void)keyboardWillHide:(NSNotification*)notification{
    
    _alertViewCenterYConstraint.constant = _alertViewCenterYOffset;
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}


@end
