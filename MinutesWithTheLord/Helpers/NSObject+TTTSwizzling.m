#import <objc/runtime.h>
#import "NSObject+TTTSwizzling.h"

@implementation NSObject (TTTSwizzling)

+ (void)ttt_swizzleClassMethod:(SEL)original withReplacement:(SEL)swizzled
{
    method_exchangeImplementations(class_getClassMethod(self, original), class_getClassMethod(self, swizzled));
}

+ (void)ttt_swizzleInstanceMethod:(SEL)original withReplacement:(SEL)swizzled
{
    method_exchangeImplementations(class_getInstanceMethod(self, original), class_getInstanceMethod(self, swizzled));
}

@end