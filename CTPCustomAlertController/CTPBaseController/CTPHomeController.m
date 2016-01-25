//
//  CTPHomeController.m
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/25.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import "CTPHomeController.h"

#import "CTPFingerPrinterFloatingView.h"
#import "CTPFingerPrinterController.h"

@implementation CTPHomeController


- (id)init
{
    if (self = [super init]) {
        
        //[self.floatingView.middleView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
    }
    
    return self;
}


- (NSInteger)floatingViewNumberOfRows
{
    return 2;
}


- (UITableViewCell *)floatingView:(CTPBaseFloatingView *)floatingView cellForRowAtIndex:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",(long)indexPath.row];
    
    return cell;
}


- (void)floatingView:(CTPBaseFloatingView *)floatingView didSelectRowAtIndex:(NSIndexPath *)indexPath
{
    
    CTPFingerPrinterController *controller = [[CTPFingerPrinterController alloc] init];
    controller.rootViewController = self.rootViewController;
    CTPFingerPrinterFloatingView *fingerView = [[CTPFingerPrinterFloatingView alloc] initWithController:controller];

    [self.rootViewController pushView:fingerView animated:YES];
}


@end
