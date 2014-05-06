//
//  MainViewController.m
//  MinutesWithTheLord
//
//  Created by Maysora on 5/6/14.
//  Copyright (c) 2014 churchinbandung. All rights reserved.
//

#import "MainViewController.h"
#import "CallingViewController.h"

@interface MainViewController ()

@property (strong, nonatomic) CallingViewController *callVC;

@end

@implementation MainViewController

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
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    if (self.callVC == nil) {
        self.callVC = [[CallingViewController alloc] initWithNibName:@"CallingViewController" bundle:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)indonesiaButtonTapped:(id)sender
{
    [self.navigationController pushViewController:self.callVC animated:YES];
}

- (IBAction)chineseButtonTapped:(id)sender
{
    [self.navigationController pushViewController:self.callVC animated:YES];
}

- (IBAction)germanButtonTapped:(id)sender
{
    [self.navigationController pushViewController:self.callVC animated:YES];
}

- (IBAction)englishButtonTapped:(id)sender
{
    [self.navigationController pushViewController:self.callVC animated:YES];
}

- (IBAction)koreanButtonTapped:(id)sender
{
    [self.navigationController pushViewController:self.callVC animated:YES];
}

- (IBAction)spanishButtonTapped:(id)sender
{
    [self.navigationController pushViewController:self.callVC animated:YES];
}
@end
