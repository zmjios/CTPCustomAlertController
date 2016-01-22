//
//  CTPBaseFloatingView.h
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/21.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 *  浮层view定义四种基本类型
 */

typedef NS_ENUM(NSInteger,CTPFloatingViewType) {
    
    CTPFloatingViewPassword  = 0,
    CTPFloatingViewFingerprint = 1,
    CTPFloatingViewWallet = 2,
    CTPFloatingViewBankList = 3,
};


@protocol CTPBaseShowViewDelegate;
@protocol CTPBaseShowViewDataSource;

@interface CTPBaseFloatingView : UIView

//delegate
@property (nonatomic, weak) id <CTPBaseShowViewDelegate> delegate;
@property (nonatomic, weak) id <CTPBaseShowViewDataSource> dataSource;

//dataSource
@property (nonatomic, copy) void (^topLeftAction)(void);
@property (nonatomic, copy) void (^topRightAction)(void);
@property (nonatomic, copy) void (^bottomAction)(void);
@property (nonatomic, copy) void (^didSelectedAction)(NSInteger row);

+ (instancetype)floatingViewWithType:(CTPFloatingViewType)type;

@end


@protocol CTPBaseFloatingViewDelegate <NSObject>

@optional
- (void)floatingView:(CTPBaseFloatingView *)floatingView didSelectRowAtIndex:(NSIndexPath *)indexPath;

- (void)floatingViewWithBottomAction:(CTPBaseFloatingView *)showView;

- (CGFloat)floatingVie:(CTPBaseFloatingView *)floatingView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

@end


@protocol CTPBaseFloatingViewDataSource <NSObject>

@optional
- (NSString *)showViewTopMiddleInfoItem;


- (NSInteger)showViewNumberOfRows;
- (UITableViewCell *)floatingView:(CTPBaseFloatingView *)showView cellForRowAtIndex:(NSIndexPath *)indexPath;
- (UIView *)floatingViewBottomSubView:(CTPBaseFloatingView *)showView;


- (NSString *)floatingViewBottomInfo:(CTPBaseFloatingView *)showView;



@end

