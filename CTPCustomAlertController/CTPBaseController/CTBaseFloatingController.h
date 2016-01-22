//
//  CTBaseFloatingController.h
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/22.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol CTBaseFloatingProtocol <NSObject>


@end

//todo:遵循CTBaseFloatingView的协议

@interface CTBaseFloatingController : NSObject

/**
 *  为了调起公共发送的服务
 */
@property (nonatomic, weak) UIViewController *rootViewController;

@end
