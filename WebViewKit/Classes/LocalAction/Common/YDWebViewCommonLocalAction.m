//
//  YDWebViewCommonLocalAction.m
//  SportsBar
//
//  Created by Minster on 2020/11/26.
//  Copyright © 2020 yuedong. All rights reserved.
//

#import "YDWebViewCommonLocalAction.h"
#import "YDWebViewLocalActionParam.h"
#import "YDWebViewController.h"

#import "MSAppKit.h"
#import "MSUtil.h"
#import "MSLocalizable.h"
#import "NSDictionary+YDAdd.h"
#import "YDCache+YDAppCache.h"
#import "YDCache+YDLocationCache.h"

#import "YYModel.h"
#import <DateTools.h>
#import <WebKit/WebKit.h>

@implementation YDWebViewCommonLocalAction

- (void)solveLocalAction:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    [super solveLocalAction:param then:then];
    switch (param.actionID) {
        case YDWebViewLocalActionIDGetYodoInfo: {
            [self solveLocalActionGetYodoInfo:param then:then];
            break;
        }
        case YDWebViewLocalActionIDConfigWeb: {
            [self solveLocalActionConfigWeb:param then:then];
            break;
        }
        default: {
            
        }
    }
}

- (void)solveLocalActionGetYodoInfo:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSURL *URL = param.webViewController.URL;
    if (!URL) {
        !then?:then(param, nil);
        return;
    }
    NSMutableDictionary *info = @{}.mutableCopy;
    [info ms_setObject:[MSAppKit getAppVersion] forKey:@"v"];
    [info ms_setObject:[YDCache app_userId] forKey:@"user_id"];
    [info ms_setObject:[YDCache app_xyy] forKey:@"sid"];
    [info ms_setObject:[MSAppKit getIDFA] forKey:@"device_id"];
    [info ms_setObject:@([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus) forKey:@"network_status"];
    [info ms_setObject:[MSLocalizable shared].language forKey:@"language"];
    [info ms_setObject:[MSUtil getHourOffsetStr] forKey:@"timezone"];
    [info ms_setObject:[MSUtil getLocaleCode] forKey:@"locale"];
    [info ms_setObject:[MSAppKit getDeviceName] forKey:@"phone_type"];
    [info ms_setObject:[MSAppKit getOSVersion] forKey:@"os_version"];
    [info ms_setObject:([YDCache location_locLongitude] ? @([YDCache location_locLongitude]): @12.1) forKey:@"longitude"];
    [info ms_setObject:([YDCache location_locLatitude] ? @([YDCache location_locLatitude]): @12.1) forKey:@"latitude"];
    [info ms_setObject:@((NSUInteger) ([NSDate date].timeIntervalSince1970 * 1000)) forKey:@"timestamp"];
    [info ms_setObject:[MSAppKit getAppChannel] forKey:@"channel"];
    [info ms_setObject:@([UIScreen mainScreen].scale) forKey:@"scale"];
    [info ms_setObject:@([UIScreen mainScreen].bounds.size.width) forKey:@"display_width"];
    [info ms_setObject:@([UIScreen mainScreen].bounds.size.height) forKey:@"display_height"];
    [info ms_setObject:SOURCE forKey:@"f"];
    !param.messageHandlerReply?:param.messageHandlerReply(info, nil);
    NSDictionary *dic = param.parameters;
    NSString *callbackHandler = dic[@"callback"];
    if (callbackHandler.length) {
        [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@(%@);", callbackHandler, [info yy_modelToJSONString]] completionHandler:^(id result, NSError *error) {
                
        }];
    }
    
    !then?:then(param, nil);
}

- (void)solveLocalActionConfigWeb:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSNumber *type = dic[@"type"];
    NSNumber *value = dic[@"value"];
    switch (type.integerValue) {
        case 1: {
            WKWebView *webView = param.webViewController.webView.webViewInstance;
            webView.allowsBackForwardNavigationGestures = value.boolValue;
            break;
        }
        case 2: {
            param.webViewController.navigationController.interactivePopGestureRecognizer.enabled = value.boolValue;
            break;
        }
            
        default:
            break;
    }
    !then?:then(param, nil);
}

@end
