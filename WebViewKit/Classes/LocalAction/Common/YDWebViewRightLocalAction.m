//
// Created by Godlike on 2020/2/27.
// Copyright (c) 2020 yuedong. All rights reserved.
//

#import "YDWebViewRightLocalAction.h"
#import "YDWebViewLocalActionParam.h"

@implementation YDWebViewRightLocalAction {

}

- (void)solveLocalAction:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    [super solveLocalAction:param then:then];
    switch (param.actionID) {
        case YDWebViewLocalActionIDNone: {
            break;
        }
        default: {
            break;
        }
    }
}


@end
