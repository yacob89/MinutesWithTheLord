//
//  BottomNavBar.m
//  MinutesWithTheLord
//
//  Created by Maysora on 5/6/14.
//  Copyright (c) 2014 churchinbandung. All rights reserved.
//

#import "BottomNavBar.h"

@interface BottomNavBar ()

@end

@implementation BottomNavBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [[NSBundle mainBundle] loadNibNamed:@"BottomNavBar" owner:self options:nil];
        [self addSubview:self.view];
        [self setupView];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self addSubview:self.view];
    [self setupView];
}

- (void)setupView
{
    // Additional code
}

@end
