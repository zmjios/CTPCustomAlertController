//
//  CTPFingerPrinterController.m
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/25.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import "CTPFingerPrinterController.h"

@implementation CTPFingerPrinterController


- (id)init
{
    if (self = [super init]) {
        
        //[self.floatingView.middleView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
    }
    
    return self;
}



- (NSInteger)floatingViewNumberOfRows
{
    return 3;
}


- (UITableViewCell *)floatingView:(CTPBaseFloatingView *)floatingView cellForRowAtIndex:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld张银行哎哎哎",(long)indexPath.row];
    
    return cell;
}


- (NSString *)floatingViewTopMiddleInfoItem
{
    return @"切换银行卡号";
}


- (UIButton *)topLeftItem:(CTPBaseFloatingView *)floatingView
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"closed" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(closed:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}


- (void)closed:(id)sender
{
    [self.rootViewController popViewAnimated:YES];
}


@end
