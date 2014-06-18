//
//  Alerts.m
//  Gramediana
//
//  Created by Erwin Luwis on 1/24/13.
//  Copyright (c) 2013 BociStudio. All rights reserved.
//

#import "Alerts.h"

@implementation Alerts

+ (void)showAlertForStatus:(int)statusCode error:(NSError*)error
{
    if (error){
        [Alerts showErrorAlert:error];
    }
    else {
        [Alerts showNetworkErrorAlert:statusCode];
    }
}

+ (void)showNetworkErrorAlert:(int)statusCode
{
    NSString * alertTitle = @"Error";
    NSString * alertMessage = [NSHTTPURLResponse localizedStringForStatusCode:statusCode];
    
    if (statusCode==409 /* Conflict */)
    {

    }
    else if (statusCode==302 /* Found */ ||
             statusCode==502 /* Bad Gateway */ ||
             statusCode==503 /* Service Unavailable */ ||
             statusCode==504 /* Gateway Timeout */)
    {
        
    }
    else if(500 <= statusCode && statusCode <= 599)
    {

    }
    
    [self showAlertWithTitle:alertTitle message:alertMessage button:@"OK"];
}

+ (void)showErrorAlert:(NSError*)error
{
    NSString * alertTitle = @"Error";
    NSString * alertMessage = [error localizedDescription];
    
    if ([error code] == NSURLErrorCannotConnectToHost)
    {

    }
    
    [self showAlertWithTitle:alertTitle message:alertMessage button:@"OK"];
}

+ (void)showNetworkNotAvailableAlert
{
    NSString *alertTitle = @"No network connection";
    NSString *alertMessage = @"You must be connected to the internet";
    
    [self showAlertWithTitle:alertTitle message:alertMessage button:@"Cancel"];
}

+ (void)showLocationUnavailableAlert
{
    NSString *alertTitle = @"Access to location denied";
    NSString *alertMessage = @"Re-start app and tap 'Ok' when asked to use your current location.";
    
    [self showAlertWithTitle:alertTitle message:alertMessage button:@"OK"];
}

+ (void)showAlertWithTitle:(NSString*)title message:(NSString*)message
{
    [self showAlertWithTitle:title message:message button:@"OK"];
}

+ (void)showAlertWithTitle:(NSString*)title message:(NSString*)message button:(NSString*)button
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:button otherButtonTitles: nil];
	[alert show];
}

+ (void)showAlertForNSNotification:(NSNotification *)notification title:(NSString *)title button:(NSString *)dismissButton
{
    if (notification && notification.userInfo && [notification.userInfo objectForKey:@"error_message"])
    {
        [self showAlertWithTitle:title
                         message:[notification.userInfo objectForKey:@"error_message"]
                          button:dismissButton];
    }
}

@end
