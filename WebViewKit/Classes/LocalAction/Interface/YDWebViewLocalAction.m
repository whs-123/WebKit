//
// Created by Godlike on 2020/2/24.
// Copyright (c) 2020 yuedong. All rights reserved.
//

#import "YDWebViewLocalAction.h"


@implementation YDWebViewLocalAction {

}
- (void)solveLocalAction:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    self.param = param;
//    !then?:then(param, nil);
}

@end
