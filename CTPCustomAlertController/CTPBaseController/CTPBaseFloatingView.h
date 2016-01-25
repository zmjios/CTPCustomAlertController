//
//  CTPBaseFloatingView.h
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/21.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "CTBaseFloatingController.h"


/**
 *  浮层view定义四种基本类型
 */

typedef NS_ENUM(NSInteger,CTPFloatingViewType) {
    
    CTPFloatingViewPassword  = 0,
    CTPFloatingViewFingerprint = 1,
    CTPFloatingViewWallet = 2,
    CTPFloatingViewBankList = 3,
};

@class CTBaseFloatingController;
@protocol CTPBaseFloatingViewDelegate;
@protocol CTPBaseFloatingViewDataSource;

@interface CTPBaseFloatingView : UIView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong, readonly) UIView *topContainerView;
@property (nonatomic, strong, readonly) UITableView *middleView;
@property (nonatomic, strong, readonly) UIView *bottomContainerView;
@property (nonatomic, strong, readonly) UIView *describeInfoView;

@property (nonatomic, strong) CTBaseFloatingController *controller;

//delegate
@property (nonatomic, weak) id <CTPBaseFloatingViewDelegate> delegate;
@property (nonatomic, weak) id <CTPBaseFloatingViewDataSource> dataSource;

//dataSource
@property (nonatomic, copy) void (^topLeftAction)(void);
@property (nonatomic, copy) void (^topRightAction)(void);
@property (nonatomic, copy) void (^bottomAction)(void);
@property (nonatomic, copy) void (^didSelectedAction)(NSInteger row);

//+ (CTPBaseFloatingView *)floatingViewWithType:(CTPFloatingViewType)type;


- (instancetype)initWithController:(CTBaseFloatingController *)controller;

@end



@protocol CTPBaseFloatingViewDelegate <NSObject>

@optional
- (void)floatingView:(CTPBaseFloatingView *)floatingView didSelectRowAtIndex:(NSIndexPath *)indexPath;

- (void)floatingViewWithBottomAction:(CTPBaseFloatingView *)floatingView;


@end


@protocol CTPBaseFloatingViewDataSource <NSObject>

- (UITableViewCell *)floatingView:(CTPBaseFloatingView *)floatingView cellForRowAtIndex:(NSIndexPath *)indexPath;

@optional
- (NSString *)floatingViewTopMiddleInfoItem;
- (CGFloat)topViewHeight:(CTPBaseFloatingView *)floatingView;

- (UIButton *)topLeftItem:(CTPBaseFloatingView *)floatingView;

- (NSInteger)floatingViewNumberOfRows;
- (CGFloat)floatingView:(CTPBaseFloatingView *)floatingView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UIView *)floatingViewBottomSubView:(CTPBaseFloatingView *)floatingView;

- (NSString *)floatingViewBottomInfo:(CTPBaseFloatingView *)floatingView;






@end

