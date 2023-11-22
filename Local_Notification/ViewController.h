//
//  ViewController.h
//  Local_Notification
//
//  Created by MacBook Pro on 01/11/23.
//

#import <UIKit/UIKit.h>
#import "UserNotifications/UserNotifications.h"

@interface ViewController : UIViewController
- (IBAction)button:(id)sender;

- (IBAction)verifyButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *otpEnter;


@end

