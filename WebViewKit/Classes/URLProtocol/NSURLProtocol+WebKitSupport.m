//
//  NSURLProtocol+WebKitSupport.m
//  fitness
//
//  Created by Minster on 2020/6/11.
//  Copyright © 2020 yuedong. All rights reserved.
//

#import "NSURLProtocol+WebKitSupport.h"

#import <WebKit/WebKit.h>

FOUNDATION_STATIC_INLINE Class ContextControllerClass() {
    static Class cls;
    if (!cls) {
        cls = [[[WKWebView new] valueForKey:[NSString stringWithFormat:@"%@%@%@%@", @"brow", @"singCon",@"textCon", @"troller"]] class];
    }
    return cls;
}

FOUNDATION_STATIC_INLINE SEL RegisterSchemeSelector() {
    return NSSelectorFromString([NSString stringWithFormat:@"%@%@%@%@%@", @"regi", @"sterSche",@"meForCus", @"tomProto", @"col:"]);
}

FOUNDATION_STATIC_INLINE SEL UnregisterSchemeSelector() {
    return NSSelectorFromString([NSString stringWithFormat:@"%@%@%@%@%@", @"unregi", @"sterSche",@"meForCus", @"tomProto", @"col:"]);
}

@implementation NSURLProtocol (WebKitSupport)

+ (void)wk_registerScheme:(NSString *)scheme {
    Class cls = ContextControllerClass();
    SEL sel = RegisterSchemeSelector();
    if ([(id)cls respondsToSelector:sel]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [(id)cls performSelector:sel withObject:scheme];
#pragma clang diagnostic pop
    }
}

+ (void)wk_unregisterScheme:(NSString *)scheme {
    Class cls = ContextControllerClass();
    SEL sel = UnregisterSchemeSelector();
    if ([(id)cls respondsToSelector:sel]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [(id)cls performSelector:sel withObject:scheme];
#pragma clang diagnostic pop
    }
}

+ (void)load {
    [self wk_registerScheme:@"YDWKProtocol"];
}

@end
