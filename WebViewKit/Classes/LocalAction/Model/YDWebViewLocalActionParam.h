//
// Created by Godlike on 2020/2/24.
// Copyright (c) 2020 yuedong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebViewJavascriptBridgeBase.h"

@class YDWebViewLocalAction, YDWebStore;
@class YDWebViewController;
@class YDWebService;

typedef NS_ENUM(NSUInteger, YDWebViewLocalActionID) {
    YDWebViewLocalActionIDNone = 0,
    //common
    YDWebViewLocalActionIDShowShareItem,
    YDWebViewLocalActionIDShowCustomItem,
    YDWebViewLocalActionIDBackItemAction,
    YDWebViewLocalActionIDCloseItemAction,
    YDWebViewLocalActionIDShareItemAction,
    YDWebViewLocalActionIDFeedbackItemAction,
    YDWebViewLocalActionIDNativeIntItemAction,
    YDWebViewLocalActionIDGetYodoInfo,
    YDWebViewLocalActionIDConfigWeb,
    //private
    //old
    //common
    YDWebViewLocalActionIDShare,
    YDWebViewLocalActionIDShareParam,
    YDWebViewLocalActionIDShareText,
    YDWebViewLocalActionIDReportEvent,
    YDWebViewLocalActionIDReportTimeEventStart,
    YDWebViewLocalActionIDReportTimeEventEnd,
    YDWebViewLocalActionIDReportEventUm,
    YDWebViewLocalActionIDReportLogEvent,
    YDWebViewLocalActionIDHidePullRefresh,
    YDWebViewLocalActionIDOpenUrlInternal,
    YDWebViewLocalActionIDOpenUrlNewWindow,
    YDWebViewLocalActionIDHideShareBnt,
    YDWebViewLocalActionIDShowShareBnt,
    YDWebViewLocalActionIDSelectUploadPic,
    YDWebViewLocalActionIDPhotographUploadPic,
    YDWebViewLocalActionIDPhotographToBase64,
    YDWebViewLocalActionIDBackRefresh,
    YDWebViewLocalActionIDOpenUrlBySafari,
    YDWebViewLocalActionIDWebBrowser,
    YDWebViewLocalActionIDRightTitleText,
    YDWebViewLocalActionIDDownloadImg,
    YDWebViewLocalActionIDDownloadImgBase64,
    YDWebViewLocalActionIDDownloadImgGetWebImage,
    YDWebViewLocalActionIDToLocalVc,
    YDWebViewLocalActionIDCloseWindow,
    YDWebViewLocalActionIDCloseWindowAll,
    YDWebViewLocalActionIDReturnToNavRoot,
    YDWebViewLocalActionIDToLocalApp,
    YDWebViewLocalActionIDBackbtnMethod,
    YDWebViewLocalActionIDPopGestureForbid,
    YDWebViewLocalActionIDAddPhoto,
    YDWebViewLocalActionIDToast,
    YDWebViewLocalActionIDBackSound,
    YDWebViewLocalActionIDBackLockLightScreenSound,
    YDWebViewLocalActionIDBackLockLightscreenPause,
    YDWebViewLocalActionIDBackLockLightscreenViewLoaded,
    YDWebViewLocalActionIDNativeIntJump,
    YDWebViewLocalActionIDYDCalendarAddRemind,
    YDWebViewLocalActionIDYDCalendarDeleteRemind,
    YDWebViewLocalActionIDSetVcTitle,
    YDWebViewLocalActionIDShowRightImgBtn,
    //business
    YDWebViewLocalActionIDRequestLocation,
    YDWebViewLocalActionIDDrawreward,
    YDWebViewLocalActionIDDrawrewardIOS,
    YDWebViewLocalActionIDLogin,
    YDWebViewLocalActionIDPersoninfo,
    YDWebViewLocalActionIDAccountBind,
    YDWebViewLocalActionIDStartRun,
    YDWebViewLocalActionIDInviteFriendCircle,
    YDWebViewLocalActionIDSportFitness,
    YDWebViewLocalActionIDToSharedRide,
    YDWebViewLocalActionIDChat,
    YDWebViewLocalActionIDBindSuccess,
    YDWebViewLocalActionIDBindFail,
    YDWebViewLocalActionIDBindParamInvalid,
    YDWebViewLocalActionIDHealthBack2Today,
    YDWebViewLocalActionIDJump2FootPrint,
    YDWebViewLocalActionIDFeed,
    YDWebViewLocalActionIDBicycleRun,
    YDWebViewLocalActionIDFitnessWatermark,
    YDWebViewLocalActionIDWechatRank,
    YDWebViewLocalActionIDPushPedometer,
    YDWebViewLocalActionIDStartChest,
    YDWebViewLocalActionIDAttend,
    YDWebViewLocalActionIDToFeedback,
    YDWebViewLocalActionIDGetMembershipInfo,
    YDWebViewLocalActionIDPromptLogin,
    YDWebViewLocalActionIDShowFeedback,
    YDWebViewLocalActionIDTheLovingRun,
    YDWebViewLocalActionIDShareAIFingerReport,
    YDWebViewLocalActionIDGoToMapiHddgoodGame,
    YDWebViewLocalActionIDPlayRewardVideo,
    YDWebViewLocalActionIDOpenPhoneBind,
    YDWebViewLocalActionIDMembershipChanged,
    YDWebViewLocalActionIDWeekChallengeApply,
    YDWebViewLocalActionIDRequestTonguePic,
    YDWebViewLocalActionIDSetNavBarStyle,
    //ad
    YDWebViewLocalActionIDAdHandleUrl,
    YDWebViewLocalActionIDAdGet,
    YDWebViewLocalActionIDAdStatisticShow,
    YDWebViewLocalActionIDAdStatisticClick,
    //pay
    YDWebViewLocalActionIDAlipay,
    YDWebViewLocalActionIDPay,
    YDWebViewLocalActionIDIapGetYuedProduct,
    YDWebViewLocalActionIDIapBuyYuedProduct,
    YDWebViewLocalActionIDIapValidateLastPay,
    YDWebViewLocalActionIDIapGetProductInfo,
    YDWebViewLocalActionIDIapBuyProduct,
    YDWebViewLocalActionIDIapValidateCallback,
    YDWebViewLocalActionIDApplepayUpStartPay,
    YDWebViewLocalActionIDCashPayCallback,
    YDWebViewLocalActionIDCcbPayOcr,
    YDWebViewLocalActionIDCcbPayFaceVerify,
    //third
    YDWebViewLocalActionIDWechatSubscribeAuth,
    YDWebViewLocalActionIDOpenWechatMiniProgram,
    YDWebViewLocalActionIDYDAliToDetail,
    YDWebViewLocalActionIDYDAliOauth,
    //special
    YDWebViewLocalActionIDQrCode,
    YDWebViewLocalActionIDCheckAICMaxCompeteVideo,
    
    // aic
    YDWebViewLocalActionAICoachPlayVoice,
    YDWebViewLocalActionAICoachStopPlayVoice,
};



@interface YDWebViewLocalActionParam : NSObject

@property (nonatomic, assign) YDWebViewLocalActionID actionID;
@property (nonatomic, copy) NSString *actionString;
@property(nonatomic, assign) NSInteger nativeInt;
@property (nonatomic, strong) id parameters;
@property (nonatomic, copy) NSString *URLString;
@property (nonatomic, strong) NSURL *URL;
@property (nonatomic, copy) NSDictionary *userInfo;
@property (nonatomic, copy) WVJBResponseCallback bridgeCallback;
@property (nonatomic, strong) YDWebViewLocalAction *action;
@property (nonatomic, weak) YDWebStore *store;
@property (nonatomic, weak) YDWebViewController *webViewController;
@property (nonatomic, weak) YDWebService *service;
@property(nonatomic, copy) void (^messageHandlerReply)(id reply, NSString * errorMessage);

+ (instancetype)instanceWithID:(YDWebViewLocalActionID)actionID parameters:(id)parameters URLString:(NSString *)URLString;
+ (instancetype)instanceWithActionString:(NSString *)actionString parameters:(id)parameters URLString:(NSString *)URLString;
+ (instancetype)instanceWithID:(YDWebViewLocalActionID)actionID parameters:(id)parameters;
+ (instancetype)instanceWithActionString:(NSString *)actionString parameters:(id)parameters;

+ (NSDictionary<NSString *, NSNumber *> *)commonActionIDOfString;
+ (NSDictionary<NSNumber *, NSString *> *)commonActionOfActionID;
+ (NSDictionary<NSNumber *, NSString *> *)commonVCActionSelectorStringOfActionID;

+ (YDWebViewLocalActionID)commonActionIDOfString:(NSString *)actionString;
+ (YDWebViewLocalAction *)commonActionOfActionID:(YDWebViewLocalActionID)actionID;
+ (SEL)commonVCActionSelectorOfActionID:(YDWebViewLocalActionID)actionID;

+ (NSDictionary<NSString *, NSNumber *> *)privateActionIDOfString;
+ (NSDictionary<NSNumber *, NSString *> *)privateActionOfActionID;
+ (NSDictionary<NSNumber *, NSString *> *)privateVCActionSelectorStringOfActionID;

+ (YDWebViewLocalActionID)privateActionIDOfString:(NSString *)actionString;
+ (YDWebViewLocalAction *)privateActionOfActionID:(YDWebViewLocalActionID)actionID;
+ (SEL)privateVCActionSelectorOfActionID:(YDWebViewLocalActionID)actionID;

+ (SEL)allVCActionSelectorOfActionID:(YDWebViewLocalActionID)actionID;


- (void)setService:(YDWebService *)service;

@end
