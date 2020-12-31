//
//  NSURLProtocol+WebKitSupport.h
//  fitness
//
//  Created by Minster on 2020/6/11.
//  Copyright © 2020 yuedong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLProtocol (WebKitSupport)

+ (void)wk_registerScheme:(NSString*)scheme;

+ (void)wk_unregisterScheme:(NSString*)scheme;

@end
