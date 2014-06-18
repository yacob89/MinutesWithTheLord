//
//  MainViewController.m
//  MinutesWithTheLord
//
//  Created by Maysora on 5/6/14.
//  Copyright (c) 2014 churchinbandung. All rights reserved.
//

#import "MainViewController.h"
#import "CallingViewController.h"
#import "NSBundle+TTTOverrideLanguage.h"
#import "NSLocale+TTTOverrideLocale.h"
#import "NSObject+TTTSwizzling.h"

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
    [NSLocale ttt_resetRuntimeLocale];
    [NSBundle ttt_resetLanguage];
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

- (void)startActivity
{
    [self.navigationController pushViewController:self.callVC animated:YES];
}

- (IBAction)indonesiaButtonTapped:(id)sender
{
    [NSBundle ttt_overrideLanguage:@"id-ID"];
    [NSLocale ttt_overrideRuntimeLocale:[NSLocale localeWithLocaleIdentifier:@"id-ID"]];
    [self performSelector:@selector(startActivity) withObject:nil afterDelay:1.0];
}

- (IBAction)chineseButtonTapped:(id)sender
{
    [NSBundle ttt_overrideLanguage:@"zh-Hans"];
    [NSLocale ttt_overrideRuntimeLocale:[NSLocale localeWithLocaleIdentifier:@"zh-Hans"]];
    [self performSelector:@selector(startActivity) withObject:nil afterDelay:1.0];
}

- (IBAction)germanButtonTapped:(id)sender
{
    [NSBundle ttt_overrideLanguage:@"de"];
    [NSLocale ttt_overrideRuntimeLocale:[NSLocale localeWithLocaleIdentifier:@"de"]];
    [self performSelector:@selector(startActivity) withObject:nil afterDelay:1.0];
}

- (IBAction)englishButtonTapped:(id)sender
{
    [NSBundle ttt_overrideLanguage:@"en"];
    [NSLocale ttt_overrideRuntimeLocale:[NSLocale localeWithLocaleIdentifier:@"en"]];
    [self performSelector:@selector(startActivity) withObject:nil afterDelay:1.0];
}

- (IBAction)koreanButtonTapped:(id)sender
{
    [NSBundle ttt_overrideLanguage:@"ko"];
    [NSLocale ttt_overrideRuntimeLocale:[NSLocale localeWithLocaleIdentifier:@"ko"]];
    [self performSelector:@selector(startActivity) withObject:nil afterDelay:1.0];
}

- (IBAction)spanishButtonTapped:(id)sender
{
    [NSBundle ttt_overrideLanguage:@"es"];
    [NSLocale ttt_overrideRuntimeLocale:[NSLocale localeWithLocaleIdentifier:@"es"]];
    [self performSelector:@selector(startActivity) withObject:nil afterDelay:1.0];
}
@end
