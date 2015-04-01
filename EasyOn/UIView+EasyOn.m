//
//  UIView+EasyOn.m
//  ObjectiveCPractice
//
//  Created by LEE CHIEN-MING on 3/31/15.
//  Copyright (c) 2015 Derek. All rights reserved.
//

#import "UIView+EasyOn.h"

static Class UIViewSubclassFromSelector(SEL aSelector) {
    Class subclass = nil;
    NSString *selectorString = NSStringFromSelector(aSelector);
    NSRegularExpression *expression = [[NSRegularExpression alloc] initWithPattern:@"add(\\w+):"
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:nil];
    
    NSTextCheckingResult *result = nil;
    NSArray *matches = [expression matchesInString:selectorString options:0 range:NSMakeRange(0, [selectorString length])];
    
    if ((result = [matches firstObject])) {
        selectorString = [selectorString substringWithRange:[result rangeAtIndex:1]];
        Class aSubclass = NSClassFromString(selectorString);
        
        if ([aSubclass isSubclassOfClass:[UIView class]]) {
            subclass = aSubclass;
        }
    }
    
    return subclass;
}

@implementation UIView (EasyOn)
- (id (^)(__unsafe_unretained Class, UIViewCreationBlock))add
{
    __block typeof(self) __weak weakSf = self;
    
    return ^(Class ofUIViewSubclass, UIViewCreationBlock aBlock) {
        if (![ofUIViewSubclass isSubclassOfClass:[UIView class]]) {
            ofUIViewSubclass = [UIView class];
        }
        
        UIView *subview = [[ofUIViewSubclass alloc] initWithFrame:CGRectZero];
        if (aBlock) aBlock(subview);
        [weakSf addSubview:subview];
        return subview;
    };
}

- (id)addUIViewSubclassView:(Class)UIViewSubclass withCreation:(UIViewCreationBlock)aBlock
{
    UIView * subview = [[UIViewSubclass alloc] initWithFrame:CGRectZero];
    if (aBlock) aBlock(subview);
    [self addSubview:subview];
    return subview;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    if (UIViewSubclassFromSelector(aSelector)) {
        return [[self class] instanceMethodSignatureForSelector:NSSelectorFromString(@"addUIViewSubclassView:withCreation:")];
    }
    
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    void *block = nil;
    Class subclass = UIViewSubclassFromSelector([anInvocation selector]);
    
    [anInvocation getArgument:&block atIndex:2];
    [anInvocation setArgument:&subclass atIndex:2];
    [anInvocation setArgument:&block atIndex:3];
    [anInvocation setSelector:NSSelectorFromString(@"addUIViewSubclassView:withCreation:")];
    [anInvocation invokeWithTarget:self];
}
@end
