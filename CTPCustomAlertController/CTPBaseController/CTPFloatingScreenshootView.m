//
//  CTPFloatingScreenshootView.m
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/25.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import "CTPFloatingScreenshootView.h"
#import "UIView+RelativeLayout.h"

@interface CTPFloatingScreenshootView ()

@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UIView *bottomLine;

@end

@implementation CTPFloatingScreenshootView

- (instancetype)initWithFloatingView:(CTPBaseFloatingView *)floatingView
{
    if (self = [super initWithFrame:floatingView.frame]) {
        
        UIView *tableView = floatingView.middleView;
        
        self.backgroundColor = floatingView.backgroundColor;
        //[screenshootView setBackgroundColor:[UIColor colorWithRed:240.0/255 green:240/255.0 blue:240/255.0 alpha:1]];
        self.layer.cornerRadius = floatingView.layer.cornerRadius;
        
        self.topLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMinY(tableView.frame), CGRectGetWidth(self.bounds), 1)];
        self.topLine.backgroundColor = [UIColor colorWithRed:200.0/255 green:200.0/255 blue:200.0/255 alpha:1];
        self.bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(tableView.frame) - 1, CGRectGetWidth(self.bounds), 1)];
        self.bottomLine.backgroundColor = [UIColor colorWithRed:200.0/255 green:200.0/255 blue:200.0/255 alpha:1];


        [self addSubview:self.topLine];
        [self addSubview:self.bottomLine];
        
        UIView *middleView = [[UIView alloc] initWithFrame:tableView.frame];
        middleView.backgroundColor = [UIColor whiteColor];
        [self addSubview:middleView];

    }
    
    return self;
}


- (void)changeTopBottomLinePositionToView:(CTPBaseFloatingView *)toView
{
    CGRect convertRect = [self convertRect:toView.middleView.frame fromView:toView];
    
    NSLog(@"=======toView:%@",NSStringFromCGRect(toView.frame));
    NSLog(@"=======%@",NSStringFromCGRect(convertRect));
    
    self.topLine.minY = CGRectGetMinY(convertRect) - 1;
    self.bottomLine.minY = CGRectGetMaxY(convertRect) - 1;
}

@end
