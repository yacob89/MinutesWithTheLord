//
//  ConsecrationViewController.m
//  MinutesWithTheLord
//
//  Created by Maysora on 5/6/14.
//  Copyright (c) 2014 churchinbandung. All rights reserved.
//

#import "ConsecrationViewController.h"
#import "BottomNavBar.h"
#import "ThanksgivingViewController.h"
#define CONSECRATION_TIME 5

@interface ConsecrationViewController ()

@property (strong, nonatomic) BottomNavBar *bottomNav;
@property (strong, nonatomic) ThanksgivingViewController *thanksVC;
@property (strong, nonatomic) NSTimer *timeoutTimer;
@property (nonatomic) int percentage;
@property (nonatomic) BOOL ispaused;

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
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    self.percentage = 0;
    self.timerLabel.text = [NSString stringWithFormat:@"%d", CONSECRATION_TIME - self.percentage];
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
