//
//  UITableView+Util.m
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/25.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import "UITableView+Util.h"

@implementation UITableView (Util)


- (void) startSmoothAnimationWithDuration:(NSTimeInterval)duration
{
    int i=0;
    for (UITableViewCell *atCell in self.visibleCells) {
        [self animateCell:atCell duration:duration delay:i*duration*0.2 beginOriginY:30 + i*2];
        ++i;
    }
}

- (void) animateCell:(UITableViewCell*)cell duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay beginOriginY:(CGFloat)y
{
    CGRect frame = cell.frame;
    cell.contentView.frame = CGRectMake(0, y, frame.size.width, frame.size.height);
    cell.contentView.alpha = 0;
    [UIView animateWithDuration:duration
                          delay:delay
                        options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         cell.contentView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
                         cell.contentView.alpha = 1.0;
                     }
                     completion:nil];
}




@end
