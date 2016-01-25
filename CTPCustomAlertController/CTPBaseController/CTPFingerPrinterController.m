//
//  CTPFingerPrinterController.m
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/25.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import "CTPFingerPrinterController.h"
#import "UIView+CTLine.h"

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

- (CGFloat)topViewHeight:(CTPBaseFloatingView *)floatingView
{
    return 60;
}


- (UITableViewCell *)floatingView:(CTPBaseFloatingView *)floatingView cellForRowAtIndex:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    [cell.contentView drawLineInPosition:CTLinePositionBottom  edge:UIEdgeInsetsMake(0, 20, 0, 0)];
    cell.contentView.frame = cell.frame;
    cell.accessoryView = nil;
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


//- (void)floatingView:(CTPBaseFloatingView *)floatingView willDisplayCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath
//{
//
//    CATransform3D transform;
//    transform = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
//    transform.m34 = 1.0/ -600;
//    
//    // 2. 定义cell的初始状态
//    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
//    cell.layer.shadowOffset = CGSizeMake(10, 10);
//    cell.alpha = 0;
//    
//    cell.layer.transform = transform;
//    cell.layer.anchorPoint = CGPointMake(0, 0.5);
//    
//    // 3. 定义cell的最终状态，并提交动画
//    [UIView beginAnimations:@"transform" context:NULL];
//    [UIView setAnimationDuration:0.5];
//    cell.layer.transform = CATransform3DIdentity;
//    cell.alpha = 1;
//    cell.layer.shadowOffset = CGSizeMake(0, 0);
//    cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
//    [UIView commitAnimations];
//}


- (void)closed:(id)sender
{
    [self.rootViewController popViewAnimated:YES];
}


@end
