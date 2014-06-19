//
//  LanguageCell.m
//  MinutesWithTheLord
//
//  Created by Maysora on 6/18/14.
//  Copyright (c) 2014 churchinbandung. All rights reserved.
//

#import "LanguageCell.h"
#define GREEN_COLOR        [UIColor colorWithRed:(103/255.0) green:(200/255.0) blue:(129/255.0) alpha:1]

@interface LanguageCell ()

@end

@implementation LanguageCell

+ (CGFloat)LanguageCellHeight
{
    return 65.0f;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)setupView
{
    
}

- (void)setupAsBahasaIndonesia
{
    [self.languageButton setTitle:@"Bahasa Indonesia" forState:UIControlStateNormal];
    self.languageButton.backgroundColor = [self colorWithHexString:@"6600FF"];
    [self.languageButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (void)setupAsEnglish
{
    [self.languageButton setTitle:@"English (US)" forState:UIControlStateNormal];
    self.languageButton.backgroundColor = [self colorWithHexString:@"6699FF"];
    [self.languageButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

- (void)setupAsChinese
{
    [self.languageButton setTitle:@"中文(简体)" forState:UIControlStateNormal];
    self.languageButton.backgroundColor = [self colorWithHexString:@"6633FF"];
    [self.languageButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (void)setupAsGerman
{
    [self.languageButton setTitle:@"Deutch" forState:UIControlStateNormal];
    self.languageButton.backgroundColor = [self colorWithHexString:@"6666FF"];
    [self.languageButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (void)setupAsSpanish
{
    [self.languageButton setTitle:@"Spanish" forState:UIControlStateNormal];
    self.languageButton.backgroundColor = [self colorWithHexString:@"66FFFF"];
    [self.languageButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

- (void)setupAsKorean
{
    [self.languageButton setTitle:@"한국어" forState:UIControlStateNormal];
    self.languageButton.backgroundColor = [self colorWithHexString:@"66CCFF"];
    [self.languageButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

- (void)setupAsTraditionalChinese
{
    [self.languageButton setTitle:@"中文(繁體)" forState:UIControlStateNormal];
    self.languageButton.backgroundColor = [self colorWithHexString:@"6600FF"];
    [self.languageButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (void)setupAsPortuguese
{
    [self.languageButton setTitle:@"Portuguese" forState:UIControlStateNormal];
    self.languageButton.backgroundColor = [self colorWithHexString:@"6600FF"];
    [self.languageButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

-(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

@end
