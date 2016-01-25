//
//  CTBaseFloatingController.h
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/22.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CTPFloatingViewController.h"
#import "CTPBaseFloatingView.h"

@protocol CTBaseFloatingProtocol <NSObject>

@end

//todo:遵循CTBaseFloatingView的协议

@protocol CTPBaseFloatingViewDataSource,CTPBaseFloatingViewDelegate;

@interface CTBaseFloatingController : NSObject<CTPBaseFloatingViewDataSource,CTPBaseFloatingViewDelegate>

/**
 *  为了调起公共发送的服务
 */
@property (nonatomic, weak) CTPFloatingViewController *rootViewController;

@property (nonatomic, weak) CTPBaseFloatingView *floatingView;


@end
