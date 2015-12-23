//
//  UIAlertView+CXBlocks.m
//  CXAlertController
//
//  Created by ziacke on 15/12/23.
//  Copyright © 2015年 chuxinnet. All rights reserved.
//

#import "UIAlertView+CXBlocks.h"
#import <objc/runtime.h>

static const void *CXAlertViewOriginDelegateKey = &CXAlertViewOriginDelegateKey;

static const void *CXAlertViewCompletionBlockKey = &CXAlertViewCompletionBlockKey;

static const void *CXAlertViewCancelBlockKey = &CXAlertViewCancelBlockKey;

@implementation UIAlertView (CXBlocks)

+ (instancetype)cx_alertViewWithTitle:(NSString *)title withMessage:(NSString *)message withCancelButtonTitle:(NSString *)cancelButtonTitle withOtherButtonsTitleArray:(NSArray *)otherButtonTitlesArray withCompletionBlock:(CXAlertViewCompletionBlock)completionBlock {
    
    NSString *firstButtonTitle = otherButtonTitlesArray.count > 0 ? otherButtonTitlesArray[0] : nil;
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:firstButtonTitle, nil];
    
    if(otherButtonTitlesArray.count > 1) {
        for(NSString *otherButtonTitle in [otherButtonTitlesArray subarrayWithRange:NSMakeRange(1, otherButtonTitlesArray.count - 1)]) {
            [alertView addButtonWithTitle:otherButtonTitle];
        }
    }
    
    if(completionBlock) {
        alertView.completionBlock = completionBlock;
    }
//    can be use if someone don't want to do the 'show' job outside
//    [alertView show];
    
    return alertView;
}


#pragma mark - private methods

- (void)configDelegate {
    if(self.delegate != (id <UIAlertViewDelegate>)self) {
        objc_setAssociatedObject(self, CXAlertViewOriginDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id <UIAlertViewDelegate>)self;
    }
}

#pragma mark - UIAlertView Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    CXAlertViewCompletionBlock completionBlock = alertView.completionBlock;
    if(completionBlock) {
        completionBlock(buttonIndex);
    }
    
    id alertViewOriginDelegate = objc_getAssociatedObject(self, CXAlertViewOriginDelegateKey);
    if(alertViewOriginDelegate && [alertViewOriginDelegate respondsToSelector:@selector(alertView:clickedButtonAtIndex:)]) {
        [alertViewOriginDelegate alertView:alertView clickedButtonAtIndex:buttonIndex];
    }
}

#pragma mark - getter setter

- (CXAlertViewCompletionBlock)completionBlock {
    return objc_getAssociatedObject(self, CXAlertViewCompletionBlockKey);
}

- (void)setCompletionBlock:(CXAlertViewCompletionBlock)completionBlock {
    [self configDelegate];
    objc_setAssociatedObject(self, CXAlertViewCompletionBlockKey, completionBlock, OBJC_ASSOCIATION_COPY);
}

- (CXAlerViewCancelBlock)cancelBlock {
    return objc_getAssociatedObject(self, CXAlertViewCancelBlockKey);
}

- (void)setCancelBlock:(CXAlerViewCancelBlock)cancelBlock {
    [self configDelegate];
    objc_setAssociatedObject(self, CXAlertViewCancelBlockKey, cancelBlock, OBJC_ASSOCIATION_COPY);
}
@end
