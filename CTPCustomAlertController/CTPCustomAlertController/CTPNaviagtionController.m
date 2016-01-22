//
//  CTPNaviagtionController.m
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/21.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import "CTPNaviagtionController.h"

@implementation CTPNaviagtionController


- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    if (self = [super initWithRootViewController:rootViewController]) {
       
        [self config];
    }
    
    
    return self;
}



- (void)config
{
    self.providesPresentationContextTransitionStyle = YES;
    self.definesPresentationContext = YES;
    self.modalPresentationStyle = UIModalPresentationCustom;
    self.transitioningDelegate = self;
    
    
    self.navigationBarHidden = YES;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor greenColor];
}

@end
