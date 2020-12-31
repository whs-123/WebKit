//
//  YDWebViewRightActionParam.m
//  fitness
//
//  Created by Godlike on 2020/2/26.
//  Copyright © 2020 yuedong. All rights reserved.
//

#import "YDWebViewRightActionParam.h"
#import "YDWebViewLocalActionParam.h"

@implementation YDWebViewRightActionParam

+ (instancetype)instanceWithType:(YDWebViewRightActionType)type URLString:(NSString *)urlString index:(NSInteger)index localActionParam:(YDWebViewLocalActionParam *)localActionParam {
    YDWebViewRightActionParam *param = [YDWebViewRightActionParam new];
    param.type = type;
    param.index = index;
    param.URLString = urlString;
    param.localActionParam = localActionParam;
    return param;
}


@end
