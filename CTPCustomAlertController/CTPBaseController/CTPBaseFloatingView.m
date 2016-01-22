//
//  CTPBaseFloatingView.m
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/21.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import "CTPBaseFloatingView.h"

@interface CTPBaseFloatingView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, assign) CTPFloatingViewType type;

@property (nonatomic, strong) UIView *topContainerView;
@property (nonatomic, strong) UITableView *middleView;
@property (nonatomic, strong) UIView *bottomContainerView;
@property (nonatomic, strong) UIView *describeInfoView;

@end

@implementation CTPBaseFloatingView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addContentView];
    }
    
    return self;
}


- (void)addContentView
{
    [self addTopContainerView];
    [self addMiddleContainerView];
    [self addBottomContainerView];
    [self addDescribeInfoView];
}


- (void)addTopContainerView
{
//    _topContainerView = [[UIView alloc] init];
//    [self addSubview:_topContainerView];
    
    
}



- (void)addMiddleContainerView
{
    _middleView = [[UITableView alloc] init];
    //[self addSubview:<#(nonnull UIView *)#>]
    
}


- (void)addBottomContainerView
{
    
}


- (void)addDescribeInfoView
{
    
}




@end
