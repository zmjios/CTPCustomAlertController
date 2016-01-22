//
//  CTPNaviagtionController.h
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/21.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTPNaviagtionController : UINavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController;

@end


@interface CTPNaviagtionController (TransitionAnimation)<UIViewControllerTransitioningDelegate>



@end

