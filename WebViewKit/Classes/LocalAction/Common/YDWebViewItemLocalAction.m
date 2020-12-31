//
//  YDWebViewItemLocalAction.m
//  SportsBar
//
//  Created by Minster on 2020/11/5.
//  Copyright © 2020 yuedong. All rights reserved.
//

#import "YDWebViewItemLocalAction.h"
#import "YDWebViewLocalActionParam.h"
#import "UIViewController+YDAdd.h"
#import "YDWebViewController.h"

#import "YDShareManager.h"
#import "YDJumpTool.h"
#import "YDFeedbackServiceProtocol.h"
#import "BHServiceManager.h"

@implementation YDWebViewItemLocalAction

- (void)solveLocalAction:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    [super solveLocalAction:param then:then];
    switch (param.actionID) {
        case YDWebViewLocalActionIDBackItemAction: {
            [param.webViewController yd_popUp];
            break;
        }
        case YDWebViewLocalActionIDCloseItemAction: {
            if (param.webViewController.navigationController) {
                [param.webViewController.navigationController popViewControllerAnimated:YES];
            } else {
                [param.webViewController dismissViewControllerAnimated:YES completion:^{
                                    
                }];
            }
            break;
        }
        case YDWebViewLocalActionIDShareItemAction: {
            [YDShareManager shared].webEventModel.isWebUseLocalShare = YES;
            [param.webViewController evaluateJavaScript:@"MetaShareInfo();" completionHandler:^(id result, NSError *error) {
                
            }];
            break;
        }
        case YDWebViewLocalActionIDFeedbackItemAction: {
            id<YDFeedbackServiceProtocol> service = [[BHServiceManager sharedManager] createService:@protocol(YDFeedbackServiceProtocol) withServiceName:nil shouldCache:YES];
            [service openFeedbackFromVC:param.webViewController];
            break;
        }
        case YDWebViewLocalActionIDNativeIntItemAction: {
            [[YDJumpTool sharedTool] jumpToNativeInt:param.nativeInt fromVC:param.webViewController];
            break;
        }
        default: {
            break;
        }
    }
    !then?:then(param, nil);
}

@end
