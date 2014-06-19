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
#import "LanguageCell.h"
#import "AppDelegate.h"

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
    [self.languageTable flashScrollIndicators];
    [NSLocale ttt_resetRuntimeLocale];
    [NSBundle ttt_resetLanguage];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    if (self.callVC == nil) {
        self.callVC = [[CallingViewController alloc] initWithNibName:@"CallingViewController" bundle:nil];
    }
    [AppDelegate ad].isPortuguese = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate Methods

- (NSInteger)numberOfSectionsInTabView: (UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [LanguageCell LanguageCellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"LanguageCell";
    
    LanguageCell *cell = (LanguageCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"LanguageCell" owner:self options:nil];
        for (id anObject in nib)
        {
            if ([anObject isKindOfClass:[LanguageCell class]]) {
                cell = (LanguageCell *)anObject;
            }
        }
    }
    [cell.languageButton setTag:indexPath.row];
    [cell.languageButton addTarget:self action:@selector(selectActionBtnTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    if (indexPath.row == 0) {
        [cell setupAsBahasaIndonesia];
    }
    else if (indexPath.row == 1){
        [cell setupAsChinese];
    }
    else if (indexPath.row == 2){
        [cell setupAsTraditionalChinese];
    }
    else if (indexPath.row == 3){
        [cell setupAsGerman];
    }
    else if (indexPath.row == 4){
        [cell setupAsEnglish];
    }
    else if (indexPath.row == 5){
        [cell setupAsKorean];
    }
    else if (indexPath.row == 6){
        [cell setupAsPortuguese];
    }
    else if (indexPath.row == 7){
        [cell setupAsSpanish];
    }
    
    return cell;
}

#pragma mark - Table action button

- (void)selectActionBtnTapped:(id)sender
{
    int selectedIndex = ((UIButton *)sender).tag;
    NSLog(@"SELECTED INDEX = %d", selectedIndex);
    if (selectedIndex == 0) {
        [NSBundle ttt_overrideLanguage:@"id-ID"];
        [NSLocale ttt_overrideRuntimeLocale:[NSLocale localeWithLocaleIdentifier:@"id-ID"]];
    }
    else if (selectedIndex == 1){
        [NSBundle ttt_overrideLanguage:@"zh-Hans"];
        [NSLocale ttt_overrideRuntimeLocale:[NSLocale localeWithLocaleIdentifier:@"zh-Hans"]];
    }
    else if (selectedIndex == 2)
    {
        [NSBundle ttt_overrideLanguage:@"zh-Hant"];
        [NSLocale ttt_overrideRuntimeLocale:[NSLocale localeWithLocaleIdentifier:@"zh-Hant"]];
    }
    else if (selectedIndex == 3)
    {
        [NSBundle ttt_overrideLanguage:@"de"];
        [NSLocale ttt_overrideRuntimeLocale:[NSLocale localeWithLocaleIdentifier:@"de"]];
    }
    else if (selectedIndex == 4)
    {
        [NSBundle ttt_overrideLanguage:@"en"];
        [NSLocale ttt_overrideRuntimeLocale:[NSLocale localeWithLocaleIdentifier:@"en"]];
    }
    else if (selectedIndex == 5)
    {
        [NSBundle ttt_overrideLanguage:@"ko"];
        [NSLocale ttt_overrideRuntimeLocale:[NSLocale localeWithLocaleIdentifier:@"ko"]];
    }
    else if (selectedIndex == 6)
    {
        [AppDelegate ad].isPortuguese = YES;
        [NSBundle ttt_overrideLanguage:@"pt"];
        [NSLocale ttt_overrideRuntimeLocale:[NSLocale localeWithLocaleIdentifier:@"pt"]];
    }
    else if (selectedIndex == 7)
    {
        [NSBundle ttt_overrideLanguage:@"es"];
        [NSLocale ttt_overrideRuntimeLocale:[NSLocale localeWithLocaleIdentifier:@"es"]];
    }
    [self performSelector:@selector(startActivity) withObject:nil afterDelay:0.5];
}

- (void)startActivity
{
    [self.navigationController pushViewController:self.callVC animated:YES];
}

@end
