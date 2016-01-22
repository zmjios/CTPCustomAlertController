//
//  UIView+CTPAutoLayout.h
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/20.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CTPAutoLayout)

- (void)addConstraintToView:(UIView *)view edageInset:(UIEdgeInsets)edageInset;

- (void)addConstarintWithView:(UIView *)view topView:(UIView *)topView leftView:(UIView *)leftView
                   bottomView:(UIView *)bottomView rightView:(UIView *)rightView edageInset:(UIEdgeInsets)edageInset;

- (void)addConstarintWithLeftView:(UIView *)leftView toRightView:(UIView *)rightView constarint:(CGFloat)constarint;

- (NSLayoutConstraint *)addConstarintWithTopView:(UIView *)topView toBottomView:(UIView *)bottomView constarint:(CGFloat)constarint;

- (void)addConstarintWidth:(CGFloat)width height:(CGFloat)height;

- (void)addConstarintEqualWithView:(UIView *)view widthToView:(UIView *)wView heightToView:(UIView *)hView;

- (NSLayoutConstraint *)addConstraintCenterYToView:(UIView *)yView constant:(CGFloat)constant;

- (void)addConstraintCenterXToView:(UIView *)xView CenterYToView:(UIView *)yView;

- (void)removeConstraintWithAttribte:(NSLayoutAttribute)attr;

- (void)removeConstraintWithView:(UIView *)view attribte:(NSLayoutAttribute)attr;

- (void)removeAllConstraints;

@end
