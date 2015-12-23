//
//  TableViewController.m
//  CXAlertController
//
//  Created by ziacke on 15/12/23.
//  Copyright © 2015年 chuxinnet. All rights reserved.
//

#import "TableViewController.h"
#import "CXAlertController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.row == 0) {
       UIAlertView *alertView = [CXAlertController cx_UIAlertViewControllerWithTitle:@"Show in UIAlertView" withMessage:@"This is UIAlertView" withButtonTitlesArray:@[@"Cancel",@"Ok"]withCompletionBlock:^( NSUInteger buttonIndex) {
            if(buttonIndex == 0) {
                NSLog(@"You click the cancel button in UIAlertView");
            } else if(buttonIndex == 1) {
                NSLog(@"You click the ok button in UIAlertView");
            }
        }];
        [alertView show];
    } else if(indexPath.row == 1) {
        UIAlertController *alertController = (UIAlertController *)[CXAlertController cx_UIAlertControllerWithTitle:@"Show in UIAlertController" withMessage:@"This is UIAlertController" withButtonTitlesArray:@[@"Cancel",@"Ok"]  withButtonStyleArray:@[@(UIAlertActionStyleCancel),@(UIAlertActionStyleDefault)] withCompletionBlock:^(NSUInteger buttonIndex) {
            if(buttonIndex == 0) {
                NSLog(@"You click the cancel button in UIAlertController");
            } else if(buttonIndex == 1) {
                NSLog(@"You click the ok button in UIAlertController");
            }
        }];
        //Avoid crash in < iOS8
        if(alertController) {
            [self presentViewController:alertController animated:YES completion:nil];
        }
    } else if(indexPath.row == 2) {
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
    }
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
