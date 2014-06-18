#import <Foundation/Foundation.h>

@interface NSLocale (TTTOverrideLocale)

+ (void)ttt_overrideRuntimeLocale:(NSLocale *)locale;

+ (void)ttt_resetRuntimeLocale;

@end