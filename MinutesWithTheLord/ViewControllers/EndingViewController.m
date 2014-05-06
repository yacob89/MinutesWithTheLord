//
//  EndingViewController.m
//  MinutesWithTheLord
//
//  Created by Maysora on 5/6/14.
//  Copyright (c) 2014 churchinbandung. All rights reserved.
//

#import "EndingViewController.h"
#import "BottomNavBar.h"

@interface EndingViewController ()

@property (strong, nonatomic) BottomNavBar *bottomNav;

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
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
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

@end
