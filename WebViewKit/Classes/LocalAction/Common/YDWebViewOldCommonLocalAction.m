//
//  YDWebViewOldCommonLocalAction.m
//  fitness
//
//  Created by Godlike on 2020/3/5.
//  Copyright © 2020 yuedong. All rights reserved.
//

#import "YDWebViewOldCommonLocalAction.h"
#import "YDWebViewLocalActionParam.h"
#import "YDWebViewController.h"
#import "YDWebService.h"
#import "YDWebStore.h"
#import "YDWebViewBarButtonItem.h"
#import "YDWebViewRightActionParam.h"
#import "YDWebViewHelper.h"
#import "YDAICVoiceKit.h"
#import "YDAICVoiceModel.h"

#import "YDCommonColor.h"
#import "YDStyle.h"
#import "YDLocationServiceProtocol.h"
#import "YDAppServiceProtocol.h"
#import "YDPedometerProtocol.h"
#import "YDFeedbackServiceProtocol.h"
#import "YDADRequestServiceProtocol.h"
#import "YDADProtocol.h"
#import "YDThirdAccountProtocol.h"
#import "BHServiceManager.h"

#import "YYWebImageManager.h"
#import "JLAuthorizationManager.h"
#import "JLCalendarPermission.h"
#import <EventKit/EventKit.h>
#import "YDQIndexDefine.h"
#import "YDAICoachDefine.h"

#import "YDJumpTool.h"
#import "NSMutableDictionary+YDAdd.h"
#import "YDCategories.h"
#import "YYModel.h"
#import "MSVCRouter.h"
#import "YDSportTool.h"
#import "YDRewardMgr.h"
#import "YDCache+YDAppCache.h"
#import "YDURL.h"
#import "MSUtil.h"
#import <DateTools.h>
#import "MSLocalizable.h"
#import "YDShareManager.h"
#import "YDShareItem.h"
#import "YDStatisticsMgr.h"
#import "TYSnapshot.h"
#import "YDAimDefines.h"
#import "YDReward.h"
#import "YDTools.h"
#import "TZImageManager.h"
#import "YDPayTool.h"
#import "YDWechatHelper.h"
#import "WBGImageEditor.h"
#import "YDRunModel.h"
#import "YDUMConfig.h"
#import "YDAudioSessionMgr.h"
#import "YDCache+YDLoginAndRegister.h"
#import "YDLoginMgr.h"
#import "YDIndexNWDAO.h"
#import "YDCache+YDIMCache.h"
#import "YDTreasureMgr.h"
#import "YDWebNWDAO.h"
#import "YDMembershipMgr.h"
#import "YDAIFingerTestGetHealthExaminationRecordOneApi.h"
#import "YDWebAIFingerTestShareView.h"
#import "YDAIFingerTestShareApi.h"
#import "YDAIFingerTestResultModel.h"
#import "YDAdMgr.h"
#import "YDApplePayMgr.h"
#import "YDUPApplePayManager.h"
#import "YDCCBPayTool.h"
#import <AlibcTradeSDK/AlibcTradeSDK.h>
#import <AlibabaAuthSDK/ALBBSDK.h>
#import "YDBgMediaMgr.h"
#import "YDMedia.h"
#import "YDAccountMgr.h"

#import "YDRunPrepareViewController.h"
#import "YDNewRewardViewController.h"
#import "YDMeUserInfoViewController.h"
#import "YDCircleInviteFriendViewController.h"
#import "YDAddFollowViewController.h"
#import "YDFitnUserCourseViewController.h"
#import "YDRunningViewController.h"
#import "YDDynamicRootViewController.h"
#import "YDQRScanViewController.h"
#import "YDDWKWebViewController.h"
#import "YDNewPhoneBindViewController.h"
#import "YDAIChildTongueTestProcessViewController.h"

@interface YDWebViewOldCommonLocalAction () <YDPayToolDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, YDWechatHelperDelegate,WBGImageEditorDelegate,WBGImageEditorDataSource>

@property (nonatomic, strong) YDAIFingerTestGetHealthExaminationRecordOneApi *recordApi;
@property (nonatomic, strong) YDWebAIFingerTestShareView *shareView;
@property (nonatomic, strong) YDAIFingerTestShareApi *shareApi;

@end

@implementation YDWebViewOldCommonLocalAction

- (void)solveLocalAction:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    [super solveLocalAction:param then:then];
    switch (param.actionID) {
        case YDWebViewLocalActionIDShare: {
            [self solveLocalActionShare:param then:then];
            break;
        }
        case YDWebViewLocalActionIDShareText: {
            [self solveLocalActionShareText:param then:then];
            break;
        }
        case YDWebViewLocalActionIDShareParam: {
            [self solveLocalActionShareParam:param then:then];
            break;
        }
        case YDWebViewLocalActionIDReportEvent: {
             [self solveLocalActionReportEvent:param then:then];
             break;
        }
        case YDWebViewLocalActionIDReportTimeEventStart: {
             [self solveLocalActionReportTimeEventStart:param then:then];
             break;
        }
        case YDWebViewLocalActionIDReportTimeEventEnd: {
             [self solveLocalActionReportTimeEventEnd:param then:then];
             break;
        }
        case YDWebViewLocalActionIDReportEventUm: {
             [self solveLocalActionReportEventUm:param then:then];
             break;
        }
        case YDWebViewLocalActionIDReportLogEvent: {
             [self solveLocalActionReportLogEvent:param then:then];
             break;
        }
        case YDWebViewLocalActionIDHidePullRefresh: {
            [self solveLocalActionHidePullRefresh:param then:then];
            break;
        }
        case YDWebViewLocalActionIDOpenUrlInternal: {
            [self solveLocalActionOpenURLInternal:param then:then];
            break;
        }
        case YDWebViewLocalActionIDOpenUrlNewWindow: {
            [self solveLocalActionOpenURLWithNewWindow:param then:then];

            break;
        }
        case YDWebViewLocalActionIDHideShareBnt: {
             [self solveLocalActionHideShareBnt:param then:then];
             break;
        }
        case YDWebViewLocalActionIDShowShareBnt: {
             [self solveLocalActionShowShareBnt:param then:then];
             break;
        }
        case YDWebViewLocalActionIDSelectUploadPic: {
             [self solveLocalActionSelectUploadPic:param then:then];
             break;
        }
        case YDWebViewLocalActionIDPhotographUploadPic: {
             [self solveLocalActionPhotographUploadPic:param then:then];
             break;
        }
        case YDWebViewLocalActionIDPhotographToBase64: {
             [self solveLocalActionPhotographToBase64:param then:then];
             break;
        }
        case YDWebViewLocalActionIDBackRefresh: {
             [self solveLocalActionBackRefresh:param then:then];
             break;
        }
        case YDWebViewLocalActionIDOpenUrlBySafari:
        case YDWebViewLocalActionIDWebBrowser: {
            [self solveLocalActionOpenURLWithSafari:param then:then];
            break;
        }
        case YDWebViewLocalActionIDRightTitleText: {
             [self solveLocalActionRightTitleText:param then:then];
             break;
        }
        case YDWebViewLocalActionIDDownloadImg: {
             [self solveLocalActionDownloadImg:param then:then];
             break;
        }
        case YDWebViewLocalActionIDDownloadImgBase64: {
             [self solveLocalActionDownloadImgBase64:param then:then];
             break;
        }
        case YDWebViewLocalActionIDDownloadImgGetWebImage: {
             [self solveLocalActionDownloadImgGetWebImage:param then:then];
             break;
        }
        case YDWebViewLocalActionIDToLocalVc: {
            [self solveLocalActionToLocalVC:param then:then];
            break;
        }
        case YDWebViewLocalActionIDCloseWindow: {
            [self solveLocalActionCloseWindow:param then:then];
            break;
        }
        case YDWebViewLocalActionIDCloseWindowAll: {
            [self solveLocalActionCloseAllWindow:param then:then];
            break;
        }
        case YDWebViewLocalActionIDReturnToNavRoot: {
            [self solveLocalActionReturnToNavigationRoot:param then:then];
            break;
        }
        case YDWebViewLocalActionIDToLocalApp: {
            [self solveLocalActionToLocalApp:param then:then];

            break;
        }
        case YDWebViewLocalActionIDBackbtnMethod: {
             [self solveLocalActionBackbtnMethod:param then:then];
             break;
        }
        case YDWebViewLocalActionIDPopGestureForbid: {
             [self solveLocalActionPopGestureForbid:param then:then];
             break;
        }
        case YDWebViewLocalActionIDAddPhoto: {
             [self solveLocalActionAddPhoto:param then:then];
             break;
        }
        case YDWebViewLocalActionIDToast: {
             [self solveLocalActionToast:param then:then];
             break;
        }
        case YDWebViewLocalActionIDBackSound: {
             [self solveLocalActionBackSound:param then:then];
             break;
        }
        case YDWebViewLocalActionIDBackLockLightScreenSound: {
             [self solveLocalActionBackLockLightScreenSound:param then:then];
             break;
        }
        case YDWebViewLocalActionIDBackLockLightscreenPause: {
             [self solveLocalActionBackLockLightscreenPause:param then:then];
             break;
        }
        case YDWebViewLocalActionIDBackLockLightscreenViewLoaded: {
             [self solveLocalActionBackLockLightscreenViewLoaded:param then:then];
             break;
        }
        case YDWebViewLocalActionIDNativeIntJump: {
             [self solveLocalActionNativeIntJump:param then:then];
             break;
        }
        case YDWebViewLocalActionIDYDCalendarAddRemind: {
             [self solveLocalActionYDCalendarAddRemind:param then:then];
             break;
        }
        case YDWebViewLocalActionIDYDCalendarDeleteRemind: {
             [self solveLocalActionYDCalendarDeleteRemind:param then:then];
             break;
        }
        case YDWebViewLocalActionIDSetVcTitle: {
             [self solveLocalActionSetVcTitle:param then:then];
             break;
        }
        case YDWebViewLocalActionIDShowRightImgBtn: {
             [self solveLocalActionShowRightImgBtn:param then:then];
             break;
        }
        //business
        case YDWebViewLocalActionIDRequestLocation: {
             [self solveLocalActionRequestLocation:param then:then];
             break;
        }
        case YDWebViewLocalActionIDDrawreward: {
             [self solveLocalActionDrawreward:param then:then];
             break;
        }
        case YDWebViewLocalActionIDDrawrewardIOS: {
             [self solveLocalActionDrawrewardIOS:param then:then];
             break;
        }
        case YDWebViewLocalActionIDLogin: {
             [self solveLocalActionLogin:param then:then];
             break;
        }
        case YDWebViewLocalActionIDPersoninfo: {
             [self solveLocalActionPersoninfo:param then:then];
             break;
        }
        case YDWebViewLocalActionIDAccountBind: {
             [self solveLocalActionAccountBind:param then:then];
             break;
        }
        case YDWebViewLocalActionIDStartRun: {
             [self solveLocalActionStartRun:param then:then];
             break;
        }
        case YDWebViewLocalActionIDInviteFriendCircle: {
             [self solveLocalActionInviteFriendCircle:param then:then];
             break;
        }
        case YDWebViewLocalActionIDSportFitness: {
             [self solveLocalActionSportFitness:param then:then];
             break;
        }
        case YDWebViewLocalActionIDToSharedRide: {
             [self solveLocalActionToSharedRide:param then:then];
             break;
        }
        case YDWebViewLocalActionIDChat: {
             [self solveLocalActionChat:param then:then];
             break;
        }
        case YDWebViewLocalActionIDBindSuccess: {
             [self solveLocalActionBindSuccess:param then:then];
             break;
        }
        case YDWebViewLocalActionIDBindFail: {
             [self solveLocalActionBindFail:param then:then];
             break;
        }
        case YDWebViewLocalActionIDBindParamInvalid: {
             [self solveLocalActionBindParamInvalid:param then:then];
             break;
        }
        case YDWebViewLocalActionIDHealthBack2Today: {
             [self solveLocalActionHealthBack2Today:param then:then];
             break;
        }
        case YDWebViewLocalActionIDJump2FootPrint: {
             [self solveLocalActionJump2FootPrint:param then:then];
             break;
        }
        case YDWebViewLocalActionIDFeed: {
             [self solveLocalActionFeed:param then:then];
             break;
        }
        case YDWebViewLocalActionIDBicycleRun: {
             [self solveLocalActionBicycleRun:param then:then];
             break;
        }
        case YDWebViewLocalActionIDFitnessWatermark: {
             [self solveLocalActionFitnessWatermark:param then:then];
             break;
        }
        case YDWebViewLocalActionIDWechatRank: {
             [self solveLocalActionWechatRank:param then:then];
             break;
        }
        case YDWebViewLocalActionIDPushPedometer: {
             [self solveLocalActionPushPedometer:param then:then];
             break;
        }
        case YDWebViewLocalActionIDStartChest: {
             [self solveLocalActionStartChest:param then:then];
             break;
        }
        case YDWebViewLocalActionIDAttend: {
             [self solveLocalActionAttend:param then:then];
             break;
        }
        case YDWebViewLocalActionIDToFeedback: {
             [self solveLocalActionToFeedback:param then:then];
             break;
        }
        case YDWebViewLocalActionIDGetMembershipInfo: {
             [self solveLocalActionGetMembershipInfo:param then:then];
             break;
        }
        case YDWebViewLocalActionIDPromptLogin: {
             [self solveLocalActionPromptLogin:param then:then];
             break;
        }
        case YDWebViewLocalActionIDShowFeedback: {
             [self solveLocalActionShowFeedback:param then:then];
             break;
        }
        case YDWebViewLocalActionIDTheLovingRun: {
             [self solveLocalActionTheLovingRun:param then:then];
             break;
        }
        case YDWebViewLocalActionIDShareAIFingerReport: {
             [self solveLocalActionShareAIFingerReport:param then:then];
             break;
        }
        case YDWebViewLocalActionIDGoToMapiHddgoodGame: {
             [self solveLocalActionGoToMapiHddgoodGame:param then:then];
             break;
        }
        case YDWebViewLocalActionIDPlayRewardVideo: {
             [self solveLocalActionPlayRewardVideo:param then:then];
             break;
        }
        case YDWebViewLocalActionIDOpenPhoneBind: {
             [self solveLocalActionOpenPhoneBind:param then:then];
             break;
        }
        case YDWebViewLocalActionIDMembershipChanged: {
             [self solveLocalActionMembershipChanged:param then:then];
             break;
        }
        case YDWebViewLocalActionIDWeekChallengeApply: {
             [self solveLocalActionWeekChallengeApply:param then:then];
             break;
        }
        case YDWebViewLocalActionIDRequestTonguePic: {
             [self solveLocalActionRequestTonguePic:param then:then];
             break;
        }
        case YDWebViewLocalActionIDSetNavBarStyle: {
             [self solveLocalActionSetNavBarStyle:param then:then];
             break;
        }
        //ad
        case YDWebViewLocalActionIDAdHandleUrl: {
             [self solveLocalActionAdHandleUrl:param then:then];
             break;
        }
        case YDWebViewLocalActionIDAdGet: {
             [self solveLocalActionAdGet:param then:then];
             break;
        }
        case YDWebViewLocalActionIDAdStatisticShow: {
             [self solveLocalActionAdStatisticShow:param then:then];
             break;
        }
        case YDWebViewLocalActionIDAdStatisticClick: {
             [self solveLocalActionAdStatisticClick:param then:then];
             break;
        }
        //pay
        case YDWebViewLocalActionIDAlipay: {
             [self solveLocalActionAlipay:param then:then];
             break;
        }
        case YDWebViewLocalActionIDPay: {
             [self solveLocalActionPay:param then:then];
             break;
        }
        case YDWebViewLocalActionIDIapGetYuedProduct: {
             [self solveLocalActionIapGetYuedProduct:param then:then];
             break;
        }
        case YDWebViewLocalActionIDIapBuyYuedProduct: {
             [self solveLocalActionIapBuyYuedProduct:param then:then];
             break;
        }
        case YDWebViewLocalActionIDIapValidateLastPay: {
             [self solveLocalActionIapValidateLastPay:param then:then];
             break;
        }
        case YDWebViewLocalActionIDIapGetProductInfo: {
             [self solveLocalActionIapGetProductInfo:param then:then];
             break;
        }
        case YDWebViewLocalActionIDIapBuyProduct: {
             [self solveLocalActionIapBuyProduct:param then:then];
             break;
        }
        case YDWebViewLocalActionIDIapValidateCallback: {
             [self solveLocalActionIapValidateCallback:param then:then];
             break;
        }
        case YDWebViewLocalActionIDApplepayUpStartPay: {
             [self solveLocalActionApplepayUpStartPay:param then:then];
             break;
        }
        case YDWebViewLocalActionIDCashPayCallback: {
             [self solveLocalActionCashPayCallback:param then:then];
             break;
        }
        case YDWebViewLocalActionIDCcbPayOcr: {
             [self solveLocalActionCcbPayOcr:param then:then];
             break;
        }
        case YDWebViewLocalActionIDCcbPayFaceVerify: {
             [self solveLocalActionCcbPayFaceVerify:param then:then];
             break;
        }
        //third
        case YDWebViewLocalActionIDWechatSubscribeAuth: {
             [self solveLocalActionWechatSubscribeAuth:param then:then];
             break;
        }
        case YDWebViewLocalActionIDOpenWechatMiniProgram: {
             [self solveLocalActionOpenWechatMiniProgram:param then:then];
             break;
        }
        case YDWebViewLocalActionIDYDAliToDetail: {
             [self solveLocalActionYDAliToDetail:param then:then];
             break;
        }
        case YDWebViewLocalActionIDYDAliOauth: {
             [self solveLocalActionYDAliOauth:param then:then];
             break;
        }
        //special
        case YDWebViewLocalActionIDQrCode: {
             [self solveLocalActionQrCode:param then:then];
             break;
        }
        case YDWebViewLocalActionAICoachPlayVoice: {
            [self solveLocalActionPlayVoice:param then:then];
            break;
        }
        
        case YDWebViewLocalActionAICoachStopPlayVoice: {
            [self solveLocalActionStopPlayVoice:param then:then];
             break;
        }
        case YDWebViewLocalActionIDCheckAICMaxCompeteVideo: {
            [self solveLocalActionCheckAICMaxCompeteVideo:param then:then];
        }
            
        default:
            break;
    }
}

- (void)solveLocalActionShare:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    [param.webViewController triggerShare];
    !then?:then(param, nil);
}

- (void)solveLocalActionShareText:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *paramDic = param.parameters;
    NSString *shareTitle   = paramDic[@"arg0"];
    NSString *shareContent = paramDic[@"arg1"];
    NSString *shareIconUrl = paramDic[@"arg2"];
    NSString *shareUrl     = paramDic[@"arg3"];
    NSString *shareDic     = paramDic[@"arg4"];
    if (shareTitle && ![shareTitle isEqualToString: @""]) {
        param.store.shareTitle = shareTitle;
    }
    if (shareContent && ![shareContent isEqualToString: @""]) {
        param.store.shareContent = shareContent;
    }
    if (shareIconUrl && ![shareIconUrl isEqualToString: @""]) {
        param.store.shareImageURLString = shareIconUrl;
    }
    if (shareUrl && ![shareUrl isEqualToString: @""]) {
        param.store.shareURLString = shareUrl;
    }
    if (shareDic && ![shareDic isEqualToString: @""]) {
        param.store.sharePlatformDic = [NSDictionary yy_modelDictionaryWithClass:nil json:shareDic];
    }
    !then?:then(param, nil);
}

- (void)solveLocalActionShareParam:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *paramDic = param.parameters;
    NSString *shareTitle   = paramDic[@"arg0"];
    NSString *shareContent = paramDic[@"arg1"];
    NSString *shareIconUrl = paramDic[@"arg2"];
    NSString *shareUrl     = paramDic[@"arg3"];
    NSString *shareDic     = paramDic[@"arg4"];
    NSString *sharePlatformType = paramDic[@"arg5"];
    NSString *isWebLongImageShare = paramDic[@"arg6"];
    isWebLongImageShare = isWebLongImageShare.lowercaseString;
    if ([paramDic.allKeys containsObject:@"social_playform_type"]) { // 处理直接分享
        param.store.platformForShareAim = [[paramDic objectForKey:@"social_playform_type"] integerValue];
        param.store.isShareToAimPlatform = YES;
    }else {
        param.store.isShareToAimPlatform = NO;
    }
    if (sharePlatformType && ![sharePlatformType isEqualToString:@""]) {
        param.store.isShareToAimPlatform = YES;
        param.store.platformForShareAim = [NSNumber yd_numberWithString:sharePlatformType].integerValue;
    } else {
        param.store.isShareToAimPlatform = NO;
    }
    if ([isWebLongImageShare isEqualToString:@"true"]) {
        param.store.isWebLongImageShare = YES;
    } else {
        param.store.isWebLongImageShare = NO;
    }
    if (shareTitle && ![shareTitle isEqualToString: @""]) {
        param.store.shareTitle = shareTitle;
    }
    if (shareContent && ![shareContent isEqualToString: @""]) {
        param.store.shareContent = shareContent;
    }
    if (shareIconUrl && ![shareIconUrl isEqualToString: @""]) {
        param.store.shareImageURLString = shareIconUrl;
    }
    if (shareUrl && ![shareUrl isEqualToString: @""]) {
        param.store.shareURLString = shareUrl;
    }
    if (shareDic && ![shareDic isEqualToString: @""]) {
        param.store.sharePlatformDic = [NSDictionary yy_modelDictionaryWithClass:nil json:shareDic];
    }
    if (sharePlatformType && ![sharePlatformType isEqualToString:@""]) {
        param.store.isShareToCertainPlatform = YES;
        param.store.platformWillShareTo = [NSNumber yd_numberWithString:sharePlatformType].integerValue;
    } else {
        param.store.isShareToCertainPlatform = NO;
    }
    // 待webviewcontroller调用分享
    [self shareWithParam:param];
    !then?:then(param, nil);
}

- (void)solveLocalActionOpenURLInternal:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *paramDic = param.parameters;
    NSString *URLString = paramDic[@"arg0"];//[paramDic[@"arg0"] yd_urldecodeString];
    [param.service buildWebViewRequestWithURLString:URLString then:^(NSURLRequest * _Nonnull request) {
        [param.webViewController loadRequest:request];
    }];
    
    !then?:then(param, nil);
}

- (void)solveLocalActionOpenURLWithNewWindow:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *paramDic = param.parameters;
    NSString *URLString = paramDic[@"arg0"];//[ yd_urldecodeString];
    YDWebViewController *vc = [YDWebViewController instance];
    vc.originalURLString = URLString;
    [param.webViewController.navigationController pushViewController:vc animated:YES];
    !then?:then(param, nil);
}

- (void)solveLocalActionOpenURLWithSafari:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *paramDic = param.parameters;
    NSString *URLString = paramDic[@"arg0"]; //yd_urldecodeString];
    [[YDJumpTool sharedTool] jumpToOutUrl:[[NSURL alloc] initWithString:URLString] fromVC:param.webViewController];
    !then?:then(param, nil);
}

- (void)solveLocalActionToLocalVC:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *paramDic = param.parameters;
    NSString *vcName = paramDic[@"arg0"];
    NSString *openType = paramDic[@"arg1"];
    NSString *paramDicStr = paramDic[@"arg2"];

    NSString *vcDirectUrl = paramDic[@"vc_direct_url"];

    if ([vcName isEqualToString:@"YDCircleDetailViewController"]) {
        vcName = @"YDCircleDetailListViewController";
    }

    NSMutableDictionary *openParams = [[NSMutableDictionary alloc] init];
    openParams[@"action"] = @"to_local_vc";
    [openParams ms_setObject:vcName forKey:@"vc_name"];
    [openParams ms_setObject:openType forKey:@"vc_open_type"];
    [openParams ms_setObject:paramDicStr forKey:@"vc_params"];
    [openParams ms_setObject:vcDirectUrl forKey:@"vc_direct_url"];

    [[YDJumpTool sharedTool] jumpToOpenParam:openParams fromVC:param.webViewController from:@"webPage"];
    !then?:then(param, nil);
}

- (void)solveLocalActionCloseWindow:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    [param.webViewController close];
    !then?:then(param, nil);
}

- (void)solveLocalActionCloseAllWindow:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    UIViewController *vc = param.webViewController;
    vc.navigationController.interactivePopGestureRecognizer.enabled = YES;
    if (vc.navigationController.viewControllers.count > 1) {
        UIViewController *lastVc;
        for (UIViewController *subVC in vc.navigationController.viewControllers) {
            if ([subVC isKindOfClass:[YDWebViewController class]]) {
                break;
            }
            lastVc = subVC;
        }
        vc.navigationController.interactivePopGestureRecognizer.enabled = param.store.prevInteractivePopGestureRecognizerEnabled;
        if (lastVc) {
            [vc.navigationController popToViewController:lastVc animated:YES];
        } else {
            [vc.navigationController popToRootViewControllerAnimated:YES];
        }

    } else {
        if (vc.navigationController) {
            [vc.navigationController dismissViewControllerAnimated:YES completion:nil];
        } else {
            [vc dismissViewControllerAnimated:YES completion:nil];
        }
    }
    !then?:then(param, nil);
}

- (void)solveLocalActionReturnToNavigationRoot:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    [param.webViewController.navigationController popToRootViewControllerAnimated:YES];
    !then?:then(param, nil);
}

- (void)solveLocalActionToLocalApp:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *paramDic = param.parameters;
    NSString *scheme = paramDic[@"arg0"];
    NSString *successCallback = paramDic[@"arg1"];
    NSString *failureCallback = paramDic[@"arg2"];
    NSString *jsString = nil;
    if ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@://", scheme]]]) {
        if (successCallback.length) {
            jsString = [NSString stringWithFormat:@"%@();", successCallback];
        }
    } else {
        if (failureCallback.length) {
            jsString = [NSString stringWithFormat:@"%@();", failureCallback];
        }
    }
    [param.webViewController evaluateJavaScript:jsString completionHandler:^(id o, NSError *error) {

    }];
    !then?:then(param, nil);
}

- (void)solveLocalActionHidePullRefresh:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *paramDic = param.parameters;
    BOOL hide = NO;
    if (paramDic[@"arg0"]) {
        hide =  ((NSString *)paramDic[@"arg0"]).boolValue;
    }
    if (hide) {
        [param.webViewController disableRefresh];
    } else {
        [param.webViewController enableRefresh];
    }
    
}

- (void)solveLocalActionShowShareButton:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    [param.webViewController refreshShareItemStatus:YES animated:NO];
    !then?:then(param, nil);
}

- (void)solveLocalActionHideShareButton:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    [param.webViewController refreshShareItemStatus:NO animated:NO];
    !then?:then(param, nil);
}

- (void)solveLocalActionReportEvent:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *cmd = dic[@"cmd"];
    NSString *label = dic[@"label"];
    NSString *extra = [dic objectForKey: @"extra"];
    NSDictionary *extraDic = [MSJsonKit jsonToObj:extra asClass:[NSDictionary class]];
    [[YDStatisticsMgr sharedMgr] yd_event:cmd label:label extra:extraDic];
    MSLogD(@"[web report]:%@", cmd);
    !then?:then(param, nil);
}
- (void)solveLocalActionReportTimeEventStart:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *cmd = dic[@"cmd"];
    NSString *label = dic[@"label"];
    NSString *extra = [dic objectForKey: @"extra"];//[dic objectForKey: @"extra"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]; //
    NSDictionary *extraDic = [MSJsonKit jsonToObj:extra asClass:[NSDictionary class]];
    NSURL *url = [NSURL URLWithString:param.webViewController.URL.absoluteString];
    NSString *page = [NSString stringWithFormat:@"%@%@", url.host, url.path];
    [[YDStatisticsMgr sharedMgr] yd_webTimeEventStartForPage:page eventId:cmd label:label extra:extraDic shouldUploadImmediately:NO];
    !then?:then(param, nil);
}
- (void)solveLocalActionReportTimeEventEnd:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *cmd = dic[@"cmd"];
    NSString *extra = [dic objectForKey: @"extra"];//[[dic objectForKey: @"extra"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]; //
    NSDictionary *extraDic = [MSJsonKit jsonToObj:extra asClass:[NSDictionary class]];
    NSURL *url = [NSURL URLWithString:param.webViewController.URL.absoluteString];
    NSString *page = [NSString stringWithFormat:@"%@%@", url.host, url.path];
    [[YDStatisticsMgr sharedMgr] yd_webTimeEventEndForPage:page eventId:cmd extra:extraDic shouldUploadImmediately:YES];
    !then?:then(param, nil);
}
- (void)solveLocalActionReportEventUm:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *eventID = dic[@"event_id"];
    NSString *label = dic[@"label"];
    NSString *extra = [dic objectForKey: @"attributes"];//[[dic objectForKey: @"attributes"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]; //
    NSDictionary *extraDic = [MSJsonKit jsonToObj:extra asClass:[NSDictionary class]];
    [[YDStatisticsMgr sharedMgr] eventForWebWithID:eventID label:label attributes:extraDic];
    !then?:then(param, nil);
}
- (void)solveLocalActionReportLogEvent:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *logEventStr = dic[@"log_events"];
    NSString *immediately = dic[@"immediately"];
    NSArray *logEventArrs = [logEventStr componentsSeparatedByString:@":"];
    NSMutableArray<NSNumber *> *validArr = @[].mutableCopy;
    for (NSString *s in logEventArrs) {
        NSNumber *num = s.yd_numberValue;
        [validArr addObject:num];
    }
    [[YDStatisticsMgr sharedMgr] yd_addLogEvent:validArr.copy uploadImmediately:immediately.boolValue];
    !then?:then(param, nil);
}
- (void)solveLocalActionHideShareBnt:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    BOOL show = ((NSNumber *)dic[@"arg0"]).boolValue;
    [param.webViewController refreshShareItemStatus:show animated:NO];
    !then?:then(param, nil);
}
- (void)solveLocalActionShowShareBnt:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    [param.webViewController refreshShareItemStatus:YES animated:NO];
    !then?:then(param, nil);
}
- (void)solveLocalActionSelectUploadPic:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    param.store.photoGenerateBase64 = NO;
    param.store.pictureSource = dic[@"source"];//[dic[@"source"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]; //
    param.store.photoMaxSize = ((NSString *)[dic objectForKey:@"photoMaxSize"]).integerValue;
    param.store.isFreeClip = [[dic objectForKey:@"freeClip"] boolValue];
    
    NSString *cd = [dic objectForKey:@"cameraDevice"];
    if ([cd isEqualToString:@"back"]) {
        param.store.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    } else if ([cd isEqualToString:@"front"]) {
        param.store.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    } else {
        param.store.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    }
    id isAllowEdit = dic[@"is_allow_edit"];
    if ([isAllowEdit isKindOfClass:[NSString class]]) {
        if ([isAllowEdit isEqual:@"true"] || [isAllowEdit isEqual:@"YES"] || [isAllowEdit isEqual:@"1"]) {
            param.store.isAllowEdit = YES;
        } else {
            param.store.isAllowEdit = NO;
        }
    } else if ([isAllowEdit isKindOfClass:[NSNumber class]]) {
        if ([isAllowEdit isEqual:@1] || [isAllowEdit isEqual:@(YES)]) {
            param.store.isAllowEdit = YES;
        } else {
            param.store.isAllowEdit = NO;
        }
    } else {
        param.store.isAllowEdit = YES;
    }
    [self openGetPicFileMenuWithParam:param];
    !then?:then(param, nil);
}
- (void)solveLocalActionPhotographUploadPic:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    param.store.photoGenerateBase64 = NO;
    param.store.pictureSource = dic[@"source"];//[dic[@"source"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]; //
    
    NSString *cd = [dic objectForKey:@"cameraDevice"];
    if ([cd isEqualToString:@"back"]) {
        param.store.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    } else if ([cd isEqualToString:@"front"]) {
        param.store.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    } else {
        param.store.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    }
    id isAllowEdit = dic[@"is_allow_edit"];
    if ([isAllowEdit isKindOfClass:[NSString class]]) {
        if ([isAllowEdit isEqual:@"true"] || [isAllowEdit isEqual:@"YES"] || [isAllowEdit isEqual:@"1"]) {
            param.store.isAllowEdit = YES;
        } else {
            param.store.isAllowEdit = NO;
        }
    } else if ([isAllowEdit isKindOfClass:[NSNumber class]]) {
        if ([isAllowEdit isEqual:@1] || [isAllowEdit isEqual:@(YES)]) {
            param.store.isAllowEdit = YES;
        } else {
            param.store.isAllowEdit = NO;
        }
    } else {
        param.store.isAllowEdit = YES;
    }
    [self takePhotoWithParam:param];
    !then?:then(param, nil);
}
- (void)solveLocalActionPhotographToBase64:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    param.store.photoGenerateBase64 = YES;
    param.store.photoBase64Callback = [dic objectForKey:@"callback"];
    param.store.photoMaxWidth = ((NSString *)[dic objectForKey:@"photoMaxWidth"]).floatValue;
    param.store.photoMaxSize = ((NSString *)[dic objectForKey:@"photoMaxSize"]).integerValue;
    NSString *cd = [dic objectForKey:@"cameraDevice"];
    if ([cd isEqualToString:@"back"]) {
        param.store.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    } else if ([cd isEqualToString:@"front"]) {
        param.store.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    } else {
        param.store.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    }
    id isAllowEdit = dic[@"is_allow_edit"];
    if ([isAllowEdit isKindOfClass:[NSString class]]) {
        if ([isAllowEdit isEqual:@"true"] || [isAllowEdit isEqual:@"YES"] || [isAllowEdit isEqual:@"1"]) {
            param.store.isAllowEdit = YES;
        } else {
            param.store.isAllowEdit = NO;
        }
    } else if ([isAllowEdit isKindOfClass:[NSNumber class]]) {
        if ([isAllowEdit isEqual:@1] || [isAllowEdit isEqual:@(YES)]) {
            param.store.isAllowEdit = YES;
        } else {
            param.store.isAllowEdit = NO;
        }
    } else {
        param.store.isAllowEdit = YES;
    }
    [self takePhotoWithParam:param];
    !then?:then(param, nil);
}
- (void)solveLocalActionBackRefresh:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
//    NSDictionary *dic = param.parameters;
    !then?:then(param, nil);
}
- (void)solveLocalActionRightTitleText:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *name = dic[@"arg0"];// [dic[@"arg0"] yd_urldecodeString];//
    NSString *URLString = dic[@"arg1"];//[dic[@"arg1"] yd_urldecodeString];//
    [param.webViewController refreshRightURLItem:name url:URLString image:nil nativeInt:-1 animated:NO];
    !then?:then(param, nil);
}
- (void)solveLocalActionDownloadImg:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *imgUrl = [dic objectForKey:@"args0"];
    if (imgUrl) {
        __weak typeof(self) wSelf = self;
        
        // yy
        [[YYWebImageManager sharedManager] requestImageWithURL:[NSURL URLWithString:imgUrl] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            
        } transform:^UIImage * _Nullable(UIImage * _Nonnull image, NSURL * _Nonnull url) {
            return image;
        } completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
            if (!error && image) {
                UIImageWriteToSavedPhotosAlbum(image, wSelf, @selector(image:didFinishSavingWithError:contextInfo:), nil);
            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [param.webViewController yd_popFailure:MSLocalizedString(@"下载图片失败", nil)];
                });
                
            }
        }];
        
    }
    !then?:then(param, nil);
}
- (void)solveLocalActionDownloadImgBase64:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *imgBase64 = [dic objectForKey:@"arg0"];
    if (imgBase64) {
        
        NSData *imgData = [[NSData alloc] initWithBase64EncodedString:imgBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *img = [UIImage imageWithData:imgData];
        
        if (img) {
            UIImageWriteToSavedPhotosAlbum(img, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        } else {
            [param.webViewController yd_popFailure:MSLocalizedString(@"下载图片失败", nil)];
        }
    }
    !then?:then(param, nil);
}
- (void)solveLocalActionDownloadImgGetWebImage:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *rectString = [dic objectForKey:@"arg0"];
    CGRect rect;
    if (rectString.length) {
        rect = CGRectFromString(rectString);
    } else {
        rect = CGRectMake(0, 0, 1, 1);
    }
    if (CGRectIsEmpty(rect)) {
        rectString = [rectString yd_urldecodeString];
        rect = CGRectFromString(rectString);
    }
    [self downloadWebLongImageWithRect:rect withParam:param];
    !then?:then(param, nil);
}
- (void)solveLocalActionBackbtnMethod:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSNumber *backTypeNum = dic[@"back_type"];
    if (backTypeNum.integerValue) {
        param.webViewController.backType = YDWebViewBackTypeBack;
    } else {
        param.webViewController.backType = YDWebViewBackTypeClose;
    }
    !then?:then(param, nil);
}
- (void)solveLocalActionPopGestureForbid:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSNumber *forbidGestureNum = dic[@"forbid_gesture"];
    if (forbidGestureNum.integerValue) {
        param.webViewController.navigationController.interactivePopGestureRecognizer.enabled = NO;
    } else {
        param.webViewController.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    !then?:then(param, nil);
}
- (void)solveLocalActionAddPhoto:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    param.store.photoGenerateBase64 = YES;
    param.store.ofoAddPhotoCallback = [dic objectForKey:@"callback"];
    param.store.oppoAddPhotoCallback = [dic objectForKey:@"oppo_callback"];
    [self openGetPicFileMenuWithParam:param];
    !then?:then(param, nil);
}
- (void)solveLocalActionToast:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *message = [dic objectForKey:@"message"];
    [param.webViewController yd_alertConfirm:MSLocalizedString(@"提示", nil) message:message];
    !then?:then(param, nil);
}
- (void)solveLocalActionBackSound:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
//    NSDictionary *dic = param.parameters;
    SET_PLAYBACK_MIXOPTION_IF_NOT_M7;
    INCREASE_AUDIOSESSION_ONE;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onBackSoundWebViewDisappearNotify:) name:ydNtfMWebViewWillDispear object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onBackSoundWebViewDisappearNotify:) name:ydNtfMWebViewBackForward object:nil];
    !then?:then(param, nil);
}
- (void)solveLocalActionBackLockLightScreenSound:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    YDMedia *media = [YDMedia mediaConvertionWithDic:dic];
    [[YDBgMediaMgr shared] playWithMedia:media];
    !then?:then(param, nil);
}
- (void)solveLocalActionBackLockLightscreenPause:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSInteger audioStatus = [dic[@"audioStatus"] integerValue];
//    MSLogD(@"传过来 dic ：%@ , audioStatus ： %ld",dic,(long)audioStatus);
    if (audioStatus == 1) {
        [[YDBgMediaMgr shared] setHiddenPannel:NO];
    }
    !then?:then(param, nil);
}
- (void)solveLocalActionBackLockLightscreenViewLoaded:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
//    NSDictionary *dic = param.parameters;
    [[YDBgMediaMgr shared] webViewDidLoad];
    !then?:then(param, nil);
}
- (void)solveLocalActionNativeIntJump:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSNumber *nativeIntNum = dic[@"native_int"];
    [[YDJumpTool sharedTool] jumpToNativeInt:nativeIntNum.integerValue param:dic fromVC:param.webViewController from:@"yd_from_webCircle"];
    !then?:then(param, nil);
}
- (void)solveLocalActionYDCalendarAddRemind:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *params0 = [dic objectForKey:@"arg0"];
    NSString *params1 = [dic objectForKey:@"arg1"];
    NSDictionary *paramsDic1 = @{};
    NSArray *paramsArr0 = [NSJSONSerialization JSONObjectWithData:[params0 dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
    if (params1) {
        paramsDic1 = [NSJSONSerialization JSONObjectWithData:[params1 dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
    }
    __weak __typeof(self)weakSelf = self;
    if ([JLCalendarPermission instance].authorizationStatus == JLAuthorizationStatusAuthorized) {
        [self addCalendarRemindWith:paramsArr0 paramsDic1:paramsDic1 complete:^(NSInteger index) {
            [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"addCalendarRes(%ld);", (long)index] completionHandler:^(id result, NSError *error) {
                            
            }];
        }];
    } else {
        [[JLAuthorizationManager defaultManager] JL_requestAuthorizationWithAuthorizationType:JLAuthorizationTypeCalendar authorizedHandler:^{
            [weakSelf addCalendarRemindWith:paramsArr0 paramsDic1:paramsDic1 complete:^(NSInteger index) {
                [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"addCalendarRes(%ld);", (long)index] completionHandler:^(id result, NSError *error) {
                                
                }];
            }];
        } unAuthorizedHandler:^{
            MSLogD(@"[日历提醒] 拒绝授权成功");
            [param.webViewController yd_popText:MSLocalizedString(@"请同意授权才能设置提醒哦", nil)];
        }];
    }
    !then?:then(param, nil);
}
- (void)solveLocalActionYDCalendarDeleteRemind:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSNumber *startTs = [dic objectForKey:@"start_ts"];
    NSNumber *endTs = [dic objectForKey:@"end_ts"];
    NSString *keyword = [dic objectForKey:@"keyword"];
    __weak __typeof(self)weakSelf = self;
    if ([JLCalendarPermission instance].authorizationStatus == JLAuthorizationStatusAuthorized) {
        [self deleteCalendarRemindWithStartTs:startTs endTs:endTs keyword:keyword];
    } else {
        [[JLAuthorizationManager defaultManager] JL_requestAuthorizationWithAuthorizationType:JLAuthorizationTypeCalendar authorizedHandler:^{
            [weakSelf deleteCalendarRemindWithStartTs:startTs endTs:endTs keyword:keyword];
        } unAuthorizedHandler:^{
        }];
    }
    !then?:then(param, nil);
}
- (void)solveLocalActionSetVcTitle:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *arg0 = dic[@"arg0"];
    if ([arg0 isKindOfClass:NSString.class]) {
        param.webViewController.navBar.topItem.title = arg0;
    }
    !then?:then(param, nil);
}
- (void)solveLocalActionShowRightImgBtn:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *imageName = dic[@"arg0"];//[dic[@"arg0"] yd_urldecodeString];//
    NSNumber *nativeInt = dic[@"arg1"];
    [param.webViewController refreshRightURLItem:nil url:nil image:imageName nativeInt:nativeInt.integerValue animated:NO];
    !then?:then(param, nil);
}
//business
- (void)solveLocalActionRequestLocation:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *callback = [dic objectForKey:@"callback"];
    id<YDLocationServiceProtocol> locSrc = BHCreateServiceI(YDLocationServiceProtocol);
    [locSrc requestLocation:^(CLLocation *location) {
       dispatch_async(dispatch_get_main_queue(), ^{
           if (!location) {
               [param.webViewController yd_alertConfirm:MSLocalizedString(@"提示", nil) message:MSLocalizedString(@"获取定位失败，可能您没有开启定位权限，请前往系统的 设置-隐私-定位服务 进行开启，并对悦动圈授权", nil)];
           } else {
               if (callback.length) {
                   [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@({'lat':%@, 'lng':%@});", callback, [NSString stringWithFormat:@"%.6f", location.coordinate.latitude], [NSString stringWithFormat:@"%.6f", location.coordinate.longitude]] completionHandler:^(id result, NSError *error) {
                       
                   }];
               }
           }
       });
    } useCache:YES];
    !then?:then(param, nil);
}
- (void)solveLocalActionDrawreward:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSString *groupRunId = [param.parameters objectForKey:@"args0"];
    if (groupRunId) {
        param.store.groupRunID = @(groupRunId.integerValue);
    }
    __weak __typeof(self)weakSelf = self;
    if (param.store.isShareIn) {
        [param.webViewController yd_startLoading];
        [[YDRewardMgr shareMgr] drawShareRewardWithUserID:[YDCache app_userId] operation:DrawShareRewardOperationGet then:^(YDNewReward *nReward, MSError *error) {
            [param.webViewController yd_endLoading];
            if (!error) {
                NSString *URLString = [NSString stringWithFormat:@"%@?user_id=%@&shareReward=true", [YDURL GROUP_SHARECLAIMED], [YDCache app_userId]];
                param.webViewController.originalURLString = URLString;
            } else {
                
            }
        }];
    } else {
        [param.webViewController yd_startLoading];
        [[YDRewardMgr shareMgr] drawGroupRunRewardWithUserId:[YDCache app_userId] groupRunId:param.store.groupRunID then:^(id response, MSError *error) {
            [param.webViewController yd_endLoading];
            if (!error) {
                NSDictionary *dic = response;
                param.store.reward = [dic objectForKey:@"reward"];
                NSString *rewardUrlString = nil;
                if (param.store.reward.integerValue >= param.store.bigRewardMin) {
                    rewardUrlString = [weakSelf getClaimUrlV2:0 param:param];
                } else {
                    rewardUrlString = [weakSelf getClaimUrlV2:1 param:param];
                }
                NSUserDefaults *sharedUserDefault= [[NSUserDefaults alloc] initWithSuiteName:GROUP_NAME];
                NSNumber *todayNum = @([[NSDate date] formattedDateWithFormat:@"yyyyMMdd"].integerValue);
                [sharedUserDefault setObject:@"yes" forKey:todayNum.stringValue];
                param.webViewController.originalURLString = rewardUrlString;
            }
            
        }];
    }
    !then?:then(param, nil);
}
- (void)solveLocalActionDrawrewardIOS:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
//    NSDictionary *dic = param.parameters;
    !then?:then(param, nil);
}
- (void)solveLocalActionLogin:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *arg0 = dic[@"arg0"];
    if (arg0 && [arg0 isEqualToString:@"logout"]) {
        [YDCache LAR_setLastUserToken:nil];
        [[YDLoginMgr sharedMgr] removeLastLoginInfo];
        [param.webViewController yd_startLoading];
//        __weak typeof(self) wSelf = self;
        //! 如果get_weather参数有变，这个方法里面的内容也要变,切换账号重新拉取
        [YDIndexNWDAO removeWeatherCache];
        [YDCache im_setIMPrepareLogoutUserID:[YDCache app_userId]];// 存储即将退出的user_id
        [[YDLoginMgr sharedMgr] net_logoutWithUserId:[YDCache app_userId] then:^(id response, MSError *error) {
            [param.webViewController yd_endLoading];
            if (!error) {
                [[NSNotificationCenter defaultCenter] postNotificationName:ydLoginOutNotify object:nil];
                NSString *vcName = [MSLocalizable loginAndRegisterVCName];
                Class vcClass = NSClassFromString(vcName);
                if (vcClass) {
                    UIViewController *loginVc = [[vcClass alloc] init];
                    [param.webViewController.navigationController pushViewController: loginVc animated:YES];
                }
                    
            } else if (!error.isNtfError) {
                [param.webViewController yd_popError:error];
            }
        }];
        !then?:then(param, nil);
        return;
    }
    NSString *vcName = [MSLocalizable loginAndRegisterVCName];
    Class vcClass = NSClassFromString(vcName);
    if (vcClass) {
        UIViewController *loginVc = [[vcClass alloc] init];
        [param.webViewController.navigationController pushViewController: loginVc animated:YES];
    }
    !then?:then(param, nil);
}
- (void)solveLocalActionPersoninfo:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSNumber *userID = dic[@"arg0"];
    YDMeUserInfoViewController *userInfoVC = [[YDMeUserInfoViewController alloc] init];
    userInfoVC.userID = userID;
    [param.webViewController.navigationController pushViewController:userInfoVC animated:YES];
    !then?:then(param, nil);
}
- (void)solveLocalActionAccountBind:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    [[MSVCRouter sharedInstance] openURLString:@"./YDAccountBindViewController"];
    !then?:then(param, nil);
}
- (void)solveLocalActionStartRun:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    [YDSportTool shareSportTool].runSource = param.parameters[@"source"];
    [YDSportTool shareSportTool].sportType = SportTypeOutSideRunNormal;
    YDRunPrepareViewController *runModelVC = [[YDRunPrepareViewController alloc] init];
    [param.webViewController.navigationController pushViewController:runModelVC animated:YES];
    !then?:then(param, nil);
}
- (void)solveLocalActionInviteFriendCircle:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    if (dic[@"arg0"] != nil) {
        YDCircleInviteFriendViewController *addFollowVC = [[YDCircleInviteFriendViewController alloc] init];
        [[YDCache sharedAppCache] setObject:@"invite_circle" forKey:@"invite_Type"];
        [[YDCache sharedAppCache] setObject:dic[@"arg0"] forKey:@"invite_circle_id"];
        addFollowVC.circleID = dic[@"arg0"];
        [param.webViewController.navigationController pushViewController:addFollowVC animated:YES];
    } else {
        [[YDCache sharedAppCache] setObject:@"invite_follow" forKey:@"invite_Type"];
        
        YDAddFollowViewController *addFollowVC = [[YDAddFollowViewController alloc] init];
        [param.webViewController.navigationController pushViewController:addFollowVC animated:YES];
    }
    !then?:then(param, nil);
}
- (void)solveLocalActionSportFitness:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
//    NSDictionary *dic = param.parameters;
    [[YDStatisticsMgr sharedMgr] eventFitnessStart];
    YDFitnUserCourseViewController *vc = [[YDFitnUserCourseViewController alloc] init];
    [param.webViewController.navigationController pushViewController:vc animated:YES];
    !then?:then(param, nil);
}
- (void)solveLocalActionToSharedRide:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    YDRunningViewController *vc = [[YDRunningViewController alloc] init];
    vc.bikeShareType = YDBikeShareTypeMobike;
    vc.sportType = YDSportTypeCycleRunNormal;
    [param.webViewController.navigationController pushViewController:vc animated:YES];
    !then?:then(param, nil);
}
- (void)solveLocalActionChat:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
//    NSDictionary *dic = param.parameters;
    !then?:then(param, nil);
}
- (void)solveLocalActionBindSuccess:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
//    NSDictionary *dic = param.parameters;
    [param.webViewController yd_alertDouble:MSLocalizedString(@"YDBindAccountViewController.bindSuccess.title", nil)
                 message:MSLocalizedString(@"YDBindAccountViewController.bindReLoginTip.msg", nil)
               configure:^(MMPopupItem *subItem, MMPopupItem *mainItem) {
       mainItem.handler = ^(NSInteger index) {
    //                               if (isFromSchool || isFromCompany) {
    //                                   YDNeedBindPhoneServiceType jumpType = isFromCompany ? YDNeedBindPhoneServiceTypeCompany : YDNeedBindPhoneServiceTypeSchool;
    //                                   [YDCache LAR_setServiceTypeForNeedJumpToLogin:jumpType];
    //                               }
           [BHCreateServiceI(YDAppServiceProtocol) removeLogin];
           NSString *vcName = [MSLocalizable loginAndRegisterVCName];
           Class vcClass = NSClassFromString(vcName);
           UIViewController *loginVc = [[vcClass alloc] init];
           [param.webViewController.navigationController pushViewController: loginVc animated:YES];
       };
       subItem.handler = ^(NSInteger index) {
           YDNeedBindPhoneServiceType jumpType = [YDCache LAR_serviceTypeForNeedBindPhone];
           if (jumpType > 0) {
               [[MSVCRouter sharedInstance].currentViewController.navigationController popToRootViewControllerAnimated:NO];
               if (jumpType == YDNeedBindPhoneServiceTypeSchool || jumpType == YDNeedBindPhoneServiceTypeCompany) {
                   [[NSNotificationCenter defaultCenter] postNotificationName:kYDNtfJumpBackToNeedBindPhoneService object:nil userInfo:@{@"jumpType": @(jumpType)}];
               } else if (jumpType == YDNeedBindPhoneServiceTypeWebPage && [YDCache LAR_backUrlAfterBindPhoneForWebService].length) {
                   YDWebViewController *vc = [YDWebViewController instance];
                   vc.originalURLString = [YDCache LAR_backUrlAfterBindPhoneForWebService];
                   [[MSVCRouter sharedInstance].currentViewController.navigationController pushViewController:vc animated:YES];
               }
           } else {
               [[YDJumpTool sharedTool] jumpToDeferJumpAction];
           }
           [YDCache LAR_setServiceTypeForNeedBindPhone:0];
        };
    }];
    !then?:then(param, nil);
}
- (void)solveLocalActionBindFail:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
//    NSDictionary *dic = param.parameters;
    !then?:then(param, nil);
}
- (void)solveLocalActionBindParamInvalid:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
//    NSDictionary *dic = param.parameters;
    !then?:then(param, nil);
}
- (void)solveLocalActionHealthBack2Today:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
//    NSDictionary *dic = param.parameters;
    !then?:then(param, nil);
}
- (void)solveLocalActionJump2FootPrint:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSNumber *num = dic[@"arg0"];
    if (num == nil) {
        num = @0;
    }
    [[YDCache sharedAppCache] setObject:num forKey:@"jump_kind"];
    if (param.webViewController.navigationController.childViewControllers.count == 1) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ChooseIndex" object:@0];
    } else {
        [param.webViewController.navigationController popToRootViewControllerAnimated:NO];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ChooseIndex" object:@0];
    }
    !then?:then(param, nil);
}
- (void)solveLocalActionFeed:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
//    NSDictionary *dic = param.parameters;
    YDDynamicRootViewController *VC = [[YDDynamicRootViewController alloc] init];
    [param.webViewController.navigationController pushViewController:VC animated:YES];
    !then?:then(param, nil);
}
- (void)solveLocalActionBicycleRun:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
//    NSDictionary *dic = param.parameters;
    YDRunningViewController *runRecordingVC=[[YDRunningViewController alloc]init];
    runRecordingVC.sportType = YDSportTypeCycleRunNormal;
    [param.webViewController.navigationController pushViewController:runRecordingVC animated:YES];
    !then?:then(param, nil);
}
- (void)solveLocalActionFitnessWatermark:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    param.store.sucCallback = dic[@"suc_callback"];//[dic[@"suc_callback"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];//
    param.store.pictureSource = dic[@"pic_source"];//[dic[@"pic_source"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];//
    param.store.isWaterMark = YES;
    NSString *cd = [dic objectForKey:@"cameraDevice"];
    if ([cd isEqualToString:@"back"]) {
        param.store.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    } else if ([cd isEqualToString:@"front"]) {
        param.store.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    } else {
        param.store.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    }
    [self openGetPicFileMenuWithParam:param];
    !then?:then(param, nil);
}
- (void)solveLocalActionWechatRank:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
//    NSDictionary *dic = param.parameters;
    [YDWechatHelper shareHelper].delegate = self;
    [[YDWechatHelper shareHelper] wechatRank];
    !then?:then(param, nil);
}
- (void)solveLocalActionPushPedometer:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *successCallback = [dic objectForKey:@"arg0"];
    NSString *failureCallback = [dic objectForKey:@"arg1"];
    [BHCreateServiceI(YDPedometerProtocol) segmentAndArchivePedometerDataWithThen:^{
        [BHCreateServiceI(YDPedometerProtocol) uploadPedometerDataWithHandler:^(NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (!error) {
                    if (successCallback.length) {
                        [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@();", successCallback] completionHandler:^(id result, NSError *error) {
                                                    
                        }];
                    }
                } else {
                    if (failureCallback.length) {
                        [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@();", failureCallback] completionHandler:^(id result, NSError *error) {
                                                    
                        }];
                    }
                }
            });
        }];
    }];
    !then?:then(param, nil);
}
- (void)solveLocalActionStartChest:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    if ([dic[@"arg0"] isEqualToString:@"greenroad"]) {
        NSNumber *roadId = dic[@"arg1"];
        NSNumber *groupRunId = dic[@"arg2"];
        if ([[YDTreasureMgr shared] pref_getHasAgreeYodoLicence]) {
            [[MSVCRouter sharedInstance] openURLString:[NSString stringWithFormat:@"./YDTreasureHuntViewController?roadId=%@&groupRunId=%@", roadId, groupRunId]];
        } else {
            [[MSVCRouter sharedInstance] openURLString:[NSString stringWithFormat:@"./YDTreasureDisclaimerViewController?roadId=%@&groupRunId=%@", roadId, groupRunId]];
        }
    }
    !then?:then(param, nil);
}
- (void)solveLocalActionAttend:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    if ([YDCache app_hasLogin]) {
        param.store.groupRunID = [dic objectForKey:@"arg0"];
        [param.webViewController yd_startLoading];
        [YDWebNWDAO joinGroupRunWithParam:[YDDataSolver joinGroupRunWithUserID: [YDCache app_userId] andGroupRunID: param.store.groupRunID] then:^(id response, MSError *error) {
            [param.webViewController yd_endLoading];
            if (!error) {
                [[YDCache sharedAppCache] setObject:@"yes" forKey:IsGroupRun];
                [[YDCache sharedAppCache] setObject:param.store.groupRunID forKey:LastGroupRunID];
                
                NSNumber *dayNum = @([[NSDate date] formattedDateWithFormat:@"yyyyMMdd"].integerValue);
                [[YDCache sharedAppCache] setObject:dayNum forKey:LastGroupRunDate];
                [param.webViewController reload];
                [param.webViewController yd_alertConfirm:MSLocalizedString(@"恭喜 , 你已成功参赛！", nil) message:MSLocalizedString(@"请在挑战赛页面点击“开始跑步”，记录你当天的参赛里程。", nil)];
                
            } else {
                [param.webViewController yd_popFailure:error.msg];
            }
        }];
    } else {
        [param.webViewController yd_alertLoginNeeded:MSLocalizedString(@"common.needLoginToChallenge.text", nil)];
    }
    !then?:then(param, nil);
}
- (void)solveLocalActionToFeedback:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
//    NSDictionary *dic = param.parameters;
    id<YDFeedbackServiceProtocol> service = [[BHServiceManager sharedManager] createService:@protocol(YDFeedbackServiceProtocol) withServiceName:nil shouldCache:YES];
    [service openFeedbackFromVC:param.webViewController];
    !then?:then(param, nil);
}
- (void)solveLocalActionGetMembershipInfo:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
//    NSDictionary *dic = param.parameters;
    if ([YDCache app_hasUserId]) {
        [[YDMembershipMgr shareMgr] getAppUserMembershipInfoWithThen:^(BOOL isMembership) {
        }];
    }
    !then?:then(param, nil);
}
- (void)solveLocalActionPromptLogin:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
//    NSDictionary *dic = param.parameters;
    [param.webViewController yd_alertDouble:MSLocalizedString(@"提示", nil) message:MSLocalizedString(@"请先登录", nil) configure:^(MMPopupItem *subItem, MMPopupItem *mainItem) {
        subItem.title = MSLocalizedString(@"取消", nil);
        mainItem.title = MSLocalizedString(@"去登录", nil);
        mainItem.highlight = YES;
        mainItem.handler = ^(NSInteger index) {
            [BHCreateServiceI(YDAppServiceProtocol) removeLogin];
            [[YDJumpTool sharedTool] gotoMainView];
        };
    }];
    !then?:then(param, nil);
}
- (void)solveLocalActionShowFeedback:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
//    NSDictionary *dic = param.parameters;
    [param.webViewController refreshFeedbackItemStatus:YES animated:NO];
    !then?:then(param, nil);
}
- (void)solveLocalActionTheLovingRun:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    CGFloat money = [dic[@"argo"] doubleValue];
    YDRunningViewController *runVC = [[YDRunningViewController alloc] init];
    runVC.sportType = YDSportTypeOutSideRunNormal;
    runVC.fromFiveCityFlag = YES;
    runVC.choosedMoney = money;
    [param.webViewController.navigationController pushViewController:runVC animated:YES];
    !then?:then(param, nil);
}
- (void)solveLocalActionShareAIFingerReport:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    if (dic && [dic isKindOfClass:[NSDictionary class]]) {
        NSString *arg0 = dic[@"arg0"];
        NSString *arg1 = dic[@"arg1"];
        if (arg0 && arg0.length) {
            [self requestWaitShareAIExamineReport:@(arg0.integerValue) buttonTag:!arg1 ? nil : @(arg1.integerValue)];
        }
    }
    !then?:then(param, nil);
}
- (void)solveLocalActionGoToMapiHddgoodGame:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *urlString = [dic objectForKey:@"url"];
    YDDWKWebViewController *webVC = [[YDDWKWebViewController alloc] initWithUrl:urlString];
    [param.webViewController.navigationController pushViewController:webVC animated:YES];
    !then?:then(param, nil);
}
- (void)solveLocalActionPlayRewardVideo:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *entry = dic[@"entry"];
    [param.webViewController yd_startLoading];
    [BHCreateServiceI(YDADRequestServiceProtocol) getRewardVideoADInfoWithEntry:entry then:^(YDTaskVideoInfo *videoInfo, MSError *error) {
        __block NSInteger res = 0;
        if (!error) {
            [BHCreateServiceI(YDADProtocol) loadRewardVideoADWithVideoInfo:videoInfo then:^(NSError *error) {
                [param.webViewController yd_endLoading];
                if (!error) {
                    res = 1;
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"onAdPlayFinish(%ld);", (long)res] completionHandler:^(id result, NSError *error) {
                                            
                    }];
                });
            }];
        } else {
            [param.webViewController yd_endLoading];
            dispatch_async(dispatch_get_main_queue(), ^{
                [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"onAdPlayFinish(%ld);", (long)res] completionHandler:^(id result, NSError *error) {
                                        
                }];
            });
        }
    }];
    !then?:then(param, nil);
}
- (void)solveLocalActionOpenPhoneBind:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *backUrl = [dic[@"url"] stringByRemovingPercentEncoding];//dic[@"url"];
    [YDCache LAR_setServiceTypeForNeedBindPhone:YDNeedBindPhoneServiceTypeWebPage];
    [YDCache LAR_setBackUrlAfterBindPhoneForWebService:backUrl];
    if (![YDCache app_hasLogin]) {
        NSString *message = MSLocalizedString(@"YDBaseViewController.shouldLogin.msg", nil);
        [param.webViewController yd_alertDouble:message
                                       message:nil
                                     configure:^(MMPopupItem *subItem, MMPopupItem *mainItem) {
            mainItem.title = MSLocalizedString(@"YDBaseViewController.loginImmediately.title", nil);
            mainItem.handler = ^(NSInteger index) {
                [[YDJumpTool sharedTool] gotoLoginView];
            };
            subItem.handler = ^(NSInteger index) {
                [YDCache LAR_setServiceTypeForNeedBindPhone:0];
                [YDCache LAR_setBackUrlAfterBindPhoneForWebService:nil];
            };
        }];
    } else {
        UINavigationController *nvc = param.webViewController.navigationController;
        if ([param.webViewController isKindOfClass:YDWebViewController.class]) {
            [nvc popViewControllerAnimated:NO];
        }
        YDNewPhoneBindViewController *vc = [[YDNewPhoneBindViewController alloc] init];
        [nvc pushViewController:vc animated:YES];
        return;
    }
    !then?:then(param, nil);
}
- (void)solveLocalActionMembershipChanged:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
//    NSDictionary *dic = param.parameters;
    [[NSNotificationCenter defaultCenter] postNotificationName:kYDNtfMineIsMembershipAndCache object:nil];
    !then?:then(param, nil);
}
- (void)solveLocalActionWeekChallengeApply:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    YDSportType type = [[dic objectForKey:@"arg0"] integerValue];
    YDIndexSportType indexType = YDIndexSportTypeRun;
    switch (type) {
        case YDSportTypeOutSideRunNormal:
            indexType = YDIndexSportTypeRun;
            break;
        case YDSportTypeStepForAimKind:
            indexType = YDIndexSportTypeWalk;
            break;
        case YDSportTypeOnFoot:
            indexType = YDIndexSportTypeOnFoot;
            break;
        case YDSportTypeCycleRunNormal:
            indexType = YDIndexSportTypeRide;
            break;
        default:
            break;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:kYDQNTFIndexItemDataShouldChange object:@(indexType)];
    !then?:then(param, nil);
}
- (void)solveLocalActionRequestTonguePic:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *callback = [dic objectForKey:@"callback"];
    [self getTonguePictureByCustomer:callback];
    !then?:then(param, nil);
}
- (void)solveLocalActionSetNavBarStyle:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
//    NSDictionary *dic = param.parameters;
    !then?:then(param, nil);
}

//ad
- (void)solveLocalActionAdHandleUrl:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *url = [dic objectForKey:@"arg0"];
//    url = [url stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[YDAdMgr sharedMgr] adsShowHandleWithUrl:url];
    !then?:then(param, nil);
}
- (void)solveLocalActionAdGet:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *callback = [dic objectForKey:@"callback"];
    NSString *url = [dic objectForKey:@"url"];
    NSString *from = [dic objectForKey:@"from"];
    [[YDAdMgr sharedMgr] web_requestAd:url from:from then:^(NSDictionary *result, MSError *error) {
        if (callback.length) {
            NSNumber *success = @1;
            if (error) {
                success = @0;
                result = error.data;
            }
            if (!result) {
                result = @{};
            }
            [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@({'success':%@, 'result':%@});", callback, success, [result yy_modelToJSONString]] completionHandler:^(id result, NSError *error) {
                            
            }];
        }
    }];
    !then?:then(param, nil);
}
- (void)solveLocalActionAdStatisticShow:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *urlsStr = [dic objectForKey:@"url"];
    NSArray<NSString *> *urls = [urlsStr componentsSeparatedByString:@","];
    [urls enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [[YDAdMgr sharedMgr] web_adStatisticShow:obj];
    }];
    !then?:then(param, nil);
}
- (void)solveLocalActionAdStatisticClick:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *urlsStr = [dic objectForKey:@"url"];
    NSArray<NSString *> *urls = [urlsStr componentsSeparatedByString:@","];
    [urls enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [[YDAdMgr sharedMgr] web_adStatisticClick:obj];
    }];
    !then?:then(param, nil);
}
//pay
- (void)solveLocalActionAlipay:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    param.store.payReUrl = dic[@"reUrl"];// [dic[@"reUrl"] yd_urldecodeString]; //
    [param.webViewController yd_startLoading];
    [YDPayTool sharePayTool].delegator = self;
    [[YDPayTool sharePayTool] alipayWithPayDic:dic];
    !then?:then(param, nil);
}
- (void)solveLocalActionPay:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    param.store.payReUrl = dic[@"arg5"];//[dic[@"arg5"] yd_urldecodeString]; //
    BOOL isWXOK = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]] || [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"wechat://"]];
    if (isWXOK) {
        [param.webViewController yd_startLoading];
        param.store.requestPay = YES;
        [YDPayTool sharePayTool].delegator = self;
        [[YDPayTool sharePayTool] wxpayWithPayDic:dic];
    } else {
        [param.webViewController yd_popUpperWarning:@"请先安装微信客户端"];
    }
    !then?:then(param, nil);
}
- (void)solveLocalActionIapGetYuedProduct:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    [YDApplePayMgr shared].currentVc = param.webViewController;
    NSString *successCallback = [dic objectForKey:@"arg0"];
    NSString *failureCallback = [dic objectForKey:@"arg1"];
    [[YDApplePayMgr shared] requestProductsWithCompletion:^(SKProductsRequest *request, SKProductsResponse *response) {
        if (!request || !response || !response.products.count) {
            if (failureCallback.length) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@();", failureCallback] completionHandler:^(id result, NSError *error) {
                                            
                    }];
                });
                
            }
        } else {
            if (successCallback.length) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSString *productsJson = [[YDApplePayMgr shared] productsToJson:[YDApplePayMgr shared].products];
                    [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@(%@);", successCallback, productsJson] completionHandler:^(id result, NSError *error) {
                                            
                    }];
                });
                
            }
        }
    }];
    !then?:then(param, nil);
}
- (void)solveLocalActionIapBuyYuedProduct:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    [YDApplePayMgr shared].currentVc = param.webViewController;
    NSString *productId = [dic objectForKey:@"arg0"];
    NSString *successCallback = [dic objectForKey:@"arg1"];
    NSString *failureCallback = [dic objectForKey:@"arg2"];
    
    [[YDApplePayMgr shared] buyProduct:productId onCompletion:^(YDApplePayCode code) {
        if (code != YDApplePayCodeSuccess) {
            if (failureCallback.length) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@(%@);", failureCallback, @(code)] completionHandler:^(id result, NSError *error) {
                                            
                    }];
                });
                
            }
        } else {
            if (successCallback.length) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@();", successCallback] completionHandler:^(id result, NSError *error) {
                                            
                    }];
                });
                
            }
        }
    }];
    !then?:then(param, nil);
}
- (void)solveLocalActionIapValidateLastPay:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    [YDApplePayMgr shared].currentVc = param.webViewController;
    NSString *successCallback = [dic objectForKey:@"arg0"];
    NSString *failureCallback = [dic objectForKey:@"arg1"];
    [[YDApplePayMgr shared] validateLastPay:^(YDApplePayCode code) {
        if (code != YDApplePayCodeSuccess) {
            if (failureCallback.length) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@(%@);", failureCallback, @(code)] completionHandler:^(id result, NSError *error) {
                                            
                    }];
                });
                
            }
        } else {
            if (successCallback.length) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@();", successCallback] completionHandler:^(id result, NSError *error) {
                                            
                    }];
                });
                
            }
        }
    }];
    !then?:then(param, nil);
}
- (void)solveLocalActionIapGetProductInfo:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    [YDApplePayMgr shared].currentVc = param.webViewController;
    NSString *business = [dic objectForKey:@"arg0"];
    NSString *successCallback = [dic objectForKey:@"arg1"];
    NSString *failureCallback = [dic objectForKey:@"arg2"];
    [[YDApplePayMgr shared] requestAllProductWithBussiness:business completion:^(NSArray<YDIAPProductModel *> *iapProductsArr, YDIAPRequestCode errorCode) {
        if (!iapProductsArr.count) {
            if (failureCallback.length) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@();", failureCallback] completionHandler:^(id result, NSError *error) {
                    }];
                });
                
            }
        } else {
            if (successCallback.length) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSString *productsJson = [[YDApplePayMgr shared] productsToJson:[YDApplePayMgr shared].products];
                    [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@(%@);", successCallback, productsJson] completionHandler:^(id result, NSError *error) {
                    }];
                });
            }
        }
    }];
    !then?:then(param, nil);
}
- (void)solveLocalActionIapBuyProduct:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    [YDApplePayMgr shared].currentVc = param.webViewController;
    NSString *productId = [dic objectForKey:@"arg0"];
    NSString *successCallback = [dic objectForKey:@"arg1"];
    NSString *failureCallback = [dic objectForKey:@"arg2"];
    
    [[YDApplePayMgr shared] buyProduct:productId onCompletion:^(YDApplePayCode code) {
        if (code != YDApplePayCodeSuccess) {
            if (failureCallback.length) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@(%@);", failureCallback, @(code)] completionHandler:^(id result, NSError *error) {
                                            
                    }];
                });
                
            }
        } else {
            if (successCallback.length) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@();", successCallback] completionHandler:^(id result, NSError *error) {
                                            
                    }];
                });
                
            }
        }
    }];
    !then?:then(param, nil);
}
- (void)solveLocalActionIapValidateCallback:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    [YDApplePayMgr shared].currentVc = param.webViewController;
    NSString *successCallback = [dic objectForKey:@"arg0"];
    NSString *failureCallback = [dic objectForKey:@"arg1"];
    [[YDApplePayMgr shared] validateLastPay:^(YDApplePayCode code) {
        if (code != YDApplePayCodeSuccess) {
            if (failureCallback.length) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@(%@);", failureCallback, @(code)] completionHandler:^(id result, NSError *error) {
                                            
                    }];
                });
                
            }
        } else {
            if (successCallback.length) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@();", successCallback] completionHandler:^(id result, NSError *error) {
                                            
                    }];
                });
                
            }
        }
    }];
    !then?:then(param, nil);
}
- (void)solveLocalActionApplepayUpStartPay:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *tn = [dic objectForKey:@"arg0"];
    NSString *callBack = [dic objectForKey:@"arg1"];
    [[YDUPApplePayManager sharedManager] startPayWithEncryptTN:tn viewController:param.webViewController completionBlock:^(UPPayResult *result) {
        if (callBack.length) {
            dispatch_async(dispatch_get_main_queue(), ^{
                // 执行js回调
                
                [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@(\"%@\", \"%@\", \"%@\");", callBack, @(result.paymentResultStatus), result.errorDescription, result.otherInfo] completionHandler:^(id result, NSError *error) {
                                        
                }];
//                MSLogD(@"UPApplePay.callback.js.string = %@", callbackURLDelivery.jsString);
            });
        }
    }];
    !then?:then(param, nil);
}
- (void)solveLocalActionCashPayCallback:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
//    NSDictionary *dic = param.parameters;
    !then?:then(param, nil);
}
- (void)solveLocalActionCcbPayOcr:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *orderNo = [dic objectForKey:@"arg0"];
    NSString *recognizeResult = [dic objectForKey:@"arg1"];
    NSNumber *isTest = [dic objectForKey:@"arg2"];
    [YDCCBPayTool shared].isTest = isTest.boolValue;
    [[YDCCBPayTool shared] readyToGoOCRWithOrderNo:orderNo StartSucceed:^{
        
    } recognizeSucceed:^(NSString * _Nonnull resultJson) {
        if (recognizeResult.length) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@(%@,%@);", recognizeResult, @"0", @"1"] completionHandler:^(id result, NSError *error) {
                                    
                }];
            });
        }
    } recognizeFailed:^(NSString *str) {
        if (recognizeResult.length) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@(%@,%@, %@);", recognizeResult, @"0", @"0", str] completionHandler:^(id result, NSError *error) {
                                    
                }];
            });
        }
    }];
    !then?:then(param, nil);
}
- (void)solveLocalActionCcbPayFaceVerify:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *orderNo = [dic objectForKey:@"arg0"];
    NSString *facdID = [dic objectForKey:@"arg1"];
    NSString *faceVerifyResult = [dic objectForKey:@"arg2"];
    NSNumber *isTest = [dic objectForKey:@"arg3"];
    [YDCCBPayTool shared].isTest = isTest.boolValue;
    [[YDCCBPayTool shared] readyToGoFaceVerifyWithFaceID:facdID orderNo:orderNo faceVerifySucceed:^{
        if (faceVerifyResult.length) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@(%@,%@);", faceVerifyResult, @"1", @"1"] completionHandler:^(id result, NSError *error) {
                                    
                }];
            });
        }
    } faceVerifyFailed:^(NSString *str) {
        if (faceVerifyResult.length) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@(%@,%@,%@);", faceVerifyResult, @"1", @"0", str] completionHandler:^(id result, NSError *error) {
                                    
                }];
            });
        }
    }];
    !then?:then(param, nil);
}
//third
- (void)solveLocalActionWechatSubscribeAuth:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *callback = [dic objectForKey:@"callback"];
    NSString *sceneStr = [dic objectForKey:@"scene"];
    NSNumber *scene = @(sceneStr.integerValue);
    NSString *templateId = [dic objectForKey:@"template_id"];
    NSString *reserved = [dic objectForKey:@"reserved"];
    [BHCreateServiceI(YDThirdAccountProtocol) wechatSubscribeAuth:scene templateId:templateId reserved:reserved completion:^(NSNumber *scene, NSString *templateId, NSString *reserved, NSString *openId, NSString *action) {
        BOOL success = NO;
        if ([action isEqualToString:@"confirm"]) {
            success = YES;
        }
        if (callback.length) {
            [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@({'code':%@, 'scene':%@,'template_id':'%@','reserved':'%@','open_id':'%@','action':'%@'});", callback, @(success), scene, templateId, reserved, openId, action] completionHandler:^(id result, NSError *error) {
                                
            }];
        }
        
    }];
    !then?:then(param, nil);
}
- (void)solveLocalActionOpenWechatMiniProgram:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *userName = dic[@"user_name"];
    NSString *path = dic[@"path"];
    NSNumber *type = dic[@"type"];
    [[YDJumpTool sharedTool] jumpToWechatMiniProgram:userName path:path programType:type.integerValue];
    !then?:then(param, nil);
}
- (void)solveLocalActionYDAliToDetail:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
//    NSDictionary *dic = param.parameters;
    [self goDetailUrl:param.parameters];
    !then?:then(param, nil);
}
- (void)solveLocalActionYDAliOauth:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    [self oauthUrl:param.parameters];
    !then?:then(param, nil);
}
//special
- (void)solveLocalActionQrCode:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    YDQRScanViewController *vc = [[YDQRScanViewController alloc] init];
    if ([dic[@"arg0"] isKindOfClass:[NSString class]] && [dic[@"arg0"] isEqualToString:@"greenroad"]) {
        vc.isQQSimulator= YES;
        vc.feature = YDQrCodeFeatureGreenRoad;
    }
    [param.webViewController.navigationController pushViewController:vc animated:YES];
    !then?:then(param, nil);
}


- (void)solveLocalActionPlayVoice:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSString *voiceName = [dic objectForKey:@"voice_name"];
    NSString *voiceUrl = [dic objectForKey:@"voice_url"];
    if (voiceName.length) {
        [YDAICVoiceKit playVoiceAudio:[YDAICVoiceModel modelWithVoiceLevel:YDAICoachVoiceLevelNormal voiceName:voiceName] finishBlock:nil];
    } else if (voiceUrl.length) {
        [YDAICVoiceKit playVoiceAudio:[YDAICVoiceModel modelWithVoiceLevel:YDAICoachVoiceLevelNormal voiceUrl:voiceUrl] finishBlock:nil];
    }
}

- (void)solveLocalActionStopPlayVoice:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    [YDAICVoiceKit stopAllVoiceAudio];
}

- (void)solveLocalActionCheckAICMaxCompeteVideo:(YDWebViewLocalActionParam *)param then:(void (^)(YDWebViewLocalActionParam *outParam, NSError *error))then {
    NSDictionary *dic = param.parameters;
    NSNumber *videoID = [dic objectForKey:@"video_id"];
    NSNumber *matchID = [dic objectForKey:@"match_id"];
    NSString *callBack = [dic objectForKey:@"call_back"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *maxRecordFileDirectory = [[path firstObject] stringByAppendingPathComponent:[NSString stringWithFormat:kYDAICReocrdCompeteMaxRecordDirectoryPath, [YDCache app_userId], matchID, videoID]];
    NSArray *tempArray = [fileManager contentsOfDirectoryAtPath:maxRecordFileDirectory error:nil];
    int recordID = 0;
    if (tempArray.count) {
        NSString *fileName = tempArray.firstObject;
        NSString *recordIDStr = [[fileName stringByReplacingOccurrencesOfString:@"aic_video_" withString:@""] stringByReplacingOccurrencesOfString:@".mp4" withString:@""];
        recordID = [recordIDStr intValue];
    }
    [param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@(%d);", callBack, recordID] completionHandler:^(id result, NSError *error) {
            
    }];
    !then?:then(param, nil);
}


#pragma mark - util
- (NSString *)getClaimUrlV2:(NSInteger)type param:(YDWebViewLocalActionParam *)param {
    NSString * url = type == 0 ? [YDURL GROUP_SUPERISE] : [YDURL GROUP_CLAIMED];
    NSNumber *userId = [YDCache app_userId];
    url = [url stringByAppendingString:[NSString stringWithFormat:@"?group_run_id=%@&member_id=%@&user_id=%@", @(param.store.groupRunID.integerValue), userId, userId]];
    return url;
}

- (void)shareWithParam:(YDWebViewLocalActionParam *)param {
    if (param.store.isWebLongImageShare) {
        [self shareWebLongImageWithParam:param];
        return;
    }
    [param.webViewController yd_startLoading];
    param.store.rejectDate = [NSDate date];
    NSString *umShareText = nil;
    NSString *umShareTitle = nil;
    UIImage *shareImage = param.store.shareImage;
    if (shareImage == nil) {
        shareImage= [param.webViewController.view yd_convertViewToImage];
    }
    
    if ([YDWebViewHelper sharedInstance].shareRuleArray.count) {
        for (NSDictionary *dic in [YDWebViewHelper sharedInstance].shareRuleArray) {
            NSString *dicKey = dic[@"url"];
            NSArray *dicKeyArr = [dicKey componentsSeparatedByString:@","];
            for (NSString *keyWord in dicKeyArr) {
                NSRange keyWordRange = [param.webViewController.URL.absoluteString rangeOfString:[NSString stringWithFormat:@"/%@",keyWord] options:NSCaseInsensitiveSearch];
                if (keyWordRange.length > 0) {
                    param.store.shareParameter = dic[@"content"];
                    break;
                }
            }
            if (param.store.shareParameter.length > 0) {
                break;
            }
        }
    }
    
    if (param.store.shareParameter.length > 0) {
        if (![MSLocalizable shared].isZhHans) {
            if ([param.store.shareParameter rangeOfString: @"_en"].location == NSNotFound) {
                param.store.shareParameter = [param.store.shareParameter stringByAppendingString: @"_en"];
            }
        }
        NSDictionary *shareDic = [NSDictionary yy_modelWithJSON:[[YDCache app_umOnlineConfig] objectForKey:param.store.shareParameter]];
        umShareText = shareDic[@"content"];
        
        NSRange qRange1 = [umShareText rangeOfString:@"?" options:NSCaseInsensitiveSearch];
        while (qRange1.length > 0) {
            NSString *str1 = [umShareText substringFromIndex:qRange1.location+1];
            NSRange qRange2 = [str1 rangeOfString:@"?" options:NSCaseInsensitiveSearch];
            if (qRange2.length > 0) {
                NSString *str2 = [str1 substringToIndex:qRange2.location];
                if ([str2 isEqualToString:@"title"]) {
                    umShareText = [umShareText stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"?%@?", str2] withString:param.webViewController.title];
                } else {
                    break;
                }
                qRange1 = [umShareText rangeOfString:@"?" options:NSCaseInsensitiveSearch];
            } else {
                break;
            }
        }
    }
    NSDictionary *umOnlineDic = [YDCache app_umOnlineConfig];
    NSDictionary *cnDic = [NSDictionary yy_modelWithJSON:[umOnlineDic objectForKey:UM_YD_SHATE_TEXT_DEFAULET]];
    NSDictionary *enDic = [NSDictionary yy_modelWithJSON:[umOnlineDic objectForKey:UM_YD_SHATE_TEXT_DEFAULET_EN]];
    if (umShareText == nil) {
        
        if ([MSLocalizable shared].isZhHans) {
            umShareText = cnDic[@"content"];
        } else {
            umShareText = enDic[@"content"];
        }
        if (umShareText == nil) {
            umShareText = MSLocalizedString(@"common.share.shareApp.text", nil);
        }
    }
    
    if (umShareTitle == nil) {
        if ([MSLocalizable shared].isZhHans) {
            umShareTitle = cnDic[@"title"];
        } else {
            umShareTitle = enDic[@"title"];
        }
        if (umShareTitle == nil) {
            umShareTitle = MSLocalizedString(@"common.share.shareApp.title", nil);
        }
    }
    
    
    NSString *currentUrlStr = [NSString stringWithFormat:@"%@",param.webViewController.URL.absoluteString];
    
    NSArray *currentUrlArray = [currentUrlStr componentsSeparatedByString:@"?"];
    NSString *currentBaseUrlStr = currentUrlArray[0];
    
    BOOL isWebWord = [[YDWebViewHelper sharedInstance] isWebShareInfoForUrlString:currentBaseUrlStr];
    if (isWebWord) {
        if (param.store.shareImageURLString.length > 0 && !param.store.sharePlatformDic) {
            shareImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:param.store.shareImageURLString]]];
        }
        if (param.store.shareContent.length > 0) {
            umShareText = param.store.shareContent;
        }
        if (param.store.shareTitle.length > 0) {
            umShareTitle = param.store.shareTitle;
        }
    } else {
    }
    BOOL isWebUrl = [[YDWebViewHelper sharedInstance] isWebShareUrlForUrlString:currentBaseUrlStr];
    
    NSString *shareUrl;
    if (isWebUrl && isWebWord && param.store.shareURLString.length > 0) {
        shareUrl = param.store.shareURLString;
    } else {
        NSString *urlStr = currentUrlStr;
        if (param.store.isSurprise) {
            param.store.rewardURLString = currentUrlStr;
            urlStr = [urlStr stringByReplacingOccurrencesOfString:@"superise" withString:@"claimed"];
        }
        
        NSRange rewardRange = [urlStr rangeOfString:@"claimed" options:NSCaseInsensitiveSearch];
        
        NSArray *urlArray = [urlStr componentsSeparatedByString:@"?"];
        shareUrl = urlArray[0];
        NSMutableDictionary *dic = [MSUtil queryDicFromUrl:[NSURL URLWithString:urlStr]].mutableCopy;
        
        [dic setObject:[YDCache app_userId] forKey:@"member_id"];
        [dic setObject:@"true" forKey:@"is_share"];
        if (rewardRange.length == 0 && [dic.allKeys containsObject:@"user_id"]) {
            [dic removeObjectForKey:@"user_id"];
        }
        shareUrl = [self solveYDURLStringParam:shareUrl param:dic];
    }
    __weak typeof(self) wSelf = self;
    if (param.store.sharePlatformDic) {
        NSDictionary<NSString *, NSString *> *dic = [param.store.sharePlatformDic objectForKey: @"wechat_session"];
        NSString *url = [dic objectForKey:@"url"];
        if ([NSURL URLWithString:url]) {
//            [YDShareMgr shared].business = [NSURL URLWithString:url].path;
            [YDShareManager shared].webEventModel.business = [NSURL URLWithString:url].path;
        } else {
            NSString *title = [dic objectForKey:@"title"];
            if (title.length) {
//                [YDShareMgr shared].business = title;
                [YDShareManager shared].webEventModel.business = title;
            } else {
//                [YDShareMgr shared].business = @"ShareImage";
                [YDShareManager shared].webEventModel.business = @"ShareImage";
            }
        }
        
        if (param.store.isShareToAimPlatform) {
            param.store.isShareToAimPlatform = NO;
            [self shareAtPlatformForAimFromWebWithParam:param];
        } else {
            YDShareDefaultContent *defaultContent = [YDShareDefaultContent yy_modelWithDictionary:param.store.sharePlatformDic];
            NSMutableArray *platforms = [YDShareManagerAPI defaultPlatforms_hasCopyUrl].mutableCopy;
            if (![param.store.sharePlatformDic.allKeys containsObject:@"sina"]) {
                [platforms removeObject:@(UMSocialPlatformType_Sina)];
            }
            if ([param.store.sharePlatformDic[@"hide_copy_url"] integerValue] == 1) {
                [platforms removeObject:@(YDUMSocialPlatformType_CopyUrl)];
            }
            YDShareModel *shareModel = [[YDShareModel alloc] initWithPlatforms:platforms defaultContent:defaultContent shareArea:YDShareArea_None presentController:param.webViewController showBlock:nil resultBlock:^(BOOL success) {
                [wSelf dealwithShareResultWithFlag:success withParam:param];
            } from:@"网页分享" sportType:YDSportTypeNone needShowSheet:YES];
            [[YDShareManager shared] shareWithModel:shareModel];
        }
    } else {
        if ([NSURL URLWithString:shareUrl]) {
            [YDShareManager shared].webEventModel.business = [NSURL URLWithString:shareUrl].path;
        } else {
            if (umShareTitle.length) {
                [YDShareManager shared].webEventModel.business = umShareTitle;
            } else {
                [YDShareManager shared].webEventModel.business = @"ShareImage";
            }
        }
        YDShareDefaultContent *defaultContent = [[YDShareDefaultContent alloc] init];
        defaultContent.defaultContent = [[YDShareDefaultContentWeChatSessionModel alloc] initWithTitle:umShareTitle imageStr:nil imageObj:shareImage url:shareUrl text:umShareText];
        YDShareModel *shareModel = [[YDShareModel alloc] initWithPlatforms:[YDShareManagerAPI defaultPlatforms] defaultContent:defaultContent shareArea:YDShareArea_Web presentController:param.webViewController showBlock:nil resultBlock:^(BOOL success) {
            if ([YDShareManager shared].webEventModel.isWebUseLocalShare) {
                [[YDStatisticsMgr sharedMgr] eventForWebShareWithPlatform:[YDShareManager shared].webEventModel.platformType business:[YDShareManager shared].webEventModel.business];
            }
            [[YDShareManager shared] clearLastShareInfo];
            if (param.webViewController.isViewAppear) {
                if (success) {
                    [wSelf shareFinishWithParam:param];
                    [param.webViewController yd_popSuccess: MSLocalizedString(@"common.share.success.text", nil)];
                }else{
                    [param.webViewController yd_popFailure: MSLocalizedString(@"common.share.fail.text", nil)];
                }
            }
        } from:@"网页分享" sportType:YDSportTypeNone needShowSheet:YES];
        [[YDShareManager shared] shareWithModel:shareModel];
    }
    [param.webViewController yd_endLoading];
}

- (void)shareAtPlatformForAimFromWebWithParam:(YDWebViewLocalActionParam *)param {
    YDShareDefaultContent *defaultContent = [YDShareDefaultContent yy_modelWithDictionary:param.store.sharePlatformDic];
    defaultContent.withReward = param.store.reward.integerValue;
    __weak __typeof(self)weakSelf = self;
    YDShareModel *shareModel = [[YDShareModel alloc] initWithPlatforms:@[@(param.store.platformForShareAim)] defaultContent:defaultContent shareArea:YDShareArea_None presentController:param.webViewController showBlock:nil resultBlock:^(BOOL success) {
        [weakSelf dealwithShareResultWithFlag:success withParam:param];
    } from:@"网页分享" sportType:YDSportTypeNone needShowSheet:NO];
    [[YDShareManager shared] shareWithModel:shareModel];
}

- (void)dealwithShareResultWithFlag:(BOOL)shareSuccess withParam:(YDWebViewLocalActionParam *)param {
    if ([YDShareManager shared].webEventModel.isWebUseLocalShare) {
        [[YDStatisticsMgr sharedMgr] eventForWebShareWithPlatform:[YDShareManager shared].webEventModel.platformType business:[YDShareManager shared].webEventModel.business];
    }
    [[YDShareManager shared] clearLastShareInfo];
    if (param.webViewController.isViewAppear) {
        if (shareSuccess) {
            [self shareFinishWithParam:param];
            dispatch_async_on_main_queue(^{
               [param.webViewController yd_popSuccess:MSLocalizedString(@"common.share.success.text", nil)];
            });
        }else{
            dispatch_async_on_main_queue(^{
                [param.webViewController yd_popFailure:MSLocalizedString(@"common.share.fail.text", nil)];
            });
        }
    }
}

- (void)shareWebLongImageWithParam:(YDWebViewLocalActionParam *)param {
    [param.webViewController yd_startLoading];
    __weak __typeof(self)weakSelf = self;
    void(^callback)(UIImage *image) = ^(UIImage *image) {
        UIImage *webImg = image;
        UIImage *shareImg = nil;
        if (param.store.qrCodeString.length) {
            UIImage *secondImg = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:param.store.qrCodeString]]];
            shareImg = [weakSelf mergerImage:webImg secodImage:secondImg];
        } else {
            shareImg = webImg;
        }
        [YDShareManager shared].webEventModel.business = @"ShareImage";
        dispatch_async(dispatch_get_main_queue(), ^{
//            YDShareContentObj *shareObj = [[YDShareContentObj alloc] initWithDefaultObjImg:shareImg];
            NSArray<NSNumber *> *platforms = [YDShareManagerAPI defaultPlatforms];
            if (param.store.isShareToAimPlatform) {
                platforms = @[@(param.store.platformForShareAim)];
            }
            
            YDShareDefaultContent *defaultContent = [[YDShareDefaultContent alloc] init];
            defaultContent.defaultContent = [[YDShareDefaultContentWeChatSessionModel alloc] initWithTitle:nil imageStr:nil imageObj:shareImg url:nil text:nil];
            YDShareModel *shareModel = [[YDShareModel alloc] initWithPlatforms:platforms defaultContent:defaultContent shareArea:YDShareArea_Web presentController:param.webViewController showBlock:nil resultBlock:^(BOOL success) {
                if ([YDShareManager shared].webEventModel.isWebUseLocalShare) {
                    [[YDStatisticsMgr sharedMgr] eventForWebShareWithPlatform:[YDShareManager shared].webEventModel.platformType business:[YDShareManager shared].webEventModel.business];
                }
                [[YDShareManager shared] clearLastShareInfo];
                if (param.webViewController.isViewAppear) {
                    if (success) {
                        [weakSelf shareFinishWithParam:param];
                        [param.webViewController yd_popSuccess:MSLocalizedString(@"common.share.success.text", nil)];
                    }else{
                        [param.webViewController yd_popFailure:MSLocalizedString(@"common.share.fail.text", nil)];
                    }
                }
            } from:@"网页分享" sportType:YDSportTypeNone needShowSheet:YES];
            [[YDShareManager shared] shareWithModel:shareModel];
            [param.webViewController yd_endLoading];
        });
    };
    [param.service snapshotWithParam:param finishBlock:^(UIImage * _Nonnull snapShotImage) {
        callback(snapShotImage);
    }];
}

- (void)downloadWebLongImageWithRect:(CGRect)rect withParam:(YDWebViewLocalActionParam *)param {
    if (CGRectIsEmpty(rect)) {
        rect = CGRectMake(0, 0, 1.0, 1.0);
    }
    [param.webViewController yd_startLoading];
    void(^callback)(UIImage *image) = ^(UIImage *image) {
        [param.webViewController yd_endLoading];
        UIImage *webImg = image;
        CGRect realRect = CGRectMake(rect.origin.x*webImg.size.width, rect.origin.y*webImg.size.height, rect.size.width*webImg.size.width, rect.size.height*webImg.size.height);
        UIImage *cropImg = [webImg yd_imageByCropToRect:realRect];
        
        if (webImg) {
            UIImageWriteToSavedPhotosAlbum(cropImg, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        } else {
            [param.webViewController yd_popFailure:MSLocalizedString(@"下载图片失败", nil)];
        }
    };
    
    [param.service snapshotWithParam:param finishBlock:^(UIImage * _Nonnull snapShotImage) {
        callback(snapShotImage);
    }];
    
}

- (UIImage *)mergerImage:(UIImage *)firstImage secodImage:(UIImage *)secondImage {
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize imageSize = CGSizeMake(SCREEN_WIDTH_V0 * scale, firstImage.size.height);
    UIGraphicsBeginImageContext(imageSize);
    
    [firstImage drawInRect:CGRectMake(0, 0, firstImage.size.width, firstImage.size.height)];
    [secondImage drawInRect:CGRectMake((SCREEN_WIDTH_V0 * scale - secondImage.size.width)/2, firstImage.size.height - secondImage.size.height - 10 * scale, secondImage.size.width, secondImage.size.height)];
    
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultImage;
}
- (void)shareFinishWithParam:(YDWebViewLocalActionParam *)param {
    [param.webViewController evaluateJavaScript:@"onYdShare()" completionHandler:^(id result, NSError *error) {
            
    }];
    if (param.store.isSurprise) {
        param.store.shouldShowPraise = YES;
        param.store.rewardURLString = [self getClaimUrlV2:1 param:param];
        param.webViewController.originalURLString = param.store.rewardURLString;
    } else if (param.store.isShareReward) {
        [param.webViewController yd_alertDouble:MSLocalizedString(@"common.share.successGetReward.msg", nil)
                     message:nil configure:^(MMPopupItem *subItem, MMPopupItem *mainItem) {
                         mainItem.title = MSLocalizedString(@"common.reward.randomReward.title", nil);
                         mainItem.handler = ^(NSInteger index) {
                             param.store.isShareReward = NO;
                             YDWebViewController *vc = [YDWebViewController instance];
                             vc.service.store.isShareIn = YES;
                             vc.originalURLString = [YDURL GROUP_UNSHARECLAIMED_2];
                             [param.webViewController.navigationController pushViewController:vc animated:YES];
                         };
                     }];
    } else if (param.store.isSportShareReward) {
        // 分享成功，领取运动红包
        if ([YDRewardMgr shareMgr].shareReward) {
            [self drawShareRewardShowWithParam:param];
        }
    }
}

- (NSString *)solveYDURLStringParam:(NSString *)urlString param:(NSDictionary *)paramDic {
    
    NSInteger length = [urlString rangeOfString:@"?"].location;
    if (length == NSNotFound) {
        length = urlString.length;
    }
    NSInteger hashIndex = [urlString rangeOfString:@"#"].location;
    NSString *hashString;
    if (hashIndex != NSNotFound) {
        if (length > hashIndex) {
            hashString = [urlString substringWithRange:NSMakeRange(hashIndex, length - hashIndex)];
        } else {
            hashString = [urlString substringFromIndex:hashIndex];
        }
        if (length > hashIndex) {
            length = hashIndex;
        }
        
    }
    NSString *solvedUrlString = [urlString substringWithRange:NSMakeRange(0, length)];
    
    for (NSInteger i = 0; i < paramDic.allKeys.count; i++) {
        NSString *key = [paramDic.allKeys objectAtIndex:i];
        id value = [paramDic objectForKey:key];
        if ([value isKindOfClass:[NSString class]]) {
            NSString *valueStr = (NSString *)value;
            value = valueStr.yd_stringByURLEncode;
        }
        if (i == 0) {
            solvedUrlString = [solvedUrlString stringByAppendingFormat:@"?%@=%@", key, value];
        } else {
            solvedUrlString = [solvedUrlString stringByAppendingFormat:@"&%@=%@", key, value];
        }
    }
    
    if (hashString.length) {
        solvedUrlString = [solvedUrlString stringByAppendingString:hashString];
    }
    
    return solvedUrlString;
}

-(void)drawShareRewardShowWithParam:(YDWebViewLocalActionParam *)param {
    YDReward *reward = [[YDReward alloc] init];
    reward.title = MSLocalizedString(@"common.share.shareSportTitle", nil);
    reward.afterTitle = @"";
    reward.type = @(RewardTypeShare);
    if ([YDRewardMgr shareMgr].canPopReward) {
        [[YDRewardMgr shareMgr] popupShareReward:reward formCurrentVC:param.webViewController dismissBlock:^{

        }];
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:NTF_SHOULD_POP_REWARD_WHILE_USER_SET_NO object:nil userInfo:@{@"reward": reward}];
    }
}

#pragma mark - imagesave
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
    if (error == nil) {
        [self.param.webViewController yd_popSuccess:MSLocalizedString(@"已保存到系统相册", nil)];
    }else{
        [self.param.webViewController yd_popFailure:MSLocalizedString(@"保存到系统相册失败", nil)];
    }
    
}

- (void)openGetPicFileMenuWithParam:(YDWebViewLocalActionParam *)param {
    //在这里弹出下方菜单按钮项
    __weak typeof(self) wSelf = self;
    MMPopupItem *cameraItem = MMItemMake(MSLocalizedString(@"common.open_camera", @"打开照相机"), MMItemTypeNormal, ^(NSInteger index) {
        [wSelf takePhotoWithParam:param];
    });
    MMPopupItem *photoItem = MMItemMake(MSLocalizedString(@"common.open_albums", @"从手机相册获取"), MMItemTypeNormal, ^(NSInteger index) {
        [wSelf LocalPhotoWithParam:param];
    });
    [param.webViewController yd_sheetWithTitle:nil items:@[cameraItem, photoItem]];
}

/**
 * 打开照相机开始拍照
 */
-(void)takePhotoWithParam:(YDWebViewLocalActionParam *)param {
    BOOL isAllowsEditing = param.store.isAllowEdit;
    if (param.store.isWaterMark || param.store.isFreeClip) {
        isAllowsEditing = NO;
    }
    
    
    UIImagePickerController *picker = [YDTools openCameraWithIsAllowsEditing:isAllowsEditing];
    TZAssetAuthorizationStatus status = [TZImageManager getCameraAuthorStatus];
    if (status == TZAssetAuthorizationStatusNotAuthorized) {
        [picker yd_alertSingle:@"请打开相机权限" message:@"您已经禁止了拍照权限，请前往设置->隐私->相机授权应用拍照权限" configure:^(MMPopupItem *item) {
            //        MSLogD(@"gh- 确定");
        }];
        return;
    }
    picker.cameraDevice = param.store.cameraDevice;
    if (picker != nil) {
        //        picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        picker.delegate = self;
        if([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0) {
            picker.modalPresentationStyle=UIModalPresentationFullScreen;
        }
        [param.webViewController presentViewController:picker animated:YES completion:^{
        }];
    }
}

//打开相册
-(void)LocalPhotoWithParam:(YDWebViewLocalActionParam *)param {
    BOOL isAllowsEditing = param.store.isAllowEdit;
    if (param.store.isWaterMark || param.store.isFreeClip) {
        isAllowsEditing = NO;
    }
    UIImagePickerController *picker = [YDTools openSystemImageWithIsAllowsEditing:isAllowsEditing];
    picker.delegate = self;
    if([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0) {
        picker.modalPresentationStyle=UIModalPresentationOverCurrentContext;
    }
    picker.navigationBar.tintColor = YDTC(Main);
    picker.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor],
                                                 NSFontAttributeName: [UIFont systemFontOfSize:YDFontSizeNav]};
    [param.webViewController presentViewController:picker animated:YES completion:^{
    }];
}

//选择图片之后
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info editingInfo:(NSDictionary *)editingInfo
{
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    //当选择的类型是图片
    if ([type isEqualToString:@"public.image"])
    {
        [self.param.webViewController yd_startLoading];
        
        //先把图片转成NSData
        
        //关闭相册界面
        [picker dismissViewControllerAnimated:YES completion:^{
        }];
        
        if(self.param.store.isWaterMark || self.param.store.oppoAddPhotoCallback.length){
            self.param.store.isWaterMark = NO;
            UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
            if (self.param.store.oppoAddPhotoCallback.length) {
                image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
            }
            if (image.size.width > (SCREEN_WIDTH_V0 * 2)) {
                CGFloat shrink = (SCREEN_WIDTH_V0 * 2)/image.size.width;
                //对图片尺寸进行压缩
                CGSize imagesize = image.size;
                imagesize.width = SCREEN_WIDTH_V0 * 2;
                imagesize.height = imagesize.height * shrink;
                image = [YDTools imageWithImageResize:image scaledToSize:imagesize];
            }
            //
            [self.param.webViewController yd_endLoading];
            YDRunModel *model = [[YDRunModel alloc] init];
            model.kindID = @6;
            [[YDStatisticsMgr sharedMgr] eventEnterWatermark];
//            YDWatermarkViewController *vc = [[YDWatermarkViewController alloc] initWithImage:image runModel:model];
//            vc.delegate = self;
            
            if (self.param.store.oppoAddPhotoCallback.length) {
                self.param.store.oppoAddPhotoCallback = @"";
                WBGImageEditor *vc = [[WBGImageEditor alloc] initWithImage:image wbgImageEditorMode:YDWBGImageEditorModeOPPOAct isCurrentShare:YES runItem:nil delegate:self dataSource:self];
                [self.param.webViewController.navigationController pushViewController:vc animated:YES];
            } else {
                WBGImageEditor *vc = [[WBGImageEditor alloc] initWithImage:image isCurrentShare:YES runItem:model delegate:self dataSource:nil];
                [self.param.webViewController.navigationController pushViewController:vc animated:YES];
            }
            
            return;
        }
        
        
        if (self.param.store.photoGenerateBase64) {
            self.param.store.photoGenerateBase64 = NO;
            if (self.param.store.photoMaxWidth <= 0) {
                self.param.store.photoMaxWidth = 700;
            }
            if (self.param.store.photoMaxSize <= 0) {
                self.param.store.photoMaxSize = 102400;
            }
            UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
            CGSize imageSize = image.size;
            if (imageSize.width > self.param.store.photoMaxWidth) {
                imageSize.height = self.param.store.photoMaxWidth / imageSize.width * imageSize.height;
                imageSize.width = self.param.store.photoMaxWidth;
            }
            image = [YDTools imageWithImageResize:image scaledToSize:imageSize];
            image = [image yd_compressImageWithMaxFileSize:self.param.store.photoMaxSize];
            NSData *imageData = UIImageJPEGRepresentation(image, 1);
            NSString *imageBase64 = [imageData base64EncodedStringWithOptions:0];
            
            NSNumber *flag = imageBase64.length ? @1 : @0;
            [self.param.webViewController yd_endLoading];
            if (self.param.store.photoBase64Callback.length) {
                [self.param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@(%@,'%@');", self.param.store.photoBase64Callback, flag, imageBase64] completionHandler:^(id result, NSError *error) {
                                    
                }];
            }
            
            if (self.param.store.ofoAddPhotoCallback.length) {
                [self.param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@(%@,'data:image/jpeg;base64,%@');", self.param.store.ofoAddPhotoCallback, flag, imageBase64] completionHandler:^(id result, NSError *error) {
                                    
                }];
            }
            return;
        }
        
        if (self.param.store.isFreeClip) {
            self.param.store.isFreeClip = NO;
            UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
            [self.param.webViewController yd_endLoading];
            WBGImageEditor *vc = [[WBGImageEditor alloc] initWithImage:image wbgImageEditorMode:YDWBGImageEditorModeOnlyClip isCurrentShare:NO runItem:nil delegate:self dataSource:nil];
            [self.param.webViewController.navigationController pushViewController:vc animated:YES];
            return;
        }
        
        UIImage* image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
        if (self.param.store.isFreeClip || !self.param.store.isAllowEdit) {
            image = [info objectForKey:UIImagePickerControllerOriginalImage];
        }
        //得到选择后沙盒中图片的完整路径
        self.param.store.filePath = [YDTools saveImage:[image yd_compressTo1MB] withName:@"yuedong_portrait.png" andCompressionQuality:[YDUMConfig shared].picCompressQuality.doubleValue];
        
        //        _filePath = [YDTools compressImage:_filePath];
        
        if (self.param.store.pictureSource == nil) {
            self.param.store.pictureSource = PHOTO_UPLOAD_SOURCE_CIRCLE_TOPIC;
        }
        __weak __typeof(self)weakSelf = self;
        [[YDShareManager shared] addFile:self.param.store.filePath name:@"yuedong_web_img.png" source:self.param.store.pictureSource uploadProgressBlock:^(CGFloat progress) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"onFileUploadProgress(%.3f)", progress] completionHandler:^(id result, NSError *error) {
                                    
                }];
            });
        } completion:^(id responseObj, MSError * error) {
            if (!error) {
                NSDictionary *dic = responseObj;
                weakSelf.param.store.photoId = [dic objectForKey:@"file_id"];
                [weakSelf.param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"onFileUploadSuccess('%@')", weakSelf.param.store.photoId] completionHandler:^(id result, NSError *error) {
                                    
                }];
            } else {
                [weakSelf.param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"onFileUploadFail(0, '%@')", @""] completionHandler:^(id result, NSError *error) {
                                    
                }];
            }
        }];
        
        [self.param.webViewController yd_endLoading];
        [self.param.webViewController evaluateJavaScript:@"onFileStartUpload()" completionHandler:^(id result, NSError *error) {
                                            
        }];
    }else{
        //选择图片不正确
        [self.param.webViewController yd_alertConfirm:MSLocalizedString(@"photo.notChoosePic.title", nil)
                      message:MSLocalizedString(@"photo.pleaseChoosePic.msg", nil)];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    [self imagePickerController:picker didFinishPickingMediaWithInfo:info editingInfo:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{
        if (self.param.store.photoGenerateBase64 && self.param.store.photoBase64Callback.length) {
            self.param.store.photoGenerateBase64 = NO;
            [self.param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@(%@,'%@');", self.param.store.photoBase64Callback, @0, @""] completionHandler:^(id result, NSError *error) {
                                                
                            }];
        }
        
        if (self.param.store.photoGenerateBase64 && self.param.store.ofoAddPhotoCallback.length) {
            self.param.store.photoGenerateBase64 = NO;
            [self.param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@(%@,'%@');", self.param.store.ofoAddPhotoCallback, @0, @""] completionHandler:^(id result, NSError *error) {
                                                
                            }];
        }
    }];
}

#pragma mark - WBGImageEditorDelegate

- (void)imageEditor:(WBGImageEditor *)editor didFinishEdittingWithImage:(UIImage *)image {
    if (image) {
        
        [self.param.webViewController yd_startLoading];
        if (self.param.store.photoMaxSize <= 0) {
            self.param.store.photoMaxSize = 1024*1024*5;
        }
        UIImage *resImg = [image yd_compressImageWithMaxFileSize:self.param.store.photoMaxSize];
        self.param.store.filePath = [YDTools saveImage:resImg withName:@"yuedong_portrait.png" andCompressionQuality:1];
        
        if (self.param.store.pictureSource == nil) {
            self.param.store.pictureSource = PHOTO_UPLOAD_SOURCE_CIRCLE_TOPIC;
        }
        __weak __typeof(self)weakSelf = self;
        [[YDShareManager shared] addFile:self.param.store.filePath name:@"yuedong_web_img.png" source:self.param.store.pictureSource uploadProgressBlock:^(CGFloat progress) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"onFileUploadProgress(%f)", progress] completionHandler:^(id result, NSError *error) {
                                                    
                                }];
            });
        } completion:^(id  _Nullable responseObj, MSError * _Nullable error) {
            [weakSelf.param.webViewController yd_endLoading];
            if (!error) {
                NSDictionary *dic = responseObj;
                weakSelf.param.store.photoId = [dic objectForKey:@"file_id"];
                [weakSelf.param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"onFileUploadSuccess('%@')", weakSelf.param.store.photoId] completionHandler:^(id result, NSError *error) {
                                                    
                                }];
            } else {
                [weakSelf.param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"onFileUploadFail(0, '%@')", @""] completionHandler:^(id result, NSError *error) {
                                                    
                                }];
            }
        }];
        
        [self.param.webViewController evaluateJavaScript:@"onFileStartUpload()" completionHandler:^(id result, NSError *error) {
                                            
        }];
    } else {
        [self.param.webViewController yd_alertConfirm:MSLocalizedString(@"photo.notChoosePic.title", nil)
        message:MSLocalizedString(@"photo.pleaseChoosePic.msg", nil)];
    }
}

#pragma mark - water mark
- (void)filterViewCompleteWithPhotoID:(NSString *)photoID {
    NSString *sucCallback = [NSString stringWithFormat:@"%@&watermark_pic_id=%@",self.param.store.sucCallback,photoID];
    self.param.webViewController.originalURLString = sucCallback;
}

- (void)onBackSoundWebViewDisappearNotify:(NSNotification *)noti {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ydNtfMWebViewWillDispear object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ydNtfMWebViewBackForward object:nil];
    REDUCE_AUDIOSESSION_ONE;
}

-(void)payToolPaySucceed {
    [self.param.webViewController yd_endLoading];
    self.param.webViewController.originalURLString = self.param.store.payReUrl;
    [self.param.webViewController yd_popSuccess: MSLocalizedString(@"pay.success.text", nil)];
}

-(void)payToolPayFailed {
    [self.param.webViewController yd_endLoading];
    [self.param.webViewController yd_alertConfirm:MSLocalizedString(@"支付失败", nil) message:MSLocalizedString(@"支付过程中可能出现了错误，请重新支付。", nil)];
}

- (NSArray<WBGMoreKeyboardItem *> *)imageItemsEditor:(WBGImageEditor *)editor {
    return nil;
}

- (void)requestWaitShareAIExamineReport:(NSNumber*)reportID buttonTag:(NSNumber *)buttonTag {
    [self.param.webViewController yd_startLoading];
    self.recordApi = [[YDAIFingerTestGetHealthExaminationRecordOneApi alloc] initWithReportID:reportID];
    __weak typeof(self) wSelf = self;
    [self.recordApi startWithCompletionHandle:^(__kindof YDBaseInHttpKitAPIManager *api, MSError *error) {
        if (!error) {
            YDAIFingerTestResultModel *model = [YDAIFingerTestResultModel resultModelWithData:api.responseJsonObject[@"info"][@"user_health"]];
            [wSelf shareAIFingerExamineReport:model buttonTag:buttonTag];
        }
        else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [wSelf.param.webViewController yd_endLoading];
            });
        }
    }];
}

- (void)shareAIFingerExamineReport:(YDAIFingerTestResultModel*)model buttonTag:(NSNumber *)buttonTag {
    self.shareApi = [[YDAIFingerTestShareApi alloc] initWithReportID:model.reportID];
    __weak typeof(self) wSelf = self;
    [self.shareApi startWithCompletionHandle:^(__kindof YDBaseInHttpKitAPIManager *api, MSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [wSelf.param.webViewController yd_endLoading];
            if (!error) {
                [wSelf.shareView setupViewContentsByFingerResultModel:model];
                [wSelf showAIExamineReportShareView:buttonTag];
            }
        });
    }];
    

}

- (void)showAIExamineReportShareView:(NSNumber *)buttonTag {
    [self.shareView setShareInfo:self.shareApi.shareInfo];
    YDShareContentObj *shareObj = [[YDShareContentObj alloc] init];
    YDShareContentURL *contentURL = [[YDShareContentURL alloc] initWithURL:self.shareApi.shareInfo.shareURL headImg:[UIImage imageNamed:@"icon_ai_finger_share_icon"] title:self.shareApi.shareInfo.shareContent descri:self.shareApi.shareInfo.shareTitle];
//    [self.param.webViewController.view addSubview:self.shareView];
    [self.param.webViewController.view insertSubview:self.shareView atIndex:0];
    __weak __typeof(self)weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIImage *shareImg = [self.shareView.contentView yd_convertViewToImage];
        YDShareContentImg *imgObj = [[YDShareContentImg alloc] initWithImg:shareImg];
        shareObj.imgObj = imgObj;
        shareObj.defaultContentObj =YDShareContentFlagImg;
        shareObj.urlObj = contentURL;
        [self.shareView removeFromSuperview];
        NSMutableArray <NSNumber *> *platforms = [YDShareMgr defaultPlatforms].mutableCopy;
        if ([platforms containsObject:@(UMSocialPlatformType_Sina)]) {
            [platforms removeObject:@(UMSocialPlatformType_Sina)];
        }
        
        YDShareDefaultContent *defaultContent = [[YDShareDefaultContent alloc] init];
        defaultContent.defaultContent = [[YDShareDefaultContentWeChatSessionModel alloc] initWithTitle:nil imageStr:nil imageObj:shareImg url:nil text:nil];
        YDShareModel *shareModel = [[YDShareModel alloc] initWithPlatforms:platforms defaultContent:defaultContent shareArea:YDShareArea_None presentController:weakSelf.param.webViewController showBlock:buttonTag == nil ? nil : ^(BOOL show, NSNumber * _Nonnull selectedType) {
            NSNumber *ev3 = @0;
            if (selectedType.boolValue) {
                ev3 = selectedType;
            }
            if ([buttonTag isKindOfClass:[NSNumber class]]) {
                [[YDStatisticsMgr sharedMgr] yd_addLogEvent:@[@203, @10, @1, buttonTag, ev3] uploadImmediately:NO];
            }
        } resultBlock:^(BOOL success) {
            if (success) {
                [weakSelf.param.webViewController yd_popSuccess:@"分享成功"];
                NSDate *lastDrawShareRewardDate = [YDCache user_drawShareRewardDate];
                if (lastDrawShareRewardDate == nil || ![[NSDate date] isSameDay:lastDrawShareRewardDate]) {
                    [weakSelf drawShareRewardShowWithParam:self.param];
                }
            } else {
                [weakSelf.param.webViewController yd_popFailure:MSLocalizedString(@"分享失败，可能没有安装对应App", nil)];
            }
        } from:@"ai_health" sportType:0 needShowSheet:YES];
        [[YDShareManager shared] shareWithModel:shareModel];
    });
}

#pragma mark - alibc
- (void)goDetailUrl:(NSString *)urlString
{
    // mg://goDetail?url=https%3a%2f%2fdetail.tmall.com%2fitem.htm%3fid%3d545779300317%26spm%3da21bz.7725273.1998564503.1.2d5a3db8CWo1BG%26umpChannel%3dqianggou%26u_channel%3dqianggou
//    NSString *r = @"mg://goDetail?url=";
//    if ([urlString rangeOfString:r].location != NSNotFound) {
//        urlString = [urlString substringFromIndex:r.length];
//    }
    if (urlString.length) {
        // 解码
        urlString = [self urlDecodedString:urlString];
    }
    
    AlibcTradeShowParams *showParam = [[AlibcTradeShowParams alloc] init];
    showParam.openType = AlibcOpenTypeNative;
    showParam.isNeedPush = YES;
    showParam.nativeFailMode = AlibcNativeFailModeJumpH5;
    [[AlibcTradeSDK sharedInstance].tradeService openByUrl:urlString
                                                  identity:@"trade"
                                                   webView:self.param.webViewController.webView.webViewInstance
                                          parentController:self.param.webViewController
                                                showParams:showParam
                                               taoKeParams:nil
                                                trackParam:nil
                               tradeProcessSuccessCallback:nil
                                tradeProcessFailedCallback:nil];
}

- (void)oauthUrl:(NSString *)urlString
{
    void (^oauthBlock)(NSString *__nonnull url) = ^(NSString *__nonnull url){

        AlibcTradeShowParams *showParam = [[AlibcTradeShowParams alloc] init];
        showParam.openType = AlibcOpenTypeAuto;
        showParam.isNeedPush = YES;
        showParam.nativeFailMode = AlibcNativeFailModeJumpH5;
        
        [[AlibcTradeSDK sharedInstance].tradeService openByUrl:url
                                                      identity:@"trade"
                                                       webView:self.param.webViewController.webView.webViewInstance
                                              parentController:self.param.webViewController
                                                    showParams:showParam
                                                   taoKeParams:nil
                                                    trackParam:nil
                                   tradeProcessSuccessCallback:nil
                                    tradeProcessFailedCallback:nil];
    };
    
    void (^loginBlock)(NSString *url) = ^(NSString *url){
        BOOL isLogin = [[ALBBSession sharedInstance] isLogin];
        if (isLogin) {
            oauthBlock(url);
        }
        else {
            [[ALBBSDK sharedInstance] setAuthOption:NormalAuth];
            [[ALBBSDK sharedInstance] auth:self.param.webViewController
                           successCallback:^(ALBBSession *session) {
                oauthBlock(url);
            } failureCallback:^(ALBBSession *session, NSError *error) {
                oauthBlock(url);
            }];
        }
    };
    
    // mg://goDetail?url=https%3a%2f%2fdetail.tmall.com%2fitem.htm%3fid%3d545779300317%26spm%3da21bz.7725273.1998564503.1.2d5a3db8CWo1BG%26umpChannel%3dqianggou%26u_channel%3dqianggou
//    NSString *r = @"mg://oauth?url=";
//    if ([urlString rangeOfString:r].location != NSNotFound) {
//        urlString = [urlString substringFromIndex:r.length];
//    }
    if (urlString.length) {
        // 解码
        urlString = [self urlDecodedString:urlString];
    }
    loginBlock(urlString);
}

/**
 url解码
 
 @param input 原码串
 @return 返回解码串
 */
- (NSString *)urlDecodedString:(NSString *)input
{
    // 首先替换+为空格，保证解码正常
    input = [input stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    NSString *decodedString=(__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef)input, CFSTR(""), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    
    return decodedString;
}

- (void)deleteCalendarRemindWithStartTs:(NSNumber *)startTs endTs:(NSNumber *)endTs keyword:(NSString *)keyword {
    EKEventStore *eventDB = [[EKEventStore alloc] init];
    __weak typeof(self) wSelf = self;
    [eventDB requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError * _Nullable error) {
        if (granted) { //授权是否成功
            [wSelf makeSureToDeleteCalendarRemindByEventDB:eventDB startTs:startTs endTs:endTs keyword:keyword];
        }
    }];
}

- (void)makeSureToDeleteCalendarRemindByEventDB:(EKEventStore *)eventDB startTs:(NSNumber *)startTs endTs:(NSNumber *)endTs keyword:(NSString *)keyword {
    NSArray *tempA = [eventDB calendarsForEntityType:EKEntityTypeEvent];
    NSMutableArray *only3D = [NSMutableArray array];
    for (int i = 0 ; i < tempA.count; i ++) {
        EKCalendar *temCalendar = tempA[i];
        EKCalendarType type = temCalendar.type;
        // 工作、家庭和本地日历
        if (type == EKCalendarTypeLocal || type == EKCalendarTypeCalDAV)  {
            [only3D addObject:temCalendar];
        }
    }
    
    NSDate *startDate;
    NSDate *endDate;
    if (!startTs) {
        startDate = [NSDate dateWithTimeIntervalSinceNow:(-1 * 3600 * 24)];
    } else {
        startDate = [NSDate dateWithTimeIntervalSince1970:startTs.integerValue];
    }
    if (!endTs) {
        endDate = [NSDate dateWithTimeIntervalSinceNow:(120 * 3600 * 24)];
    } else {
        endDate = [NSDate dateWithTimeIntervalSince1970:endTs.integerValue];
    }
    if (!keyword) {
        keyword = @"";
    }
    
    NSPredicate *predicate = [eventDB predicateForEventsWithStartDate:startDate endDate:endDate calendars:only3D];
    NSArray *events = [eventDB eventsMatchingPredicate:predicate];
    for (EKEvent *event in events) {
        if ([event.notes containsString:keyword]) {
            [eventDB removeEvent:event span:EKSpanThisEvent error:nil];
        }
    }
}

- (void)addCalendarRemindWith:(NSArray *)paramsArr0 paramsDic1:(NSDictionary *)paramsDic1 complete:(IntegerBlock)complete {
    __weak typeof(self) wSelf = self;
    EKEventStore *eventDB = [[EKEventStore alloc] init];
    [eventDB requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError * _Nullable error) {
        if (granted) { //授权是否成功
            
            if (paramsArr0.count <= 0) {
                dispatch_async_on_main_queue(^{
                    [wSelf.param.webViewController yd_popText:MSLocalizedString(@"设置日历提醒失败，请重试", nil)];
                });
                
                return;
            }
            for (NSDictionary *dic in paramsArr0) {
                NSNumber *dayTs = dic[@"day_time"];
                NSDate *dayTime = [NSDate dateWithTimeIntervalSince1970:dayTs.integerValue];
                // 默认19点提醒
                NSDate *beginDate = [NSDate dateWithYear:dayTime.year month:dayTime.month day:dayTime.day hour:19 minute:0 second:0];
                if (dic[@"remind_ts"]) {
                    NSNumber *remindTs = dic[@"remind_ts"];
                    beginDate = [NSDate dateWithTimeIntervalSince1970:remindTs.integerValue];
                }
                NSDate *endDate = [NSDate dateWithYear:beginDate.year month:beginDate.month day:beginDate.day hour:23 minute:59 second:59];
                NSInteger totalCostTime = 0;
                NSArray *courses = dic[@"course"];
                NSString *notesStr = @"科学运动计划：";
                for (NSDictionary *course in courses) {
                    NSNumber *costTime = course[@"cost_time"];
                    totalCostTime += costTime.integerValue;
                    notesStr = [NSString stringWithFormat:@"%@%@; ", notesStr, course[@"course_title"]];
                }
//                            NSNumber *endTs = @(dayTs.integerValue + totalCostTime);
                NSString *finalTitle = paramsDic1[@"title"];
                NSString *finalNotes = notesStr;
                if (dic[@"title"]) {
                    finalTitle = dic[@"title"];
                }
                if (dic[@"content"]) {
                    finalNotes = dic[@"content"];
                }
                
                EKEvent *myEvent  = [EKEvent eventWithEventStore:eventDB];
                myEvent.title = finalTitle;
                myEvent.notes = finalNotes;
                myEvent.startDate = beginDate;
                myEvent.endDate = endDate;
                [myEvent addAlarm:[EKAlarm alarmWithAbsoluteDate:beginDate]]; //添加一个闹钟  optional
                [myEvent setCalendar:[eventDB defaultCalendarForNewEvents]];
                [eventDB saveEvent:myEvent span:EKSpanThisEvent error:nil];
                
                
//                NSArray *tempA = [eventDB calendarsForEntityType:EKEntityTypeEvent];
//                NSMutableArray *only3D = [NSMutableArray array];
//                for (int i = 0 ; i < tempA.count; i ++) {
//                    EKCalendar *temCalendar = tempA[i];
//                    EKCalendarType type = temCalendar.type;
//                    // 工作、家庭和本地日历
//                    if (type == EKCalendarTypeLocal || type == EKCalendarTypeCalDAV)  {
//                        [only3D addObject:temCalendar];
//                    }
//                }
//
//                NSPredicate *predicate = [eventDB predicateForEventsWithStartDate:beginDate endDate:endDate calendars:only3D];
//                NSArray *events = [eventDB eventsMatchingPredicate:predicate];
//                BOOL isExist = NO;
//                for (EKEvent *event in events) {
//                    if ([event.title isEqualToString:myEvent.title]) {
//                        isExist = YES;
//                        break;
//                    }
//                }
//
//                if (!isExist) {
//                    [eventDB saveEvent:myEvent span:EKSpanThisEvent error:nil];
//                }
            }
            !complete ? : complete(0);
            MSLogD(@"[日历提醒] 获得授权成功");
            dispatch_async_on_main_queue(^{
                [wSelf.param.webViewController yd_popText:MSLocalizedString(@"设置日历提醒成功", nil)];
            });
            
        } else {
            !complete ? : complete(1);
            MSLogD(@"[日历提醒] 获得授权失败");
            dispatch_async_on_main_queue(^{
                [wSelf.param.webViewController yd_popText:MSLocalizedString(@"请同意授权才能设置提醒哦", nil)];
            });
            
        }
    }];
}

/**
 拍照/选取舌头照片
 */
- (void)getTonguePictureByCustomer:(NSString*)callback {
    if (callback && callback.length != 0) {
        YDAIChildTongueTestProcessViewController *vc = [YDAIChildTongueTestProcessViewController new];
        typeof(self) __weak weakself = self;
        static UIImage *selectTongueImage = nil;
        [vc setDidHandleVaildTonguePicture:^(UIImage *photo) {
            selectTongueImage = photo;
            [NSThread detachNewThreadWithBlock:^{
                typeof(weakself) __strong strongself = weakself;
                [strongself givePictureDataBase64:selectTongueImage callback:callback];
                selectTongueImage = nil;
            }];
        }];
        if (self.param.webViewController.navigationController) {
            [self.param.webViewController.navigationController pushViewController:vc animated:YES];
        } else {
            vc.modalPresentationStyle = UIModalPresentationFullScreen;
            [self.param.webViewController presentViewController:vc animated:NO completion:nil];
        }
    }
}

#pragma mark - give out picture by data64
- (void)givePictureDataBase64:(UIImage*)image callback:(NSString*)callback {
    if (callback && callback.length != 0) {
        if (image != nil) {
            if (image.size.width > (SCREEN_WIDTH_V0 * 2)) {
                CGFloat shrink = (SCREEN_WIDTH_V0 * 2)/image.size.width;
                //对图片尺寸进行压缩
                CGSize imagesize = image.size;
                imagesize.width = SCREEN_WIDTH_V0 * 2;
                imagesize.height = imagesize.height * shrink;
                image = [YDTools imageWithImageResize:image scaledToSize:imagesize];
            }
            //舌头照片可以清晰一点限制300K以下
            image = [image yd_compressImageWithMaxFileSize:102400 * 3];
        }
        NSData *imageData = image ? UIImageJPEGRepresentation(image, 1) : nil;
        NSString *imageBase64 = [imageData base64EncodedStringWithOptions:0];
        NSNumber *flag = imageBase64.length ? @1 : @0;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"%@(%@,'%@');", callback, flag, imageBase64] completionHandler:^(id result, NSError *error) {
                        
            }];
        });
    }
}

#pragma mark notification
- (void)addFileFinished:(NSNotification *)notification {
    [self.param.webViewController yd_endLoading];
    MSBaseResult *br = notification.object;
    if (![self.param.webViewController.uuid isEqualToString: br.uuid]) {
        return;
    }
    if (br.success) {
        NSDictionary *dic = br.data;
        self.param.store.photoId = [dic objectForKey:@"file_id"];
        [self.param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"onFileUploadSuccess('%@')", self.param.store.photoId] completionHandler:^(id result, NSError *error) {
                    
        }];
    } else {
        [self.param.webViewController evaluateJavaScript:[NSString stringWithFormat:@"onFileUploadFail(0, '%@')", @""] completionHandler:^(id result, NSError *error) {
                    
        }];
    }
}

@end
