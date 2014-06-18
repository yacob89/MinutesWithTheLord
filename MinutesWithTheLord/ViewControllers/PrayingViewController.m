//
//  PrayingViewController.m
//  MinutesWithTheLord
//
//  Created by Maysora on 5/6/14.
//  Copyright (c) 2014 churchinbandung. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "PrayingViewController.h"
#import "BottomNavBar.h"
#import "PrayReadingViewController.h"
#define PRAYING_TIME 5

@interface PrayingViewController ()

@property (strong, nonatomic) BottomNavBar *bottomNav;
@property (strong, nonatomic) PrayReadingViewController *prayReadingVC;
@property (strong, nonatomic) NSTimer *timeoutTimer;
@property (nonatomic) int percentage;
@property (nonatomic) BOOL ispaused;
@property (strong, nonatomic) AVAudioPlayer *player;

@end

@implementation PrayingViewController

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
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    self.percentage = 0;
    self.timerLabel.text = [NSString stringWithFormat:@"%d", PRAYING_TIME - self.percentage];
    self.activityTitle.text = NSLocalizedString(@"praying", nil);
    self.activityDescription.text = NSLocalizedString(@"praying_desc", nil);
    [self scheduleTimeoutTimer];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.player play];
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
    [self pauseButtonAction];
    NSString *stopAlert = [NSString stringWithFormat:@"%@ %@%d %@ %@", NSLocalizedString(@"alert_message1", nil), @"[", 7, NSLocalizedString(@"alert_message3", nil), NSLocalizedString(@"alert_message2", nil)];
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
        [self pauseButtonAction];
        return;
    }
}

- (void)prepareNotificationSound
{
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"sirius"
                                                              ofType:@"ogg"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL
                                                         error:nil];
    self.player.numberOfLoops = 1; //Infinite
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
        if (self.percentage >= PRAYING_TIME) {
            self.percentage = PRAYING_TIME;
            [self removeTimeoutTimer];
            
            if (self.prayReadingVC == nil) {
                self.prayReadingVC = [[PrayReadingViewController alloc] initWithNibName:@"PrayReadingViewController" bundle:nil];
            }
            [self.navigationController pushViewController:self.prayReadingVC animated:YES];
        }
        self.timerLabel.text = [NSString stringWithFormat:@"%d", PRAYING_TIME - self.percentage];
    }
}

@end
