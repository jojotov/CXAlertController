# CXAlertController

A objective-c util for compatible UIAlertView and UIAlertController

> For iOS < 8.0, UIAlertView is allowed to use. However, if the iphone version is greater than or equal to iOS8, UIAlertController is recommanded to use.

CXAlertController provide a common method with completion block, the user can use completion block to do different tasks when click the button.
# Screenshot
![1](https://cloud.githubusercontent.com/assets/8435489/11975630/b7093a6a-a9aa-11e5-92a1-5dd17e3f766f.png)
![2](https://cloud.githubusercontent.com/assets/8435489/11975632/cb6e0468-a9aa-11e5-9ddd-8504f127b34e.png)
![3](https://cloud.githubusercontent.com/assets/8435489/11975636/d0961c82-a9aa-11e5-88e1-026ebb5f1f87.png)
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
