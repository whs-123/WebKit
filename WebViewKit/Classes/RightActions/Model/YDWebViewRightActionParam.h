//
//  YDWebViewRightActionParam.h
//  fitness
//
//  Created by Godlike on 2020/2/26.
//  Copyright © 2020 yuedong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YDWebViewLocalActionParam;

typedef NS_ENUM(NSUInteger, YDWebViewRightActionType) {
    YDWebViewRightActionTypeNone,
    YDWebViewRightActionTypeToWebView,
    YDWebViewRightActionTypeLocalAction
};

typedef NS_ENUM(NSUInteger, YDWebViewRightItemIndex) {
    YDWebViewRightItemIndexNone = 0,
    YDWebViewRightItemIndexShareButton = 99,
};

NS_ASSUME_NONNULL_BEGIN

@interface YDWebViewRightActionParam : NSObject

@property (nonatomic, assign) YDWebViewRightActionType type;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, copy) NSString *URLString;
@property(nonatomic, weak) UIViewController *fromVC;
@property (nonatomic, strong) YDWebViewLocalActionParam *localActionParam;

+ (instancetype)instanceWithType:(YDWebViewRightActionType)type URLString:(NSString *)URLString index:(NSInteger)index localActionParam:(YDWebViewLocalActionParam *)localActionParam;

@end

NS_ASSUME_NONNULL_END
