//
//  CXAlertController.m
//  CXAlertController
//
//  Created by ziacke on 15/12/23.
//  Copyright © 2015年 chuxinnet. All rights reserved.
//

#import "CXAlertController.h"
#import "UIAlertView+CXBlocks.h"

@implementation CXAlertController

+ (id)cx_alertControllerWithTitle:(NSString *)title withMessage:(NSString *)message withButtonTitlesArray:(NSArray *)buttonTitlesArray withButtonStyleArray:(NSArray *)buttonStyleArray withCompletionBlock:(CXAlertControllerCompletionBlock)completionBlock {
    CGFloat currentSystemVersion = [UIDevice currentDevice].systemVersion.floatValue;
    if(currentSystemVersion >= 8.0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        if(buttonTitlesArray && buttonTitlesArray.count > 0) {
            for(int i = 0 ; i < buttonTitlesArray.count; i++) {
                NSString *actionTitle = buttonTitlesArray[i];
                UIAlertActionStyle alertActionStyle = [buttonStyleArray[i] integerValue];
                UIAlertAction *action = [UIAlertAction actionWithTitle:actionTitle style:alertActionStyle handler:^(UIAlertAction * _Nonnull action) {
                    if(completionBlock) {
                        completionBlock(i);
                    }
                }];
                [alertController addAction:action];
            }
        }
        return alertController;
    } else {
        NSString *cancelButtonTitle = buttonTitlesArray.count > 0 ? buttonTitlesArray.firstObject : nil;
        NSArray *otherButtonTitlesArray = buttonTitlesArray.count > 1 ? [buttonTitlesArray subarrayWithRange:NSMakeRange(1, buttonTitlesArray.count - 1)] : nil;
        UIAlertView *alertView = [UIAlertView cx_alertViewWithTitle:title withMessage:message withCancelButtonTitle:cancelButtonTitle withOtherButtonsTitleArray:otherButtonTitlesArray withCompletionBlock:^(NSUInteger buttonIndex) {
            if(completionBlock) {
                completionBlock(buttonIndex);
            }
        }];
        NSLog(@"ALERTvIEW :%@",alertView);
        return alertView;
    }
}

+ (UIAlertView *)cx_UIAlertViewControllerWithTitle:(NSString *)title withMessage:(NSString *)message withButtonTitlesArray:(NSArray *)buttonTitlesArray withCompletionBlock:(CXAlertControllerCompletionBlock)completionBlock {
    NSString *cancelButtonTitle = buttonTitlesArray.count > 0 ? buttonTitlesArray.firstObject : nil;
    NSArray *otherButtonTitlesArray = buttonTitlesArray.count > 1 ? [buttonTitlesArray subarrayWithRange:NSMakeRange(1, buttonTitlesArray.count - 1)] : nil;
    id alertView = [UIAlertView cx_alertViewWithTitle:title withMessage:message withCancelButtonTitle:cancelButtonTitle withOtherButtonsTitleArray:otherButtonTitlesArray withCompletionBlock:^(NSUInteger buttonIndex) {
        if(completionBlock) {
            completionBlock(buttonIndex);
        }
    }];
    return alertView;
}

+ (UIAlertController *)cx_UIAlertControllerWithTitle:(NSString *)title withMessage:(NSString *)message withButtonTitlesArray:(NSArray *)buttonTitlesArray withButtonStyleArray:(NSArray *)buttonStyleArray withCompletionBlock:(CXAlertControllerCompletionBlock)completionBlock {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if(buttonTitlesArray && buttonTitlesArray.count > 0) {
        for(int i = 0 ; i < buttonTitlesArray.count; i++) {
            NSString *actionTitle = buttonTitlesArray[i];
            UIAlertActionStyle alertActionStyle = [buttonStyleArray[i] integerValue];
            UIAlertAction *action = [UIAlertAction actionWithTitle:actionTitle style:alertActionStyle handler:^(UIAlertAction * _Nonnull action) {
                if(completionBlock) {
                    completionBlock(i);
                }
            }];
            [alertController addAction:action];
        }
    }
    return alertController;
}

@end
