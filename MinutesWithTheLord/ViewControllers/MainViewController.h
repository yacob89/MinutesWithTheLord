//
//  MainViewController.h
//  MinutesWithTheLord
//
//  Created by yacob on 5/6/14.
//  Copyright (c) 2014 churchinbandung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UITableViewDataSource, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIButton *indonesiaButton;
@property (strong, nonatomic) IBOutlet UIButton *chineseButton;
@property (strong, nonatomic) IBOutlet UIButton *germanButton;
@property (strong, nonatomic) IBOutlet UIButton *englishButton;
@property (strong, nonatomic) IBOutlet UIButton *koreanButton;
@property (strong, nonatomic) IBOutlet UIButton *spanishButton;
@property (strong, nonatomic) IBOutlet UITableView *languageTable;


@end
