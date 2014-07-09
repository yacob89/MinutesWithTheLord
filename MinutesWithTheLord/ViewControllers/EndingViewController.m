//
//  EndingViewController.m
//  MinutesWithTheLord
//
//  Created by yacob on 5/6/14.
//  Copyright (c) 2014 churchinbandung. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "EndingViewController.h"
#import "BottomNavBar.h"

@interface EndingViewController ()

@property (strong, nonatomic) BottomNavBar *bottomNav;
@property (strong, nonatomic) AVAudioPlayer *player;

@end

@implementation EndingViewController

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
    
    self.activityTitle.text = NSLocalizedString(@"the_end", nil);
    self.timerLabel.text = NSLocalizedString(@"halelujah", nil);
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
    [self.bottomNav setupAsEndPage];
    
    [self.bottomNav.restartButton addTarget:self
                                      action:@selector(restartButtonAction)
                            forControlEvents:UIControlEventTouchUpInside];
    
    [self.bottomNavBar addSubview:self.bottomNav];
}

- (void)restartButtonAction
{
    [self.navigationController popToRootViewControllerAnimated:YES];
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

@end
