//
//  YDWebViewBarButtonItem.m
//  fitness
//
//  Created by Godlike on 2020/2/26.
//  Copyright © 2020 yuedong. All rights reserved.
//

#import "YDWebViewBarButtonItem.h"
#import "YDWebViewRightActionParam.h"
#import "YDWebViewLocalActionParam.h"
#import "YDWebViewLocalAction.h"
#import "YDWebViewController.h"

@implementation YDWebViewBarButtonItem

- (instancetype)initWithParam:(YDWebViewRightActionParam *)param {
    self = [super init];
    if (self) {
        _param = param;
        self.target = self;
        self.action = @selector(rightAction:);
    }
    return self;
}
+ (instancetype)instanceWithParam:(YDWebViewRightActionParam *)param {
    YDWebViewBarButtonItem *item = [[YDWebViewBarButtonItem alloc] initWithParam:param];
    return item;
}

- (void)rightAction:(id)sender {
    [self solveRightAction:self.param then:^(YDWebViewLocalActionParam *outParam, NSError *error) {
        
    }];
}

- (void)solveRightAction:(YDWebViewRightActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    switch (param.type) {
        case YDWebViewRightActionTypeToWebView: {
            void(^toWebView)(NSString *URLString, UIViewController *fromVC) = ^(NSString *URLString, UIViewController *fromVC){
                YDWebViewController *webViewController = [YDWebViewController instanceWithType:YDWebViewTypeWKWebView configuration:nil];
                webViewController.originalURLString = URLString;
                [fromVC.navigationController pushViewController:webViewController animated:YES];
            };
            if ([NSThread isMainThread]) {
                toWebView(param.URLString, param.fromVC);
            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    toWebView(param.URLString, param.fromVC);
                });
            }
            !then?:then(param.localActionParam, nil);
            break;
        }
        case YDWebViewRightActionTypeLocalAction: {
            [param.localActionParam.action solveLocalAction:param.localActionParam then:^(YDWebViewLocalActionParam *outParam, NSError *error) {
                YDLogD(@"webView", @"localAction", param.localActionParam.actionString, @"error: %@", error);
                SEL selector = [YDWebViewLocalActionParam allVCActionSelectorOfActionID:param.localActionParam.actionID];
                if ([param.localActionParam.webViewController respondsToSelector:selector]) {
                    [param.localActionParam.webViewController performSelectorOnMainThread:selector withObject:outParam waitUntilDone:NO];
                }
                !then?:then(param.localActionParam, error);
            }];
            break;
        }
        default:
            break;
    }
    
}

- (void)trigger {
    if ([self.target respondsToSelector:self.action]) {
        [self.target performSelectorOnMainThread:self.action withObject:self waitUntilDone:YES];
    }
}

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
}

@end
