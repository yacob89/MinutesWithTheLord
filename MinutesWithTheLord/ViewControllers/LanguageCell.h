//
//  LanguageCell.h
//  MinutesWithTheLord
//
//  Created by Maysora on 6/18/14.
//  Copyright (c) 2014 churchinbandung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LanguageCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIButton *languageButton;

+ (CGFloat)LanguageCellHeight;
- (void)setupAsBahasaIndonesia;
- (void)setupAsEnglish;
- (void)setupAsChinese;
- (void)setupAsGerman;
- (void)setupAsSpanish;
- (void)setupAsKorean;
- (void)setupAsTraditionalChinese;
- (void)setupAsPortuguese;

@end
