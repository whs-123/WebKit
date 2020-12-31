//
//  YDWebViewBarButtonItem.h
//  fitness
//
//  Created by Godlike on 2020/2/26.
//  Copyright © 2020 yuedong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YDWebViewRightActionParam;

NS_ASSUME_NONNULL_BEGIN

@interface YDWebViewBarButtonItem : UIBarButtonItem

@property (nonatomic, strong) YDWebViewRightActionParam *param;

- (instancetype)initWithParam:(YDWebViewRightActionParam *)param;
+ (instancetype)instanceWithParam:(YDWebViewRightActionParam *)param;

- (void)trigger;

@end

NS_ASSUME_NONNULL_END
