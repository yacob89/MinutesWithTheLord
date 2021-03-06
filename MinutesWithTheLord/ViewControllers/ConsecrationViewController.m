//
//  ConsecrationViewController.m
//  MinutesWithTheLord
//
//  Created by yacob on 5/6/14.
//  Copyright (c) 2014 churchinbandung. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "ConsecrationViewController.h"
#import "BottomNavBar.h"
#import "ThanksgivingViewController.h"
#import "AppDelegate.h"
#define CONSECRATION_TIME 30

@interface ConsecrationViewController ()

@property (strong, nonatomic) BottomNavBar *bottomNav;
@property (strong, nonatomic) ThanksgivingViewController *thanksVC;
@property (strong, nonatomic) NSTimer *timeoutTimer;
@property (nonatomic) int percentage;
@property (nonatomic) BOOL ispaused;
@property (strong, nonatomic) AVAudioPlayer *player;

@end

@implementation ConsecrationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self prepareBottomNav];
    [self prepareNotificationSound];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    self.percentage = 0;
    self.timerLabel.text = [NSString stringWithFormat:@"%d", CONSECRATION_TIME - self.percentage];
    self.activityTitle.text = NSLocalizedString(@"consecration", nil);
    self.activityDescription.text = NSLocalizedString(@"consecration_desc", nil);
    //[self scheduleTimeoutTimer];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.player play];
    _ispaused = NO;
    [self scheduleTimeoutTimer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI Preparation

- (void)prepareBottomNav
{
    CGRect frame = _bottomNavBar.frame;
    frame.origin = CGPointZero;
    self.bottomNav = [[BottomNavBar alloc] initWithFrame:frame];
    [self.bottomNav setupAsNormalPage];
    
    [self.bottomNav.backwardButton addTarget:self
                                      action:@selector(backwardButtonAction)
                            forControlEvents:UIControlEventTouchUpInside];
    [self.bottomNav.pauseButton setTitle:@"PAUSE" forState:UIControlStateNormal];
    [self.bottomNav.pauseButton setTitle:@"RESUME" forState:UIControlStateSelected];
    [self.bottomNav.pauseButton addTarget:self action:@selector(pauseButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomNav.stopButton addTarget:self action:@selector(stopButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.bottomNavBar addSubview:self.bottomNav];
}

- (void)backwardButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)pauseButtonAction
{
    if (!_ispaused) {
        _ispaused = YES;
        self.bottomNav.pauseButton.selected = YES;
    }
    else{
        _ispaused = NO;
        self.bottomNav.pauseButton.selected = NO;
    }
}

- (void)stopButtonAction
{
    _ispaused = YES;
    self.bottomNav.pauseButton.selected = YES;
    NSString *stopAlert = [NSString stringWithFormat:@"%@ %@%@ %@ %@", NSLocalizedString(@"alert_message1", nil), @"[", NSLocalizedString(@"number_2", nil), NSLocalizedString(@"alert_message3", nil), NSLocalizedString(@"alert_message2", nil)];
    if ([AppDelegate ad].isPortuguese) {
        stopAlert = [NSString stringWithFormat:@"%@ %@ %@ %@ %@", NSLocalizedString(@"alert_message1", nil), NSLocalizedString(@"alert_message3", nil), NSLocalizedString(@"number_2", nil), NSLocalizedString(@"alert_message4", nil), NSLocalizedString(@"alert_message2", nil)];
    }
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@""
                                                      message:stopAlert
                                                     delegate:self
                                            cancelButtonTitle:@"RESUME"
                                            otherButtonTitles:@"STOP", nil];
    message.delegate = self;
    [message show];
}

#pragma mark - UIAlertView delegate methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != alertView.cancelButtonIndex) {
        self.percentage = 0;
        [self removeTimeoutTimer];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else{
        _ispaused = YES;
        self.bottomNav.pauseButton.selected = NO;
        [self pauseButtonAction];
        return;
    }
}

- (void)prepareNotificationSound
{
    NSString *stringPath = [[NSBundle mainBundle]pathForResource:@"alarm3" ofType:@"mp3"];
    if (stringPath) {
        NSURL *url = [NSURL fileURLWithPath:stringPath];
        NSError *error;
        self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
        if (!error) {
            [self.player setNumberOfLoops:0];
        } else {
            NSLog(@"Error occurred: %@", [error localizedDescription]);
        }
    } else {
        NSLog(@"Resource not found");
    }
}

#pragma mark - Timer Handler

- (void)scheduleTimeoutTimer
{
    self.timeoutTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                         target:self
                                                       selector:@selector(handleTimer)
                                                       userInfo:nil
                                                        repeats:YES];
}

- (void)removeTimeoutTimer
{
    if (self.timeoutTimer && [self.timeoutTimer respondsToSelector:@selector(invalidate)]){
        [self.timeoutTimer invalidate];
        self.timeoutTimer = nil;
    }
}

- (void)handleTimer
{
    if (!_ispaused) {
        self.percentage += 1;
        if (self.percentage >= CONSECRATION_TIME) {
            self.percentage = CONSECRATION_TIME;
            [self removeTimeoutTimer];
            
            if (self.thanksVC == nil) {
                self.thanksVC = [[ThanksgivingViewController alloc] initWithNibName:@"ThanksgivingViewController" bundle:nil];
            }
            [self.navigationController pushViewController:self.thanksVC animated:YES];
        }
        self.timerLabel.text = [NSString stringWithFormat:@"%d", CONSECRATION_TIME - self.percentage];
    }
}

@end
