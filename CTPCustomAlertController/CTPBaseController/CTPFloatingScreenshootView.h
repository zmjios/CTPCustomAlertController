//
//  CTPFloatingScreenshootView.h
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/25.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTPBaseFloatingView.h"

@interface CTPFloatingScreenshootView : UIView


- (instancetype)initWithFloatingView:(CTPBaseFloatingView *)floatingView;


- (void)changeTopBottomLinePositionToView:(CTPBaseFloatingView *)toView;

@end
