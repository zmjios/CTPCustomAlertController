//
//  ViewController.m
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/20.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import "ViewController.h"
#import "CTPCustomAlertController.h"
#import "CTPAlertView.h"
#import "CTPNaviagtionController.h"

#import "SecondViewController.h"


#import "CTPPopUpAnimation.h"
#import "CTPAlertScaleFadeAnimation.h"
#import "CTPAlertDropAnimation.h"


#import "CTPFloatingFastViewController.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) CTPNaviagtionController *presentNavi;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    UIButton *testButton = [UIButton buttonWithType:UIButtonTypeCustom];
    testButton.frame = CGRectMake(100, 100, self.view.bounds.size.width - 200, 100);
    [testButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [testButton setTitle:@"test" forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(gototest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButton];
    
    
    UIButton *testButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    testButton1.frame = CGRectMake(100, 300, self.view.bounds.size.width - 200, 100);
    [testButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [testButton1 setTitle:@"show" forState:UIControlStateNormal];
    [testButton1 addTarget:self action:@selector(gotoshow) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButton1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)gototest
{
    CTPAlertView *alertView = [CTPAlertView alertViewWithTitle:@"CTPAlertView" message:@"This is fhfhhfhfhfhfhfhfhfhfhhfhfhfhfhfhfhfhfhfhfa message, the alert view containt text and textfiled. " image:@"images"];
    
    [alertView addAction:[CTPAlertAction actionWithTitle:@"取消" style:CTPAlertActionStyleCancle handler:^(CTPAlertAction *action) {
        NSLog(@"%@",action.title);
    }]];
    
    // 弱引用alertView 否则 会循环引用
    __typeof (alertView) __weak weakAlertView = alertView;
    [alertView addAction:[CTPAlertAction actionWithTitle:@"确定" style:CTPAlertActionStyleDestructive handler:^(CTPAlertAction *action) {
        
//        NSLog(@"%@",action.title);
//        for (UITextField *textField in weakAlertView.textFieldArray) {
//            NSLog(@"%@",textField.text);
//        }
        
        SecondViewController *second = [[SecondViewController alloc] init];
        [self.presentNavi pushViewController:second animated:YES];
        
        
    }]];
    
//    [alertView addTextFieldWithConfigurationHandler:^(UITextField *textField) {
//        textField.placeholder = @"请输入账号";
//    }];
//    [alertView addTextFieldWithConfigurationHandler:^(UITextField *textField) {
//        textField.placeholder = @"请输入密码";
//    }];
    

    
    // first way to show
    CTPCustomAlertController *alertController = [CTPCustomAlertController alertControllerWithAlertView:alertView];
    
    [alertController setViewWillShowHandler:^(UIView *alertView) {
        NSLog(@"ViewWillShow");
    }];
    
    [alertController setViewDidShowHandler:^(UIView *alertView) {
        NSLog(@"ViewDidShow");
    }];
    
    [alertController setViewWillHideHandler:^(UIView *alertView) {
        NSLog(@"ViewWillHide");
    }];
    
    [alertController setViewDidHideHandler:^(UIView *alertView) {
        NSLog(@"ViewDidHide");
    }];
    
    [alertController setDismissComplete:^{
        NSLog(@"DismissComplete");
    }];
    

    
    CTPNaviagtionController *navi = [[CTPNaviagtionController alloc] initWithRootViewController:alertController];
    self.presentNavi = navi;
    
    //UINavigationController *navi2 = [[UINavigationController alloc] initWithRootViewController:secondVc];

    //alertController.alertViewOriginY = 60;
    [self presentViewController:navi animated:YES completion:nil];

}


- (void)gotoshow
{
    CTPFloatingFastViewController *fastVc = [[CTPFloatingFastViewController alloc] init];
    
    [self presentViewController:fastVc animated:NO completion:nil];
}






@end
