//
//  CTPBaseFloatingView.m
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/21.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import "CTPBaseFloatingView.h"
#import "UIView+RelativeLayout.h"

#define CTColorHex(c) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:((c)&0xFF)/255.0 alpha:1.0]
#define CTColorHexA(c,a) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:((c)&0xFF)/255.0 alpha:(a)]

@interface CTPBaseFloatingView ()

@property (nonatomic, assign) CTPFloatingViewType type;

@property (nonatomic, strong) UIView *topContainerView;
@property (nonatomic, strong) UITableView *middleView;
@property (nonatomic, strong) UIView *bottomContainerView;
@property (nonatomic, strong) UIView *describeInfoView;

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation CTPBaseFloatingView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


//+ (CTPBaseFloatingView *)floatingViewWithType:(CTPFloatingViewType)type
//{
//    
//}


- (instancetype)initWithController:(CTBaseFloatingController *)controller
{
    if (self = [super initWithFrame:CGRectZero]) {
        
        self.controller = controller;
        self.delegate = controller;
        self.dataSource = controller;
        
        [self addContentView];
    }
    
    return self;
}


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
    
    self.frame = CGRectMake(10, 64, [[UIScreen mainScreen] bounds].size.width - 20, 0);
    [self setBackgroundColor:CTColorHex(0xf0f0f0)];
    self.layer.cornerRadius = 5.0;
    
    self.middleView.height = 44*[self.dataSource floatingViewNumberOfRows];
    [_middleView layoutRelativeOptions:UIViewLayoutBelow withView:self.topContainerView];
    [_bottomContainerView layoutRelativeOptions:UIViewLayoutBelow withView:self.middleView];
    [_describeInfoView layoutRelativeOptions:UIViewLayoutBelow withView:self.bottomContainerView];
    self.height = self.topContainerView.height + self.middleView.height + self.bottomContainerView.height + self.describeInfoView.height;
}


- (void)addTopContainerView
{
    _topContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width - 20, 80)];
    _topContainerView.backgroundColor = [UIColor clearColor];
    [self addSubview:_topContainerView];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, _topContainerView.width -  20, 20)];
    _titleLabel.backgroundColor = [UIColor redColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.topContainerView addSubview:_titleLabel];
    
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(floatingViewTopMiddleInfoItem)]) {
        _titleLabel.text = [self.dataSource floatingViewTopMiddleInfoItem];
    }
    
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(topViewHeight:)]) {
        _topContainerView.height = [self.dataSource topViewHeight:self];
    }
    
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(topLeftItem:)]) {
        
        UIButton *leftButton = [self.dataSource topLeftItem:self];
        [self.topContainerView addSubview:leftButton];
        leftButton.frame = CGRectMake(10, 10, 60, 60);
        //[leftButton addTarget:self action:@selector(goBackAction:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)addMiddleContainerView
{
    _middleView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width - 20, 0) style:UITableViewStylePlain];
    _middleView.delegate = self;
    _middleView.dataSource = self;
    _middleView.backgroundView = nil;
    _middleView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_middleView];
    
}


- (void)addBottomContainerView
{
    _bottomContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width - 20, 80)];
    _bottomContainerView.backgroundColor = [UIColor clearColor];
    [self addSubview:_bottomContainerView];
}


- (void)addDescribeInfoView
{
    _describeInfoView = [[UIView alloc] initWithFrame:CGRectMake(20, 0, [[UIScreen mainScreen] bounds].size.width - 60, 30)];
    _describeInfoView.backgroundColor = [UIColor grayColor];
    [self addSubview:_describeInfoView];
}





- (void)layoutSubviews
{
    [super layoutSubviews];

    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(floatingViewNumberOfRows)]) {
        return [self.dataSource floatingViewNumberOfRows];
    }
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(floatingView:cellForRowAtIndex:)]) {
        return [self.dataSource floatingView:self cellForRowAtIndex:indexPath];
    }
    
    return nil;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(floatingView:heightForRowAtIndexPath:)]) {
        return [self.dataSource floatingView:self heightForRowAtIndexPath:indexPath];
    }
    
    return 44;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(floatingView:didSelectRowAtIndex:)]) {
        [self.delegate floatingView:self didSelectRowAtIndex:indexPath];
    }
}



#pragma mark - action
- (void)goBackAction:(id)sender
{
    if (self.topLeftAction) {
        self.topLeftAction();
    }
}



@end
