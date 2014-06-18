#import <Foundation/Foundation.h>

@interface NSBundle (TTTOverrideLanguage)

+ (void)ttt_overrideLanguage:(NSString *)language;

+ (void)ttt_resetLanguage;

@end