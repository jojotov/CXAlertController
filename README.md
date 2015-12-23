





# CXAlertController

A objective-c util for compatible UIAlertView and UIAlertController

> For iOS < 8.0, UIAlertView is allowed to use. However, if the iphone version is greater than or equal to iOS8, UIAlertController is recommanded to use.

CXAlertController provide a common method with completion block, the user can use completion block to do different tasks when click the button.

# Usage

``` objective-c
id alertController = [CXAlertController cx_alertControllerWithTitle:@"Show in UIAlertController" withMessage:@"This is UIAlertController" withButtonTitlesArray:@[@"Cancel",@"Ok"]  withButtonStyleArray:@[@(UIAlertActionStyleCancel),@(UIAlertActionStyleDefault)] withCompletionBlock:^(NSUInteger buttonIndex) {
			if(buttonIndex == 0) {
			    NSLog(@"You click the cancel button in UIAlertController / UIAlertView");
			} else if(buttonIndex == 1) {
			    NSLog(@"You click the ok button in UIAlertController / UIAlertView");
			}
}];
if([alertController isKindOfClass:[UIAlertView class]]) {
           [(UIAlertView *)alertController show];
 } else if([alertController isKindOfClass:[UIAlertController class]]) {
          [self presentViewController:(UIAlertController *)alertController animated:YES completion:nil];    
 }
```

# Convenience

1. Using blocks 
2. Code reuse.
3. Totally UIKit