//
//  ViewController.m
//  Local_Notification
//
//  Created by MacBook Pro on 01/11/23.
//

#import "ViewController.h"

@interface ViewController (){
    BOOL isGrantedNotificationAccess;
    NSInteger OTP;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    isGrantedNotificationAccess = false;
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    
    // We want alert and sound both
    UNAuthorizationOptions options = UNAuthorizationOptionAlert + UNAuthorizationOptionSound;
    
    [center requestAuthorizationWithOptions:options completionHandler: ^(BOOL granted, NSError * _Nullable error){
        isGrantedNotificationAccess = granted;
    }];
}
    
    
- (IBAction)verifyButton:(id)sender {
    NSInteger userEnterOtp = [_otpEnter.text intValue];
    
    if (OTP == userEnterOtp) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Celestial" message:@"Successfully Login" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        
        [self presentModalViewController:alert animated:YES];
        
    } else{
      
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Celestial" message:@"Bad Credentials" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        
        [self presentModalViewController:alert animated:YES];
        
    }
}

- (IBAction)button:(id)sender {
    
    if (isGrantedNotificationAccess)
    {
        UNUserNotificationCenter *center=[UNUserNotificationCenter currentNotificationCenter];
        UNMutableNotificationContent * mucontent = [[UNMutableNotificationContent alloc]init];
        mucontent.title=@"Celestial Systems";
        mucontent.subtitle = @"Use this password to validate your login";
//        mucontent.body = @"123";
        mucontent.sound=[UNNotificationSound defaultSound];     // For default iphone sound
//        mucontent.sound = [UNNotificationSound soundNamed:@"samsung_notification.mp3"];     // For custom sound
        
        
        // For OTP
        mucontent.body= [NSString stringWithFormat:@"%lu", [self randomNumber]];
        OTP = [mucontent.body intValue];
        
        
        // How much time taken to popup notification
        UNTimeIntervalNotificationTrigger *trigger=[UNTimeIntervalNotificationTrigger triggerWithTimeInterval:4.0 repeats:NO];
        
        // Send request
        UNNotificationRequest * request = [UNNotificationRequest requestWithIdentifier:@"UYLocalNotification" content:mucontent trigger:trigger];
        [center addNotificationRequest:request withCompletionHandler:nil];
        
    }
}

-(NSInteger) randomNumber{
    NSInteger randomNumber = 2336 + arc4random_uniform(5336);
    return randomNumber;
}

@end
