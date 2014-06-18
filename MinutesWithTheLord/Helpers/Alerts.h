//
//  Alerts.h
//  Gramediana
//
//  Created by Erwin Luwis on 1/24/13.
//  Copyright (c) 2013 BociStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Alerts : NSObject

+ (void)showAlertForStatus:(NSInteger)statusCode error:(NSError *)error;
+ (void)showNetworkErrorAlert:(NSInteger)statusCode;
+ (void)showErrorAlert:(NSError *)error;
+ (void)showNetworkNotAvailableAlert;
+ (void)showLocationUnavailableAlert;
+ (void)showAlertWithTitle:(NSString*)title message:(NSString*)message;
+ (void)showAlertWithTitle:(NSString*)title message:(NSString*)message button:(NSString*)button;
+ (void)showAlertForNSNotification:(NSNotification *)notification title:(NSString *)title button:(NSString *)dismissButton;

@end
