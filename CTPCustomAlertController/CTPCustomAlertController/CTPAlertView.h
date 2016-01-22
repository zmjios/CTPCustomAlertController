//
//  CTPAlertView.h
//  CTPCustomAlertController
//
//  Created by zmjios on 16/1/20.
//  Copyright © 2016年 zmjios. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CTPAlertActionStyle) {
    CTPAlertActionStyleDefault,
    CTPAlertActionStyleCancle,
    CTPAlertActionStyleDestructive,
};

@interface CTPAlertAction : NSObject <NSCopying>

+ (instancetype)actionWithTitle:(NSString *)title style:(CTPAlertActionStyle)style handler:(void (^)(CTPAlertAction *action))handler;

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) CTPAlertActionStyle style;
@property (nonatomic, getter=isEnabled) BOOL enabled;

@end

//
@interface CTPAlertView : UIView

@property (nonatomic, strong, readonly) UILabel *titleLable;
@property (nonatomic, strong, readonly) UILabel *messageLabel;
@property (nonatomic, strong, readonly) UIImageView *imageView;

@property (nonatomic, strong, readonly) NSArray *textFieldArray;

// default 280, if 0 don't add width constraint,
@property (nonatomic, assign) CGFloat alertViewWidth;

// contentView space custom
@property (nonatomic, assign) CGFloat contentViewSpace;

// textLabel custom
@property (nonatomic, assign) CGFloat textLabelSpace;
@property (nonatomic, assign) CGFloat textLabelContentViewEdge;

// button custom
@property (nonatomic, assign) CGFloat buttonHeight;
@property (nonatomic, assign) CGFloat buttonSpace;
@property (nonatomic, assign) CGFloat buttonContentViewEdge;
@property (nonatomic, assign) CGFloat buttonCornerRadius;
@property (nonatomic, strong) UIFont *buttonFont;
@property (nonatomic, strong) UIColor *buttonDefaultBgColor;
@property (nonatomic, strong) UIColor *buttonCancleBgColor;
@property (nonatomic, strong) UIColor *buttonDestructiveBgColor;

// textFeild custom
@property (nonatomic, strong) UIColor *textFieldBorderColor;
@property (nonatomic, strong) UIColor *textFieldBackgroudColor;
@property (nonatomic, strong) UIFont *textFieldFont;
@property (nonatomic, assign) CGFloat textFeildHeight;
@property (nonatomic, assign) CGFloat textFeildEdge;
@property (nonatomic, assign) CGFloat textFeildorderWidth;
@property (nonatomic, assign) CGFloat textFeildContentViewEdge;


+ (instancetype)alertViewWithTitle:(NSString *)title message:(NSString *)message;

+ (instancetype)alertViewWithTitle:(NSString *)title message:(NSString *)message image:(NSString *)imageName;

- (void)addAction:(CTPAlertAction *)action;

- (void)addTextFieldWithConfigurationHandler:(void (^)(UITextField *textField))configurationHandler;

@end
