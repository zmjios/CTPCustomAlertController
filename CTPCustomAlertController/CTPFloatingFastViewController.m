//
//  CTPFloatingFastViewController.m
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/22.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import "CTPFloatingFastViewController.h"
#import "CTPHomeFloatingView.h"
#import "CTPFingerPrinterFloatingView.h"



@interface CTPFloatingFastViewController ()

@end

@implementation CTPFloatingFastViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    
    CTPHomeFloatingView *homeView = [[CTPHomeFloatingView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    homeView.backgroundColor = [UIColor redColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"TEST" forState:UIControlStateNormal];
    button.frame = CGRectMake(50, 50, 100, 100);
    [button addTarget:self action:@selector(showSecondView) forControlEvents:UIControlEventTouchUpInside];
    [homeView addSubview:button];
    
    
    [self.backgroundView addSubview:homeView];
    self.topView = homeView;
    [self.viewList addObject:homeView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (void)showSecondView
{
    CTPFingerPrinterFloatingView *fView = [[CTPFingerPrinterFloatingView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    fView.backgroundColor = [UIColor greenColor];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"CLOSED" forState:UIControlStateNormal];
    button.frame = CGRectMake(10, 10, 80, 40);
    [button addTarget:self action:@selector(closeView) forControlEvents:UIControlEventTouchUpInside];
    [fView addSubview:button];
    

    [self pushView:fView animated:YES];

}



- (void)closeView
{
    [self popViewAnimated:YES];
}

@end
