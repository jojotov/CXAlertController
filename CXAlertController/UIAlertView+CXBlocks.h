//
//  UIAlertView+CXBlocks.h
//  CXAlertController
//
//  Created by ziacke on 15/12/23.
//  Copyright © 2015年 chuxinnet. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CXAlerViewCancelBlock)();

typedef void (^CXAlertViewCompletionBlock)(NSUInteger buttonIndex);

@interface UIAlertView (CXBlocks)

@property (copy, nonatomic) CXAlertViewCompletionBlock completionBlock;

@property (copy, nonatomic) CXAlerViewCancelBlock cancelBlock;

+ (instancetype)cx_alertViewWithTitle:(NSString *)title withMessage:(NSString *)message withCancelButtonTitle:(NSString *)cancelButtonTitle withOtherButtonsTitleArray:(NSArray *)otherButtonTitlesArray withCompletionBlock:(CXAlertViewCompletionBlock)completionBlock;


@end
