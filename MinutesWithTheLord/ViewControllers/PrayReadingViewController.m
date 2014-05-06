//
//  PrayReadingViewController.m
//  MinutesWithTheLord
//
//  Created by Maysora on 5/6/14.
//  Copyright (c) 2014 churchinbandung. All rights reserved.
//

#import "PrayReadingViewController.h"
#import "BottomNavBar.h"
#import "ConfessionViewController.h"
#define PRAYREADING_TIME 5

@interface PrayReadingViewController ()

@property (strong, nonatomic) BottomNavBar *bottomNav;
@property (strong, nonatomic) ConfessionViewController *confessionVC;
@property (strong, nonatomic) NSTimer *timeoutTimer;
@property (nonatomic) int percentage;
@property (nonatomic) BOOL ispaused;

@end

@implementation PrayReadingViewController

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
    self.timerLabel.text = [NSString stringWithFormat:@"%d", PRAYREADING_TIME - self.percentage];
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
    [self.bottomNav.pauseButton addTarget:self action:@selector(pauseButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
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
    }
    else{
        _ispaused = NO;
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
        if (self.percentage >= PRAYREADING_TIME) {
            self.percentage = PRAYREADING_TIME;
            [self removeTimeoutTimer];
            
            if (self.confessionVC == nil) {
                self.confessionVC = [[ConfessionViewController alloc] initWithNibName:@"ConfessionViewController" bundle:nil];
            }
            [self.navigationController pushViewController:self.confessionVC animated:YES];
        }
        self.timerLabel.text = [NSString stringWithFormat:@"%d", PRAYREADING_TIME - self.percentage];
    }
}

@end
