//
// Created by Godlike on 2020/2/24.
// Copyright (c) 2020 yuedong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YDWebViewLocalActionParam;

@interface YDWebViewLocalAction : NSObject

@property(nonatomic, strong) YDWebViewLocalActionParam *param;

- (void)solveLocalAction:(YDWebViewLocalActionParam *)param then:(void(^)(YDWebViewLocalActionParam *outParam, NSError *error))then;

@end
