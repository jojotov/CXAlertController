//
//  CXAlertController.h
//  CXAlertController
//
//  Created by ziacke on 15/12/23.
//  Copyright © 2015年 chuxinnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^CXAlertControllerCompletionBlock)(NSUInteger buttonIndex);

@interface CXAlertController : NSObject

/**
 *  Show UIAlertController or UIAlertView depend on device system version
 *
 *  @param title             Alert title
 *  @param message           Alert content
 *  @param buttonTitlesArray All button titles array
 *  @param buttonStyleArray  All button styles array
 *  @param completionBlock   The completion block
 *
 *  @return UIAlertController or UIAlertView
 */
+ (id)cx_alertControllerWithTitle:(NSString *)title withMessage:(NSString *)message withButtonTitlesArray:(NSArray *)buttonTitlesArray withButtonStyleArray:(NSArray *)buttonStyleArray withCompletionBlock:(CXAlertControllerCompletionBlock)completionBlock;

/**
 *  Show UIAlertView
 *
 *  @param title             Alert title
 *  @param message           Alert message
 *  @param buttonTitlesArray All the button titles array
 *  @param completionBlock   The completion block
 */
+ (UIAlertView *)cx_UIAlertViewControllerWithTitle:(NSString *)title withMessage:(NSString *)message withButtonTitlesArray:(NSArray *)buttonTitlesArray withCompletionBlock:(CXAlertControllerCompletionBlock)completionBlock;

/**
 *  Show UIAlertController
 *
 *  @param title             Alert title
 *  @param message           Alert content
 *  @param buttonTitlesArray All button titles array
 *  @param buttonStyleArray  All button styles array
 *  @param completionBlock   The completion block
 *
 *  @return UIAlertController
 */
+ (UIAlertController *)cx_UIAlertControllerWithTitle:(NSString *)title withMessage:(NSString *)message withButtonTitlesArray:(NSArray *)buttonTitlesArray withButtonStyleArray:(NSArray *)buttonStyleArray withCompletionBlock:(CXAlertControllerCompletionBlock)completionBlock;


@end
