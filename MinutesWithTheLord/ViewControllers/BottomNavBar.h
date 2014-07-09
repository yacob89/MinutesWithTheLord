//
//  BottomNavBar.h
//  MinutesWithTheLord
//
//  Created by yacob on 5/6/14.
//  Copyright (c) 2014 churchinbandung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BottomNavBar : UIView

@property (strong, nonatomic) IBOutlet UIView *view;
@property (strong, nonatomic) IBOutlet UIButton *pauseButton;
@property (strong, nonatomic) IBOutlet UIButton *backwardButton;
@property (strong, nonatomic) IBOutlet UIButton *restartButton;
@property (strong, nonatomic) IBOutlet UIButton *stopButton;

- (void)setupAsNormalPage;
- (void)setupAsEndPage;

@end
