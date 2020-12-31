//
// Created by Godlike on 2020/2/24.
// Copyright (c) 2020 yuedong. All rights reserved.
//

#import "YDWebViewLocalActionParam.h"
#import "YDWebViewLocalAction.h"
#import "YDWebViewController.h"
#import "YDWebService.h"

//action strings
//common
static NSString *const YDWebViewLocalActionStringGetYodoInfo = @"get_yodo_info";
static NSString *const YDWebViewLocalActionStringConfigWeb = @"config_web";
//private

//old
//common
static NSString *const YDWebViewLocalActionStringShare = @"share";
static NSString *const YDWebViewLocalActionStringShareParam = @"share_params";
static NSString *const YDWebViewLocalActionStringShareText = @"share_text";
static NSString *const YDWebViewLocalActionStringReportEvent = @"report_event";
static NSString *const YDWebViewLocalActionStringReportTimeEventStart = @"report_time_event_start";
static NSString *const YDWebViewLocalActionStringReportTimeEventEnd = @"report_time_event_end";
static NSString *const YDWebViewLocalActionStringReportEventUm = @"report_event_um";
static NSString *const YDWebViewLocalActionStringReportLogEvent = @"report_log_event";
static NSString *const YDWebViewLocalActionStringHidePullRefresh = @"hide_pull_refresh";
static NSString *const YDWebViewLocalActionStringOpenUrlInternal = @"open_url_internal";
static NSString *const YDWebViewLocalActionStringOpenUrlNewWindow = @"open_url_new_window";
static NSString *const YDWebViewLocalActionStringHideShareBnt = @"hide_share_bnt";
static NSString *const YDWebViewLocalActionStringShowShareBnt = @"show_share_bnt";
static NSString *const YDWebViewLocalActionStringSelectUploadPic = @"select_upload_pic";
static NSString *const YDWebViewLocalActionStringPhotographUploadPic = @"photograph_upload_pic";
static NSString *const YDWebViewLocalActionStringPhotographToBase64 = @"photograph_to_base_64";
static NSString *const YDWebViewLocalActionStringBackRefresh = @"back_refresh";
static NSString *const YDWebViewLocalActionStringOpenUrlBySafari = @"open_url_by_safari";
static NSString *const YDWebViewLocalActionStringWebBrowser = @"web_browser";
static NSString *const YDWebViewLocalActionStringRightTitleText = @"rightTitleText";
static NSString *const YDWebViewLocalActionStringDownloadImg = @"download_img";
static NSString *const YDWebViewLocalActionStringDownloadImgBase64 = @"download_img_base_64";
static NSString *const YDWebViewLocalActionStringDownloadImgGetWebImage = @"download_img_get_web_image";
static NSString *const YDWebViewLocalActionStringToLocalVc = @"to_local_vc";
static NSString *const YDWebViewLocalActionStringCloseWindow = @"close_window";
static NSString *const YDWebViewLocalActionStringCloseWindowAll = @"close_window_all";
static NSString *const YDWebViewLocalActionStringReturnToNavRoot = @"return_to_nav_root";
static NSString *const YDWebViewLocalActionStringToLocalApp = @"to_local_app";
static NSString *const YDWebViewLocalActionStringBackbtnMethod = @"backbtn_method";
static NSString *const YDWebViewLocalActionStringPopGestureForbid = @"pop_gesture_forbid";
static NSString *const YDWebViewLocalActionStringAddPhoto = @"add_photo";
static NSString *const YDWebViewLocalActionStringToast = @"toast";
static NSString *const YDWebViewLocalActionStringBackSound = @"back_sound";
static NSString *const YDWebViewLocalActionStringBackLockLightScreenSound = @"back_lock_lightscreen_sound";
static NSString *const YDWebViewLocalActionStringBackLockLightscreenPause = @"back_lock_lightscreen_pause";
static NSString *const YDWebViewLocalActionStringBackLockLightscreenViewLoaded = @"back_lock_lightscreen_viewloaded";
static NSString *const YDWebViewLocalActionStringNativeIntJump = @"native_int_jump";
static NSString *const YDWebViewLocalActionStringYDCalendarAddRemind = @"yd_calendar_add_remind";
static NSString *const YDWebViewLocalActionStringYDCalendarDeleteRemind = @"yd_calendar_delete_remind";
static NSString *const YDWebViewLocalActionStringSetVcTitle = @"set_vc_title";
static NSString *const YDWebViewLocalActionStringShowRightImgBtn = @"show_right_img_btn";
//business
static NSString *const YDWebViewLocalActionStringRequestLocation = @"request_location";
static NSString *const YDWebViewLocalActionStringDrawreward = @"drawreward";
static NSString *const YDWebViewLocalActionStringDrawrewardIOS = @"drawreward_ios";
static NSString *const YDWebViewLocalActionStringLogin = @"login";
static NSString *const YDWebViewLocalActionStringPersoninfo = @"personinfo";
static NSString *const YDWebViewLocalActionStringAccountBind = @"account_bind";
static NSString *const YDWebViewLocalActionStringStartRun = @"start_run";
static NSString *const YDWebViewLocalActionStringInviteFriendCircle = @"invite_friend_circle";
static NSString *const YDWebViewLocalActionStringSportFitness = @"sport_fitness";
static NSString *const YDWebViewLocalActionStringToSharedRide = @"to_shared_ride";
static NSString *const YDWebViewLocalActionStringChat = @"chat";
static NSString *const YDWebViewLocalActionStringBindSuccess = @"bind_success";
static NSString *const YDWebViewLocalActionStringBindFail = @"bind_fail";
static NSString *const YDWebViewLocalActionStringBindParamInvalid = @"bind_param_invalid";
static NSString *const YDWebViewLocalActionStringHealthBack2Today = @"healthBack2Today";
static NSString *const YDWebViewLocalActionStringJump2FootPrint = @"jump2footprint";
static NSString *const YDWebViewLocalActionStringFeed = @"feed";
static NSString *const YDWebViewLocalActionStringBicycleRun = @"bicycle_run";
static NSString *const YDWebViewLocalActionStringFitnessWatermark = @"fitness_watermark";
static NSString *const YDWebViewLocalActionStringWechatRank = @"wechat_rank";
static NSString *const YDWebViewLocalActionStringPushPedometer = @"push_pedometer";
static NSString *const YDWebViewLocalActionStringStartChest = @"start_chest";
static NSString *const YDWebViewLocalActionStringAttend = @"attend";
static NSString *const YDWebViewLocalActionStringToFeedback = @"to_feedback";
static NSString *const YDWebViewLocalActionStringGetMembershipInfo = @"get_membership_info";
static NSString *const YDWebViewLocalActionStringPromptLogin = @"prompt_login";
static NSString *const YDWebViewLocalActionStringShowFeedback = @"show_feedback";
static NSString *const YDWebViewLocalActionStringTheLovingRun = @"the_loving_run";
static NSString *const YDWebViewLocalActionStringShareAIFingerReport = @"share_ai_finger_report";
static NSString *const YDWebViewLocalActionStringGoToMapiHddgoodGame = @"go_to_mapi_hddgood_game";
static NSString *const YDWebViewLocalActionStringPlayRewardVideo = @"play_reward_video";
static NSString *const YDWebViewLocalActionStringOpenPhoneBind = @"open_phone_bind";
static NSString *const YDWebViewLocalActionStringMembershipChanged = @"membership_changed";
static NSString *const YDWebViewLocalActionStringWeekChallengeApply = @"week_challenge_apply";
static NSString *const YDWebViewLocalActionStringRequestTonguePic = @"request_tongue_pic";
static NSString *const YDWebViewLocalActionStringSetNavBarStyle = @"set_nav_bar_style";
//ad
static NSString *const YDWebViewLocalActionStringAdHandleUrl = @"ad_handle_url";
static NSString *const YDWebViewLocalActionStringAdGet = @"ad_get";
static NSString *const YDWebViewLocalActionStringAdStatisticShow = @"ad_statistic_show";
static NSString *const YDWebViewLocalActionStringAdStatisticClick = @"ad_statistic_click";
//pay
static NSString *const YDWebViewLocalActionStringAlipay = @"alipay";
static NSString *const YDWebViewLocalActionStringPay = @"pay";
static NSString *const YDWebViewLocalActionStringIapGetYuedProduct = @"iap_get_yued_product";
static NSString *const YDWebViewLocalActionStringIapBuyYuedProduct = @"iap_buy_yued_product";
static NSString *const YDWebViewLocalActionStringIapValidateLastPay = @"iap_validate_lastPay";
static NSString *const YDWebViewLocalActionStringIapGetProductInfo = @"iap_get_product_info";
static NSString *const YDWebViewLocalActionStringIapBuyProduct = @"iap_buy_product";
static NSString *const YDWebViewLocalActionStringIapValidateCallback = @"iap_validate_callback";
static NSString *const YDWebViewLocalActionStringApplepayUpStartPay = @"applepay_up_start_pay";
static NSString *const YDWebViewLocalActionStringCashPayCallback = @"cash_pay_callback";
static NSString *const YDWebViewLocalActionStringCcbPayOcr = @"ccb_pay_ocr";
static NSString *const YDWebViewLocalActionStringCcbPayFaceVerify = @"ccb_pay_face_verify";
//third
static NSString *const YDWebViewLocalActionStringWechatSubscribeAuth = @"wechat_subscribe_auth";
static NSString *const YDWebViewLocalActionStringOpenWechatMiniProgram = @"open_wechat_mini_program";
static NSString *const YDWebViewLocalActionStringYDAliToDetail = @"yd_ali_to_detail";
static NSString *const YDWebViewLocalActionStringYDAliOauth = @"yd_ali_oauth";
//special
static NSString *const YDWebViewLocalActionStringQrCode = @"qr_code";
static NSString *const YDWebViewLocalActionStringCheckAICMaxCompeteVideo = @"yd_check_aic_max_compete_video";

//action class strings
//common
static NSString *const YDWebViewLocalActionClassStringCommon = @"YDWebViewCommonLocalAction";
//private

//old
//common
static NSString *const YDWebViewLocalActionClassStringShare = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringShareParam = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringShareText = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringReportEvent = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringReportTimeEventStart = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringReportTimeEventEnd = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringReportEventUm = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringReportLogEvent = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringHidePullRefresh = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringOpenUrlInternal = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringOpenUrlNewWindow = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringHideShareBnt = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringShowShareBnt = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringSelectUploadPic = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringPhotographUploadPic = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringPhotographToBase64 = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringBackRefresh = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringOpenUrlBySafari = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringWebBrowser = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringRightTitleText = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringDownloadImg = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringDownloadImgBase64 = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringDownloadImgGetWebImage = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringToLocalVc = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringCloseWindow = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringCloseWindowAll = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringReturnToNavRoot = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringToLocalApp = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringBackbtnMethod = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringPopGestureForbid = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringAddPhoto = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringToast = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringBackSound = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringBackLockLightScreenSound = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringBackLockLightscreenPause = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringBackLockLightscreenViewLoaded = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringNativeIntJump = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringYDCalendarAddRemind = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringYDCalendarDeleteRemind = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringSetVcTitle = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringShowRightImgBtn = @"YDWebViewOldCommonLocalAction";
//business
static NSString *const YDWebViewLocalActionClassStringRequestLocation = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringDrawreward = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringDrawrewardIOS = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringLogin = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringPersoninfo = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringAccountBind = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringStartRun = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringInviteFriendCircle = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringSportFitness = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringToSharedRide = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringChat = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringBindSuccess = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringBindFail = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringBindParamInvalid = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringHealthBack2Today = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringJump2FootPrint = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringFeed = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringBicycleRun = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringFitnessWatermark = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringWechatRank = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringPushPedometer = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringStartChest = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringAttend = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringToFeedback = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringGetMembershipInfo = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringPromptLogin = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringShowFeedback = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringTheLovingRun = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringShareAIFingerReport = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringGoToMapiHddgoodGame = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringPlayRewardVideo = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringOpenPhoneBind  = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringMembershipChanged = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringWeekChallengeApply = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringRequestTonguePic = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringSetNavBarStyle = @"YDWebViewOldCommonLocalAction";
//ad
static NSString *const YDWebViewLocalActionClassStringAdHandleUrl = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringAdGet = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringAdStatisticShow = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringAdStatisticClick = @"YDWebViewOldCommonLocalAction";
//pay
static NSString *const YDWebViewLocalActionClassStringAlipay = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringPay = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringIapGetYuedProduct = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringIapBuyYuedProduct = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringIapValidateLastPay = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringIapGetProductInfo = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringIapBuyProduct = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringIapValidateCallback = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringApplepayUpStartPay = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringCashPayCallback = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringCcbPayOcr = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringCcbPayFaceVerify = @"YDWebViewOldCommonLocalAction";
//third
static NSString *const YDWebViewLocalActionClassStringWechatSubscribeAuth = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringOpenWechatMiniProgram = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringYDAliToDetail = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringYDAliOauth = @"YDWebViewOldCommonLocalAction";
//special
static NSString *const YDWebViewLocalActionClassStringQrCode = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringCheckAICMaxCompeteVideo = @"YDWebViewOldCommonLocalAction";

static NSString *const YDWebViewLocalActionClassStringAICoachPlayVoice = @"YDWebViewOldCommonLocalAction";
static NSString *const YDWebViewLocalActionClassStringAICoachStopPlayVoice = @"YDWebViewOldCommonLocalAction";



//view controller action selector strings
//common
//private

//old
//common
static NSString *const YDWebViewControllerSelectorStringShare = @"localActionShare:";
static NSString *const YDWebViewControllerSelectorStringShareParam = @"localActionShareParam:";
static NSString *const YDWebViewControllerSelectorStringShareText = @"localActionShareText:";
static NSString *const YDWebViewControllerSelectorStringReportEvent = @"localActionReportEvent:";
static NSString *const YDWebViewControllerSelectorStringReportTimeEventStart = @"localActionReportTimeEventStart:";
static NSString *const YDWebViewControllerSelectorStringReportTimeEventEnd = @"localActionReportTimeEventEnd:";
static NSString *const YDWebViewControllerSelectorStringReportEventUm = @"localActionReportEventUm:";
static NSString *const YDWebViewControllerSelectorStringReportLogEvent = @"localActionReportLogEvent:";
static NSString *const YDWebViewControllerSelectorStringHidePullRefresh = @"localActionHidePullRefresh:";
static NSString *const YDWebViewControllerSelectorStringOpenUrlInternal = @"localActionOpenUrlInternal:";
static NSString *const YDWebViewControllerSelectorStringOpenUrlNewWindow = @"localActionOpenUrlNewWindow:";
static NSString *const YDWebViewControllerSelectorStringHideShareBnt = @"localActionHideShareBnt:";
static NSString *const YDWebViewControllerSelectorStringShowShareBnt = @"localActionShowShareBnt:";
static NSString *const YDWebViewControllerSelectorStringSelectUploadPic = @"localActionSelectUploadPic:";
static NSString *const YDWebViewControllerSelectorStringPhotographUploadPic = @"localActionPhotographUploadPic:";
static NSString *const YDWebViewControllerSelectorStringPhotographToBase64 = @"localActionPhotographToBase64:";
static NSString *const YDWebViewControllerSelectorStringBackRefresh = @"localActionBackRefresh:";
static NSString *const YDWebViewControllerSelectorStringOpenUrlBySafari = @"localActionOpenUrlBySafari:";
static NSString *const YDWebViewControllerSelectorStringWebBrowser = @"localActionWebBrowser:";
static NSString *const YDWebViewControllerSelectorStringRightTitleText = @"localActionRightTitleText:";
static NSString *const YDWebViewControllerSelectorStringDownloadImg = @"localActionDownloadImg:";
static NSString *const YDWebViewControllerSelectorStringDownloadImgBase64 = @"localActionDownloadImgBase64:";
static NSString *const YDWebViewControllerSelectorStringDownloadImgGetWebImage = @"localActionDownloadImgGetWebImage:";
static NSString *const YDWebViewControllerSelectorStringToLocalVc = @"localActionToLocalVc:";
static NSString *const YDWebViewControllerSelectorStringCloseWindow = @"localActionCloseWindow:";
static NSString *const YDWebViewControllerSelectorStringCloseWindowAll = @"localActionCloseWindowAll:";
static NSString *const YDWebViewControllerSelectorStringReturnToNavRoot = @"localActionReturnToNavRoot:";
static NSString *const YDWebViewControllerSelectorStringToLocalApp = @"localActionToLocalApp:";
static NSString *const YDWebViewControllerSelectorStringBackbtnMethod = @"localActionBackbtnMethod:";
static NSString *const YDWebViewControllerSelectorStringPopGestureForbid = @"localActionPopGestureForbid:";
static NSString *const YDWebViewControllerSelectorStringAddPhoto = @"localActionAddPhoto:";
static NSString *const YDWebViewControllerSelectorStringToast = @"localActionToast:";
static NSString *const YDWebViewControllerSelectorStringBackSound = @"localActionBackSound:";
static NSString *const YDWebViewControllerSelectorStringBackLockLightScreenSound = @"localActionBackLockLightScreenSound:";
static NSString *const YDWebViewControllerSelectorStringBackLockLightscreenPause = @"localActionBackLockLightscreenPause:";
static NSString *const YDWebViewControllerSelectorStringBackLockLightscreenViewLoaded = @"localActionBackLockLightscreenViewLoaded:";
static NSString *const YDWebViewControllerSelectorStringNativeIntJump = @"localActionNativeIntJump:";
static NSString *const YDWebViewControllerSelectorStringYDCalendarAddRemind = @"localActionYDCalendarAddRemind:";
static NSString *const YDWebViewControllerSelectorStringYDCalendarDeleteRemind = @"localActionYDCalendarDeleteRemind:";
static NSString *const YDWebViewControllerSelectorStringSetVcTitle = @"localActionSetVcTitle:";
static NSString *const YDWebViewControllerSelectorStringShowRightImgBtn = @"localActionShowRightImgBtn:";
//business
static NSString *const YDWebViewControllerSelectorStringRequestLocation = @"localActionRequestLocation:";
static NSString *const YDWebViewControllerSelectorStringDrawreward = @"localActionDrawreward:";
static NSString *const YDWebViewControllerSelectorStringDrawrewardIOS = @"localActionDrawrewardIOS:";
static NSString *const YDWebViewControllerSelectorStringLogin = @"localActionLogin:";
static NSString *const YDWebViewControllerSelectorStringPersoninfo = @"localActionPersoninfo:";
static NSString *const YDWebViewControllerSelectorStringAccountBind = @"localActionAccountBind:";
static NSString *const YDWebViewControllerSelectorStringStartRun = @"localActionStartRun:";
static NSString *const YDWebViewControllerSelectorStringInviteFriendCircle = @"localActionInviteFriendCircle:";
static NSString *const YDWebViewControllerSelectorStringSportFitness = @"localActionSportFitness:";
static NSString *const YDWebViewControllerSelectorStringToSharedRide = @"localActionToSharedRide:";
static NSString *const YDWebViewControllerSelectorStringChat = @"localActionChat:";
static NSString *const YDWebViewControllerSelectorStringBindSuccess = @"localActionBindSuccess:";
static NSString *const YDWebViewControllerSelectorStringBindFail = @"localActionBindFail:";
static NSString *const YDWebViewControllerSelectorStringBindParamInvalid = @"localActionBindParamInvalid:";
static NSString *const YDWebViewControllerSelectorStringHealthBack2Today = @"localActionHealthBack2Today:";
static NSString *const YDWebViewControllerSelectorStringJump2FootPrint = @"localActionJump2FootPrint:";
static NSString *const YDWebViewControllerSelectorStringFeed = @"localActionFeed:";
static NSString *const YDWebViewControllerSelectorStringBicycleRun = @"localActionBicycleRun:";
static NSString *const YDWebViewControllerSelectorStringFitnessWatermark = @"localActionFitnessWatermark:";
static NSString *const YDWebViewControllerSelectorStringWechatRank = @"localActionWechatRank:";
static NSString *const YDWebViewControllerSelectorStringPushPedometer = @"localActionPushPedometer:";
static NSString *const YDWebViewControllerSelectorStringStartChest = @"localActionStartChest:";
static NSString *const YDWebViewControllerSelectorStringAttend = @"localActionAttend:";
static NSString *const YDWebViewControllerSelectorStringToFeedback = @"localActionToFeedback:";
static NSString *const YDWebViewControllerSelectorStringGetMembershipInfo = @"localActionGetMembershipInfo:";
static NSString *const YDWebViewControllerSelectorStringPromptLogin = @"localActionPromptLogin:";
static NSString *const YDWebViewControllerSelectorStringShowFeedback = @"localActionShowFeedback:";
static NSString *const YDWebViewControllerSelectorStringTheLovingRun = @"localActionTheLovingRun:";
static NSString *const YDWebViewControllerSelectorStringShareAIFingerReport = @"localActionShareAIFingerReport:";
static NSString *const YDWebViewControllerSelectorStringGoToMapiHddgoodGame = @"localActionGoToMapiHddgoodGame:";
static NSString *const YDWebViewControllerSelectorStringPlayRewardVideo = @"localActionPlayRewardVideo:";
static NSString *const YDWebViewControllerSelectorStringSetNavBarStyle = @"localActionSetNavBarStyle:";
//ad
static NSString *const YDWebViewControllerSelectorStringAdHandleUrl = @"localActionAdHandleUrl:";
static NSString *const YDWebViewControllerSelectorStringAdGet = @"localActionAdGet:";
static NSString *const YDWebViewControllerSelectorStringAdStatisticShow = @"localActionAdStatisticShow:";
static NSString *const YDWebViewControllerSelectorStringAdStatisticClick = @"localActionAdStatisticClick:";
//pay
static NSString *const YDWebViewControllerSelectorStringAlipay = @"localActionAlipay:";
static NSString *const YDWebViewControllerSelectorStringPay = @"localActionPay:";
static NSString *const YDWebViewControllerSelectorStringIapGetYuedProduct = @"localActionIapGetYuedProduct:";
static NSString *const YDWebViewControllerSelectorStringIapBuyYuedProduct = @"localActionIapBuyYuedProduct:";
static NSString *const YDWebViewControllerSelectorStringIapValidateLastPay = @"localActionIapValidateLastPay:";
static NSString *const YDWebViewControllerSelectorStringIapGetProductInfo = @"localActionIapGetProductInfo:";
static NSString *const YDWebViewControllerSelectorStringIapBuyProduct = @"localActionIapBuyProduct:";
static NSString *const YDWebViewControllerSelectorStringIapValidateCallback = @"localActionIapValidateCallback:";
static NSString *const YDWebViewControllerSelectorStringApplepayUpStartPay = @"localActionApplepayUpStartPay:";
static NSString *const YDWebViewControllerSelectorStringCashPayCallback = @"localActionCashPayCallback:";
static NSString *const YDWebViewControllerSelectorStringCcbPayOcr = @"localActionCcbPayOcr:";
static NSString *const YDWebViewControllerSelectorStringCcbPayFaceVerify = @"localActionCcbPayFaceVerify:";
//third
static NSString *const YDWebViewControllerSelectorStringWechatSubscribeAuth = @"localActionWechatSubscribeAuth:";
static NSString *const YDWebViewControllerSelectorStringOpenWechatMiniProgram = @"localActionOpenWechatMiniProgram:";
static NSString *const YDWebViewControllerSelectorStringYDAliToDetail = @"localActionYDAliToDetail:";
static NSString *const YDWebViewControllerSelectorStringYDAliOauth = @"localActionYDAliOauth:";
//special
static NSString *const YDWebViewControllerSelectorStringQrCode = @"localActionQrCode:";

// aic
static NSString *const YDWebViewControllerSelectorStringAICoachPlayVoice = @"yd_aic_play_voice";
static NSString *const YDWebViewControllerSelectorStringAICoachStopPlayVoice = @"yd_aic_stop_play_voice";

@implementation YDWebViewLocalActionParam {

}

+ (YDWebViewLocalActionID)actionIDOfString:(NSString *)actionString {
    YDWebViewLocalActionID actionID = [self commonActionIDOfString:actionString];
    if (!actionID) {
        actionID = [self privateActionIDOfString:actionString];
    }
    return actionID;
}

+ (YDWebViewLocalAction *)actionOfActionID:(YDWebViewLocalActionID)actionID {
    YDWebViewLocalAction *action = [self commonActionOfActionID:actionID];
    if (!action) {
        action = [self privateActionOfActionID:actionID];
    }
    return action;
}


+ (SEL)VCActionSelectorOfActionID:(YDWebViewLocalActionID)actionID {
    SEL selector = [self commonVCActionSelectorOfActionID:actionID];
    if (!selector) {
        selector = [self privateVCActionSelectorOfActionID:actionID];
    }
    return selector;
}

+ (instancetype)instanceWithID:(YDWebViewLocalActionID)actionId parameters:(id)parameters URLString:(NSString *)urlString {
    YDWebViewLocalActionParam *param = [YDWebViewLocalActionParam new];
    param.actionID = actionId;
    param.parameters = parameters;
    param.URLString = urlString;
    if (urlString) {
        param.URL = [NSURL URLWithString:urlString];
    }
    param.action = [self actionOfActionID:actionId];
    return param;
}

+ (instancetype)instanceWithActionString:(NSString *)actionString parameters:(id)parameters URLString:(NSString *)urlString {
    YDWebViewLocalActionParam *param = [YDWebViewLocalActionParam new];
    param.actionString = actionString;
    param.actionID = [self actionIDOfString:actionString];
    param.parameters = parameters;
    param.URLString = urlString;
    if (urlString) {
        param.URL = [NSURL URLWithString:urlString];
    }
    param.action = [self actionOfActionID:param.actionID];
    return param;
}

+ (instancetype)instanceWithID:(YDWebViewLocalActionID)actionId parameters:(id)parameters {
    YDWebViewLocalActionParam *param = [YDWebViewLocalActionParam new];
    param.actionID = actionId;
    param.parameters = parameters;
    param.action = [self actionOfActionID:actionId];
    return param;
}

+ (instancetype)instanceWithActionString:(NSString *)actionString parameters:(id)parameters {
    YDWebViewLocalActionParam *param = [YDWebViewLocalActionParam new];
    param.actionString = actionString;
    param.actionID = [self actionIDOfString:actionString];
    param.parameters = parameters;
    param.action = [self actionOfActionID:param.actionID];
    return param;
}

+ (YDWebViewLocalActionID)commonActionIDOfString:(NSString *)actionString {

    if (!actionString) {
        return YDWebViewLocalActionIDNone;
    }
    NSNumber *actionID = [self commonActionIDOfString][actionString];
    return (YDWebViewLocalActionID)actionID.unsignedIntegerValue;
}

+ (YDWebViewLocalAction *)commonActionOfActionID:(YDWebViewLocalActionID)actionID {
    NSString *action = self.commonActionOfActionID[@(actionID)];
    if (!action) {
        return nil;
    }
    Class actionClass = NSClassFromString(action);
    if (!actionClass) {
        return nil;
    }
    return (YDWebViewLocalAction *)[actionClass new];
}

+ (SEL)commonVCActionSelectorOfActionID:(YDWebViewLocalActionID)actionID {
    NSString *selectorString = self.commonVCActionSelectorStringOfActionID[@(actionID)];
    if (!selectorString) {
        return nil;
    }
    SEL selector = NSSelectorFromString(selectorString);
    if (!selector) {
        return nil;
    }
    return selector;
}

#pragma mark ----- common settings -----

+ (NSDictionary<NSString *, NSNumber *> *)commonActionIDOfString {
    static NSDictionary<NSString *, NSNumber *> *sActionIDOfString = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sActionIDOfString = @{
            //common
            YDWebViewLocalActionStringGetYodoInfo:@(YDWebViewLocalActionIDGetYodoInfo),
            YDWebViewLocalActionStringConfigWeb:@(YDWebViewLocalActionIDConfigWeb),
            //old
            //common
            YDWebViewLocalActionStringShare:@(YDWebViewLocalActionIDShare),
            YDWebViewLocalActionStringShareParam:@(YDWebViewLocalActionIDShareParam),
            YDWebViewLocalActionStringShareText:@(YDWebViewLocalActionIDShareText),
            YDWebViewLocalActionStringReportEvent:@(YDWebViewLocalActionIDReportEvent),
            YDWebViewLocalActionStringReportTimeEventStart:@(YDWebViewLocalActionIDReportTimeEventStart),
            YDWebViewLocalActionStringReportTimeEventEnd:@(YDWebViewLocalActionIDReportTimeEventEnd),
            YDWebViewLocalActionStringReportEventUm:@(YDWebViewLocalActionIDReportEventUm),
            YDWebViewLocalActionStringReportLogEvent:@(YDWebViewLocalActionIDReportLogEvent),
            YDWebViewLocalActionStringHidePullRefresh:@(YDWebViewLocalActionIDHidePullRefresh),
            YDWebViewLocalActionStringOpenUrlInternal:@(YDWebViewLocalActionIDOpenUrlInternal),
            YDWebViewLocalActionStringOpenUrlNewWindow:@(YDWebViewLocalActionIDOpenUrlNewWindow),
            YDWebViewLocalActionStringHideShareBnt:@(YDWebViewLocalActionIDHideShareBnt),
            YDWebViewLocalActionStringShowShareBnt:@(YDWebViewLocalActionIDShowShareBnt),
            YDWebViewLocalActionStringSelectUploadPic:@(YDWebViewLocalActionIDSelectUploadPic),
            YDWebViewLocalActionStringPhotographUploadPic:@(YDWebViewLocalActionIDPhotographUploadPic),
            YDWebViewLocalActionStringPhotographToBase64:@(YDWebViewLocalActionIDPhotographToBase64),
            YDWebViewLocalActionStringBackRefresh:@(YDWebViewLocalActionIDBackRefresh),
            YDWebViewLocalActionStringOpenUrlBySafari:@(YDWebViewLocalActionIDOpenUrlBySafari),
            YDWebViewLocalActionStringWebBrowser:@(YDWebViewLocalActionIDWebBrowser),
            YDWebViewLocalActionStringRightTitleText:@(YDWebViewLocalActionIDRightTitleText),
            YDWebViewLocalActionStringDownloadImg:@(YDWebViewLocalActionIDDownloadImg),
            YDWebViewLocalActionStringDownloadImgBase64:@(YDWebViewLocalActionIDDownloadImgBase64),
            YDWebViewLocalActionStringDownloadImgGetWebImage:@(YDWebViewLocalActionIDDownloadImgGetWebImage),
            YDWebViewLocalActionStringToLocalVc:@(YDWebViewLocalActionIDToLocalVc),
            YDWebViewLocalActionStringCloseWindow:@(YDWebViewLocalActionIDCloseWindow),
            YDWebViewLocalActionStringCloseWindowAll:@(YDWebViewLocalActionIDCloseWindowAll),
            YDWebViewLocalActionStringReturnToNavRoot:@(YDWebViewLocalActionIDReturnToNavRoot),
            YDWebViewLocalActionStringToLocalApp:@(YDWebViewLocalActionIDToLocalApp),
            YDWebViewLocalActionStringBackbtnMethod:@(YDWebViewLocalActionIDBackbtnMethod),
            YDWebViewLocalActionStringPopGestureForbid:@(YDWebViewLocalActionIDPopGestureForbid),
            YDWebViewLocalActionStringAddPhoto:@(YDWebViewLocalActionIDAddPhoto),
            YDWebViewLocalActionStringToast:@(YDWebViewLocalActionIDToast),
            YDWebViewLocalActionStringBackSound:@(YDWebViewLocalActionIDBackSound),
            YDWebViewLocalActionStringBackLockLightScreenSound:@(YDWebViewLocalActionIDBackLockLightScreenSound),
            YDWebViewLocalActionStringBackLockLightscreenPause:@(YDWebViewLocalActionIDBackLockLightscreenPause),
            YDWebViewLocalActionStringBackLockLightscreenViewLoaded:@(YDWebViewLocalActionIDBackLockLightscreenViewLoaded),
            YDWebViewLocalActionStringNativeIntJump:@(YDWebViewLocalActionIDNativeIntJump),
            YDWebViewLocalActionStringYDCalendarAddRemind:@(YDWebViewLocalActionIDYDCalendarAddRemind),
            YDWebViewLocalActionStringYDCalendarDeleteRemind:@(YDWebViewLocalActionIDYDCalendarDeleteRemind),
            YDWebViewLocalActionStringSetVcTitle:@(YDWebViewLocalActionIDSetVcTitle),
            YDWebViewLocalActionStringShowRightImgBtn:@(YDWebViewLocalActionIDShowRightImgBtn),
            YDWebViewControllerSelectorStringAICoachPlayVoice:@(YDWebViewLocalActionAICoachPlayVoice),
            YDWebViewControllerSelectorStringAICoachStopPlayVoice:@(YDWebViewLocalActionAICoachStopPlayVoice),
            
        };
    });
    return sActionIDOfString;
}

+ (NSDictionary<NSNumber *, NSString *> *)commonActionOfActionID {
    static NSDictionary<NSNumber *, NSString *> *sActionOfActionID = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sActionOfActionID = @{
            //common
            @(YDWebViewLocalActionIDGetYodoInfo):YDWebViewLocalActionClassStringCommon,
            @(YDWebViewLocalActionIDConfigWeb):YDWebViewLocalActionClassStringCommon,
            //old
            @(YDWebViewLocalActionIDShare):YDWebViewLocalActionClassStringShare,
            @(YDWebViewLocalActionIDShareParam):YDWebViewLocalActionClassStringShareParam,
            @(YDWebViewLocalActionIDShareText):YDWebViewLocalActionClassStringShareText,
            @(YDWebViewLocalActionIDReportEvent):YDWebViewLocalActionClassStringReportEvent,
            @(YDWebViewLocalActionIDReportTimeEventStart):YDWebViewLocalActionClassStringReportTimeEventStart,
            @(YDWebViewLocalActionIDReportTimeEventEnd):YDWebViewLocalActionClassStringReportTimeEventEnd,
            @(YDWebViewLocalActionIDReportEventUm):YDWebViewLocalActionClassStringReportEventUm,
            @(YDWebViewLocalActionIDReportLogEvent):YDWebViewLocalActionClassStringReportLogEvent,
            @(YDWebViewLocalActionIDHidePullRefresh):YDWebViewLocalActionClassStringHidePullRefresh,
            @(YDWebViewLocalActionIDOpenUrlInternal):YDWebViewLocalActionClassStringOpenUrlInternal,
            @(YDWebViewLocalActionIDOpenUrlNewWindow):YDWebViewLocalActionClassStringOpenUrlNewWindow,
            @(YDWebViewLocalActionIDHideShareBnt):YDWebViewLocalActionClassStringHideShareBnt,
            @(YDWebViewLocalActionIDShowShareBnt):YDWebViewLocalActionClassStringShowShareBnt,
            @(YDWebViewLocalActionIDSelectUploadPic):YDWebViewLocalActionClassStringSelectUploadPic,
            @(YDWebViewLocalActionIDPhotographUploadPic):YDWebViewLocalActionClassStringPhotographUploadPic,
            @(YDWebViewLocalActionIDPhotographToBase64):YDWebViewLocalActionClassStringPhotographToBase64,
            @(YDWebViewLocalActionIDBackRefresh):YDWebViewLocalActionClassStringBackRefresh,
            @(YDWebViewLocalActionIDOpenUrlBySafari):YDWebViewLocalActionClassStringOpenUrlBySafari,
            @(YDWebViewLocalActionIDWebBrowser):YDWebViewLocalActionClassStringWebBrowser,
            @(YDWebViewLocalActionIDRightTitleText):YDWebViewLocalActionClassStringRightTitleText,
            @(YDWebViewLocalActionIDDownloadImg):YDWebViewLocalActionClassStringDownloadImg,
            @(YDWebViewLocalActionIDDownloadImgBase64):YDWebViewLocalActionClassStringDownloadImgBase64,
            @(YDWebViewLocalActionIDDownloadImgGetWebImage):YDWebViewLocalActionClassStringDownloadImgGetWebImage,
            @(YDWebViewLocalActionIDToLocalVc):YDWebViewLocalActionClassStringToLocalVc,
            @(YDWebViewLocalActionIDCloseWindow):YDWebViewLocalActionClassStringCloseWindow,
            @(YDWebViewLocalActionIDCloseWindowAll):YDWebViewLocalActionClassStringCloseWindowAll,
            @(YDWebViewLocalActionIDReturnToNavRoot):YDWebViewLocalActionClassStringReturnToNavRoot,
            @(YDWebViewLocalActionIDToLocalApp):YDWebViewLocalActionClassStringToLocalApp,
            @(YDWebViewLocalActionIDBackbtnMethod):YDWebViewLocalActionClassStringBackbtnMethod,
            @(YDWebViewLocalActionIDPopGestureForbid):YDWebViewLocalActionClassStringPopGestureForbid,
            @(YDWebViewLocalActionIDAddPhoto):YDWebViewLocalActionClassStringAddPhoto,
            @(YDWebViewLocalActionIDToast):YDWebViewLocalActionClassStringToast,
            @(YDWebViewLocalActionIDBackSound):YDWebViewLocalActionClassStringBackSound,
            @(YDWebViewLocalActionIDBackLockLightScreenSound):YDWebViewLocalActionClassStringBackLockLightScreenSound,
            @(YDWebViewLocalActionIDBackLockLightscreenPause):YDWebViewLocalActionClassStringBackLockLightscreenPause,
            @(YDWebViewLocalActionIDBackLockLightscreenViewLoaded):YDWebViewLocalActionClassStringBackLockLightscreenViewLoaded,
            @(YDWebViewLocalActionIDNativeIntJump):YDWebViewLocalActionClassStringNativeIntJump,
            @(YDWebViewLocalActionIDYDCalendarAddRemind):YDWebViewLocalActionClassStringYDCalendarAddRemind,
            @(YDWebViewLocalActionIDYDCalendarDeleteRemind):YDWebViewLocalActionClassStringYDCalendarDeleteRemind,
            @(YDWebViewLocalActionIDSetVcTitle):YDWebViewLocalActionClassStringSetVcTitle,
            @(YDWebViewLocalActionIDShowRightImgBtn):YDWebViewLocalActionClassStringShowRightImgBtn,
            @(YDWebViewLocalActionAICoachPlayVoice):YDWebViewLocalActionClassStringAICoachPlayVoice,
            @(YDWebViewLocalActionAICoachStopPlayVoice):YDWebViewLocalActionClassStringAICoachStopPlayVoice,
        };
    });
    return sActionOfActionID;
}

+ (NSDictionary<NSNumber *, NSString *> *)commonVCActionSelectorStringOfActionID {
    static NSDictionary<NSNumber *, NSString *> *sVCActionSelectorStringOfActionID = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sVCActionSelectorStringOfActionID = @{
            //old
            @(YDWebViewLocalActionIDShare):YDWebViewControllerSelectorStringShare,
            @(YDWebViewLocalActionIDShareParam):YDWebViewControllerSelectorStringShareParam,
            @(YDWebViewLocalActionIDShareText):YDWebViewControllerSelectorStringShareText,
            @(YDWebViewLocalActionIDReportEvent):YDWebViewControllerSelectorStringReportEvent,
            @(YDWebViewLocalActionIDReportTimeEventStart):YDWebViewControllerSelectorStringReportTimeEventStart,
            @(YDWebViewLocalActionIDReportTimeEventEnd):YDWebViewControllerSelectorStringReportTimeEventEnd,
            @(YDWebViewLocalActionIDReportEventUm):YDWebViewControllerSelectorStringReportEventUm,
            @(YDWebViewLocalActionIDReportLogEvent):YDWebViewControllerSelectorStringReportLogEvent,
            @(YDWebViewLocalActionIDHidePullRefresh):YDWebViewControllerSelectorStringHidePullRefresh,
            @(YDWebViewLocalActionIDOpenUrlInternal):YDWebViewControllerSelectorStringOpenUrlInternal,
            @(YDWebViewLocalActionIDOpenUrlNewWindow):YDWebViewControllerSelectorStringOpenUrlNewWindow,
            @(YDWebViewLocalActionIDHideShareBnt):YDWebViewControllerSelectorStringHideShareBnt,
            @(YDWebViewLocalActionIDShowShareBnt):YDWebViewControllerSelectorStringShowShareBnt,
            @(YDWebViewLocalActionIDSelectUploadPic):YDWebViewControllerSelectorStringSelectUploadPic,
            @(YDWebViewLocalActionIDPhotographUploadPic):YDWebViewControllerSelectorStringPhotographUploadPic,
            @(YDWebViewLocalActionIDPhotographToBase64):YDWebViewControllerSelectorStringPhotographToBase64,
            @(YDWebViewLocalActionIDBackRefresh):YDWebViewControllerSelectorStringBackRefresh,
            @(YDWebViewLocalActionIDOpenUrlBySafari):YDWebViewControllerSelectorStringOpenUrlBySafari,
            @(YDWebViewLocalActionIDWebBrowser):YDWebViewControllerSelectorStringWebBrowser,
            @(YDWebViewLocalActionIDRightTitleText):YDWebViewControllerSelectorStringRightTitleText,
            @(YDWebViewLocalActionIDDownloadImg):YDWebViewControllerSelectorStringDownloadImg,
            @(YDWebViewLocalActionIDDownloadImgBase64):YDWebViewControllerSelectorStringDownloadImgBase64,
            @(YDWebViewLocalActionIDDownloadImgGetWebImage):YDWebViewControllerSelectorStringDownloadImgGetWebImage,
            @(YDWebViewLocalActionIDToLocalVc):YDWebViewControllerSelectorStringToLocalVc,
            @(YDWebViewLocalActionIDCloseWindow):YDWebViewControllerSelectorStringCloseWindow,
            @(YDWebViewLocalActionIDCloseWindowAll):YDWebViewControllerSelectorStringCloseWindowAll,
            @(YDWebViewLocalActionIDReturnToNavRoot):YDWebViewControllerSelectorStringReturnToNavRoot,
            @(YDWebViewLocalActionIDToLocalApp):YDWebViewControllerSelectorStringToLocalApp,
            @(YDWebViewLocalActionIDBackbtnMethod):YDWebViewControllerSelectorStringBackbtnMethod,
            @(YDWebViewLocalActionIDPopGestureForbid):YDWebViewControllerSelectorStringPopGestureForbid,
            @(YDWebViewLocalActionIDAddPhoto):YDWebViewControllerSelectorStringAddPhoto,
            @(YDWebViewLocalActionIDToast):YDWebViewControllerSelectorStringToast,
            @(YDWebViewLocalActionIDBackSound):YDWebViewControllerSelectorStringBackSound,
            @(YDWebViewLocalActionIDBackLockLightScreenSound):YDWebViewControllerSelectorStringBackLockLightScreenSound,
            @(YDWebViewLocalActionIDBackLockLightscreenPause):YDWebViewControllerSelectorStringBackLockLightscreenPause,
            @(YDWebViewLocalActionIDBackLockLightscreenViewLoaded):YDWebViewControllerSelectorStringBackLockLightscreenViewLoaded,
            @(YDWebViewLocalActionIDNativeIntJump):YDWebViewControllerSelectorStringNativeIntJump,
            @(YDWebViewLocalActionIDYDCalendarAddRemind):YDWebViewControllerSelectorStringYDCalendarAddRemind,
            @(YDWebViewLocalActionIDYDCalendarDeleteRemind):YDWebViewControllerSelectorStringYDCalendarDeleteRemind,
            @(YDWebViewLocalActionIDSetVcTitle):YDWebViewControllerSelectorStringSetVcTitle,
            @(YDWebViewLocalActionIDShowRightImgBtn):YDWebViewControllerSelectorStringShowRightImgBtn,
        };
    });
    return sVCActionSelectorStringOfActionID;
}

#pragma mark ----- private settings -----

+ (NSDictionary<NSString *, NSNumber *> *)privateActionIDOfString {
    static NSDictionary<NSString *, NSNumber *> *sActionIDOfString = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sActionIDOfString = @{
            //old
            //business
            YDWebViewLocalActionStringRequestLocation:@(YDWebViewLocalActionIDRequestLocation),
            YDWebViewLocalActionStringDrawreward:@(YDWebViewLocalActionIDDrawreward),
            YDWebViewLocalActionStringDrawrewardIOS:@(YDWebViewLocalActionIDDrawrewardIOS),
            YDWebViewLocalActionStringLogin:@(YDWebViewLocalActionIDLogin),
            YDWebViewLocalActionStringPersoninfo:@(YDWebViewLocalActionIDPersoninfo),
            YDWebViewLocalActionStringAccountBind:@(YDWebViewLocalActionIDAccountBind),
            YDWebViewLocalActionStringStartRun:@(YDWebViewLocalActionIDStartRun),
            YDWebViewLocalActionStringInviteFriendCircle:@(YDWebViewLocalActionIDInviteFriendCircle),
            YDWebViewLocalActionStringSportFitness:@(YDWebViewLocalActionIDSportFitness),
            YDWebViewLocalActionStringToSharedRide:@(YDWebViewLocalActionIDToSharedRide),
            YDWebViewLocalActionStringChat:@(YDWebViewLocalActionIDChat),
            YDWebViewLocalActionStringBindSuccess:@(YDWebViewLocalActionIDBindSuccess),
            YDWebViewLocalActionStringBindFail:@(YDWebViewLocalActionIDBindFail),
            YDWebViewLocalActionStringBindParamInvalid:@(YDWebViewLocalActionIDBindParamInvalid),
            YDWebViewLocalActionStringHealthBack2Today:@(YDWebViewLocalActionIDHealthBack2Today),
            YDWebViewLocalActionStringJump2FootPrint:@(YDWebViewLocalActionIDJump2FootPrint),
            YDWebViewLocalActionStringFeed:@(YDWebViewLocalActionIDFeed),
            YDWebViewLocalActionStringBicycleRun:@(YDWebViewLocalActionIDBicycleRun),
            YDWebViewLocalActionStringFitnessWatermark:@(YDWebViewLocalActionIDFitnessWatermark),
            YDWebViewLocalActionStringWechatRank:@(YDWebViewLocalActionIDWechatRank),
            YDWebViewLocalActionStringPushPedometer:@(YDWebViewLocalActionIDPushPedometer),
            YDWebViewLocalActionStringStartChest:@(YDWebViewLocalActionIDStartChest),
            YDWebViewLocalActionStringAttend:@(YDWebViewLocalActionIDAttend),
            YDWebViewLocalActionStringToFeedback:@(YDWebViewLocalActionIDToFeedback),
            YDWebViewLocalActionStringGetMembershipInfo:@(YDWebViewLocalActionIDGetMembershipInfo),
            YDWebViewLocalActionStringPromptLogin:@(YDWebViewLocalActionIDPromptLogin),
            YDWebViewLocalActionStringShowFeedback:@(YDWebViewLocalActionIDShowFeedback),
            YDWebViewLocalActionStringTheLovingRun:@(YDWebViewLocalActionIDTheLovingRun),
            YDWebViewLocalActionStringShareAIFingerReport:@(YDWebViewLocalActionIDShareAIFingerReport),
            YDWebViewLocalActionStringGoToMapiHddgoodGame:@(YDWebViewLocalActionIDGoToMapiHddgoodGame),
            YDWebViewLocalActionStringPlayRewardVideo:@(YDWebViewLocalActionIDPlayRewardVideo),
            YDWebViewLocalActionStringOpenPhoneBind:@(YDWebViewLocalActionIDOpenPhoneBind),
            YDWebViewLocalActionStringMembershipChanged:@(YDWebViewLocalActionIDMembershipChanged),
            YDWebViewLocalActionStringWeekChallengeApply:@(YDWebViewLocalActionIDWeekChallengeApply),
            YDWebViewLocalActionStringRequestTonguePic:@(YDWebViewLocalActionIDRequestTonguePic),
            YDWebViewLocalActionStringSetNavBarStyle:@(YDWebViewLocalActionIDSetNavBarStyle),
            //ad
            YDWebViewLocalActionStringAdHandleUrl:@(YDWebViewLocalActionIDAdHandleUrl),
            YDWebViewLocalActionStringAdGet:@(YDWebViewLocalActionIDAdGet),
            YDWebViewLocalActionStringAdStatisticShow:@(YDWebViewLocalActionIDAdStatisticShow),
            YDWebViewLocalActionStringAdStatisticClick:@(YDWebViewLocalActionIDAdStatisticClick),
            //pay
            YDWebViewLocalActionStringAlipay:@(YDWebViewLocalActionIDAlipay),
            YDWebViewLocalActionStringPay:@(YDWebViewLocalActionIDPay),
            YDWebViewLocalActionStringIapGetYuedProduct:@(YDWebViewLocalActionIDIapGetYuedProduct),
            YDWebViewLocalActionStringIapBuyYuedProduct:@(YDWebViewLocalActionIDIapBuyYuedProduct),
            YDWebViewLocalActionStringIapValidateLastPay:@(YDWebViewLocalActionIDIapValidateLastPay),
            YDWebViewLocalActionStringIapGetProductInfo:@(YDWebViewLocalActionIDIapGetProductInfo),
            YDWebViewLocalActionStringIapBuyProduct:@(YDWebViewLocalActionIDIapBuyProduct),
            YDWebViewLocalActionStringIapValidateCallback:@(YDWebViewLocalActionIDIapValidateCallback),
            YDWebViewLocalActionStringApplepayUpStartPay:@(YDWebViewLocalActionIDApplepayUpStartPay),
            YDWebViewLocalActionStringCashPayCallback:@(YDWebViewLocalActionIDCashPayCallback),
            YDWebViewLocalActionStringCcbPayOcr:@(YDWebViewLocalActionIDCcbPayOcr),
            YDWebViewLocalActionStringCcbPayFaceVerify:@(YDWebViewLocalActionIDCcbPayFaceVerify),
            //third
            YDWebViewLocalActionStringWechatSubscribeAuth:@(YDWebViewLocalActionIDWechatSubscribeAuth),
            YDWebViewLocalActionStringOpenWechatMiniProgram:@(YDWebViewLocalActionIDOpenWechatMiniProgram),
            YDWebViewLocalActionStringYDAliToDetail:@(YDWebViewLocalActionIDYDAliToDetail),
            YDWebViewLocalActionStringYDAliOauth:@(YDWebViewLocalActionIDYDAliOauth),
            //special
            YDWebViewLocalActionStringQrCode:@(YDWebViewLocalActionIDQrCode),
            YDWebViewLocalActionStringCheckAICMaxCompeteVideo:@(YDWebViewLocalActionIDCheckAICMaxCompeteVideo)
        };
    });
    return sActionIDOfString;
}

+ (NSDictionary<NSNumber *, NSString *> *)privateActionOfActionID {
    static NSDictionary<NSNumber *, NSString *> *sActionOfActionID = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sActionOfActionID = @{
            //old
            //business
            @(YDWebViewLocalActionIDRequestLocation):YDWebViewLocalActionClassStringRequestLocation,
            @(YDWebViewLocalActionIDDrawreward):YDWebViewLocalActionClassStringDrawreward,
            @(YDWebViewLocalActionIDDrawrewardIOS):YDWebViewLocalActionClassStringDrawrewardIOS,
            @(YDWebViewLocalActionIDLogin):YDWebViewLocalActionClassStringLogin,
            @(YDWebViewLocalActionIDPersoninfo):YDWebViewLocalActionClassStringPersoninfo,
            @(YDWebViewLocalActionIDAccountBind):YDWebViewLocalActionClassStringAccountBind,
            @(YDWebViewLocalActionIDStartRun):YDWebViewLocalActionClassStringStartRun,
            @(YDWebViewLocalActionIDInviteFriendCircle):YDWebViewLocalActionClassStringInviteFriendCircle,
            @(YDWebViewLocalActionIDSportFitness):YDWebViewLocalActionClassStringSportFitness,
            @(YDWebViewLocalActionIDToSharedRide):YDWebViewLocalActionClassStringToSharedRide,
            @(YDWebViewLocalActionIDChat):YDWebViewLocalActionClassStringChat,
            @(YDWebViewLocalActionIDBindSuccess):YDWebViewLocalActionClassStringBindSuccess,
            @(YDWebViewLocalActionIDBindFail):YDWebViewLocalActionClassStringBindFail,
            @(YDWebViewLocalActionIDBindParamInvalid):YDWebViewLocalActionClassStringBindParamInvalid,
            @(YDWebViewLocalActionIDHealthBack2Today):YDWebViewLocalActionClassStringHealthBack2Today,
            @(YDWebViewLocalActionIDJump2FootPrint):YDWebViewLocalActionClassStringJump2FootPrint,
            @(YDWebViewLocalActionIDFeed):YDWebViewLocalActionClassStringFeed,
            @(YDWebViewLocalActionIDBicycleRun):YDWebViewLocalActionClassStringBicycleRun,
            @(YDWebViewLocalActionIDFitnessWatermark):YDWebViewLocalActionClassStringFitnessWatermark,
            @(YDWebViewLocalActionIDWechatRank):YDWebViewLocalActionClassStringWechatRank,
            @(YDWebViewLocalActionIDPushPedometer):YDWebViewLocalActionClassStringPushPedometer,
            @(YDWebViewLocalActionIDStartChest):YDWebViewLocalActionClassStringStartChest,
            @(YDWebViewLocalActionIDAttend):YDWebViewLocalActionClassStringAttend,
            @(YDWebViewLocalActionIDToFeedback):YDWebViewLocalActionClassStringToFeedback,
            @(YDWebViewLocalActionIDGetMembershipInfo):YDWebViewLocalActionClassStringGetMembershipInfo,
            @(YDWebViewLocalActionIDPromptLogin):YDWebViewLocalActionClassStringPromptLogin,
            @(YDWebViewLocalActionIDShowFeedback):YDWebViewLocalActionClassStringShowFeedback,
            @(YDWebViewLocalActionIDTheLovingRun):YDWebViewLocalActionClassStringTheLovingRun,
            @(YDWebViewLocalActionIDShareAIFingerReport):YDWebViewLocalActionClassStringShareAIFingerReport,
            @(YDWebViewLocalActionIDGoToMapiHddgoodGame):YDWebViewLocalActionClassStringGoToMapiHddgoodGame,
            @(YDWebViewLocalActionIDPlayRewardVideo):YDWebViewLocalActionClassStringPlayRewardVideo,
            @(YDWebViewLocalActionIDOpenPhoneBind):YDWebViewLocalActionClassStringOpenPhoneBind,
            @(YDWebViewLocalActionIDMembershipChanged):YDWebViewLocalActionClassStringMembershipChanged,
            @(YDWebViewLocalActionIDWeekChallengeApply):YDWebViewLocalActionClassStringWeekChallengeApply,
            @(YDWebViewLocalActionIDRequestTonguePic):YDWebViewLocalActionClassStringRequestTonguePic,
            @(YDWebViewLocalActionIDSetNavBarStyle):YDWebViewLocalActionClassStringSetNavBarStyle,
            //ad
            @(YDWebViewLocalActionIDAdHandleUrl):YDWebViewLocalActionClassStringAdHandleUrl,
            @(YDWebViewLocalActionIDAdGet):YDWebViewLocalActionClassStringAdGet,
            @(YDWebViewLocalActionIDAdStatisticShow):YDWebViewLocalActionClassStringAdStatisticShow,
            @(YDWebViewLocalActionIDAdStatisticClick):YDWebViewLocalActionClassStringAdStatisticClick,
            //pay
            @(YDWebViewLocalActionIDAlipay):YDWebViewLocalActionClassStringAlipay,
            @(YDWebViewLocalActionIDPay):YDWebViewLocalActionClassStringPay,
            @(YDWebViewLocalActionIDIapGetYuedProduct):YDWebViewLocalActionClassStringIapGetYuedProduct,
            @(YDWebViewLocalActionIDIapBuyYuedProduct):YDWebViewLocalActionClassStringIapBuyYuedProduct,
            @(YDWebViewLocalActionIDIapValidateLastPay):YDWebViewLocalActionClassStringIapValidateLastPay,
            @(YDWebViewLocalActionIDIapGetProductInfo):YDWebViewLocalActionClassStringIapGetProductInfo,
            @(YDWebViewLocalActionIDIapBuyProduct):YDWebViewLocalActionClassStringIapBuyProduct,
            @(YDWebViewLocalActionIDIapValidateCallback):YDWebViewLocalActionClassStringIapValidateCallback,
            @(YDWebViewLocalActionIDApplepayUpStartPay):YDWebViewLocalActionClassStringApplepayUpStartPay,
            @(YDWebViewLocalActionIDCashPayCallback):YDWebViewLocalActionClassStringCashPayCallback,
            @(YDWebViewLocalActionIDCcbPayOcr):YDWebViewLocalActionClassStringCcbPayOcr,
            @(YDWebViewLocalActionIDCcbPayFaceVerify):YDWebViewLocalActionClassStringCcbPayFaceVerify,
            //third
            @(YDWebViewLocalActionIDWechatSubscribeAuth):YDWebViewLocalActionClassStringWechatSubscribeAuth,
            @(YDWebViewLocalActionIDOpenWechatMiniProgram):YDWebViewLocalActionClassStringOpenWechatMiniProgram,
            @(YDWebViewLocalActionIDYDAliToDetail):YDWebViewLocalActionClassStringYDAliToDetail,
            @(YDWebViewLocalActionIDYDAliOauth):YDWebViewLocalActionClassStringYDAliOauth,
            //special
            @(YDWebViewLocalActionIDQrCode):YDWebViewLocalActionClassStringQrCode,
            @(YDWebViewLocalActionIDCheckAICMaxCompeteVideo):YDWebViewLocalActionClassStringCheckAICMaxCompeteVideo,
        };
    });
    return sActionOfActionID;
}

+ (NSDictionary<NSNumber *, NSString *> *)privateVCActionSelectorStringOfActionID {
    static NSDictionary<NSNumber *, NSString *> *sVCActionSelectorStringOfActionID = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sVCActionSelectorStringOfActionID = @{
            //old
            //business
            @(YDWebViewLocalActionIDRequestLocation):YDWebViewControllerSelectorStringRequestLocation,
            @(YDWebViewLocalActionIDDrawreward):YDWebViewControllerSelectorStringDrawreward,
            @(YDWebViewLocalActionIDDrawrewardIOS):YDWebViewControllerSelectorStringDrawrewardIOS,
            @(YDWebViewLocalActionIDLogin):YDWebViewControllerSelectorStringLogin,
            @(YDWebViewLocalActionIDPersoninfo):YDWebViewControllerSelectorStringPersoninfo,
            @(YDWebViewLocalActionIDAccountBind):YDWebViewControllerSelectorStringAccountBind,
            @(YDWebViewLocalActionIDStartRun):YDWebViewControllerSelectorStringStartRun,
            @(YDWebViewLocalActionIDInviteFriendCircle):YDWebViewControllerSelectorStringInviteFriendCircle,
            @(YDWebViewLocalActionIDSportFitness):YDWebViewControllerSelectorStringSportFitness,
            @(YDWebViewLocalActionIDToSharedRide):YDWebViewControllerSelectorStringToSharedRide,
            @(YDWebViewLocalActionIDChat):YDWebViewControllerSelectorStringChat,
            @(YDWebViewLocalActionIDBindSuccess):YDWebViewControllerSelectorStringBindSuccess,
            @(YDWebViewLocalActionIDBindFail):YDWebViewControllerSelectorStringBindFail,
            @(YDWebViewLocalActionIDBindParamInvalid):YDWebViewControllerSelectorStringBindParamInvalid,
            @(YDWebViewLocalActionIDHealthBack2Today):YDWebViewControllerSelectorStringHealthBack2Today,
            @(YDWebViewLocalActionIDJump2FootPrint):YDWebViewControllerSelectorStringJump2FootPrint,
            @(YDWebViewLocalActionIDFeed):YDWebViewControllerSelectorStringFeed,
            @(YDWebViewLocalActionIDBicycleRun):YDWebViewControllerSelectorStringBicycleRun,
            @(YDWebViewLocalActionIDFitnessWatermark):YDWebViewControllerSelectorStringFitnessWatermark,
            @(YDWebViewLocalActionIDWechatRank):YDWebViewControllerSelectorStringWechatRank,
            @(YDWebViewLocalActionIDPushPedometer):YDWebViewControllerSelectorStringPushPedometer,
            @(YDWebViewLocalActionIDStartChest):YDWebViewControllerSelectorStringStartChest,
            @(YDWebViewLocalActionIDAttend):YDWebViewControllerSelectorStringAttend,
            @(YDWebViewLocalActionIDToFeedback):YDWebViewControllerSelectorStringToFeedback,
            @(YDWebViewLocalActionIDGetMembershipInfo):YDWebViewControllerSelectorStringGetMembershipInfo,
            @(YDWebViewLocalActionIDPromptLogin):YDWebViewControllerSelectorStringPromptLogin,
            @(YDWebViewLocalActionIDShowFeedback):YDWebViewControllerSelectorStringShowFeedback,
            @(YDWebViewLocalActionIDTheLovingRun):YDWebViewControllerSelectorStringTheLovingRun,
            @(YDWebViewLocalActionIDShareAIFingerReport):YDWebViewControllerSelectorStringShareAIFingerReport,
            @(YDWebViewLocalActionIDGoToMapiHddgoodGame):YDWebViewControllerSelectorStringGoToMapiHddgoodGame,
            @(YDWebViewLocalActionIDPlayRewardVideo):YDWebViewControllerSelectorStringPlayRewardVideo,
            @(YDWebViewLocalActionIDSetNavBarStyle):YDWebViewControllerSelectorStringSetNavBarStyle,
            //ad
            @(YDWebViewLocalActionIDAdHandleUrl):YDWebViewControllerSelectorStringAdHandleUrl,
            @(YDWebViewLocalActionIDAdGet):YDWebViewControllerSelectorStringAdGet,
            @(YDWebViewLocalActionIDAdStatisticShow):YDWebViewControllerSelectorStringAdStatisticShow,
            @(YDWebViewLocalActionIDAdStatisticClick):YDWebViewControllerSelectorStringAdStatisticClick,
            //pay
            @(YDWebViewLocalActionIDAlipay):YDWebViewControllerSelectorStringAlipay,
            @(YDWebViewLocalActionIDPay):YDWebViewControllerSelectorStringPay,
            @(YDWebViewLocalActionIDIapGetYuedProduct):YDWebViewControllerSelectorStringIapGetYuedProduct,
            @(YDWebViewLocalActionIDIapBuyYuedProduct):YDWebViewControllerSelectorStringIapBuyYuedProduct,
            @(YDWebViewLocalActionIDIapValidateLastPay):YDWebViewControllerSelectorStringIapValidateLastPay,
            @(YDWebViewLocalActionIDIapGetProductInfo):YDWebViewControllerSelectorStringIapGetProductInfo,
            @(YDWebViewLocalActionIDIapBuyProduct):YDWebViewControllerSelectorStringIapBuyProduct,
            @(YDWebViewLocalActionIDIapValidateCallback):YDWebViewControllerSelectorStringIapValidateCallback,
            @(YDWebViewLocalActionIDApplepayUpStartPay):YDWebViewControllerSelectorStringApplepayUpStartPay,
            @(YDWebViewLocalActionIDCashPayCallback):YDWebViewControllerSelectorStringCashPayCallback,
            @(YDWebViewLocalActionIDCcbPayOcr):YDWebViewControllerSelectorStringCcbPayOcr,
            @(YDWebViewLocalActionIDCcbPayFaceVerify):YDWebViewControllerSelectorStringCcbPayFaceVerify,
            //third
            @(YDWebViewLocalActionIDWechatSubscribeAuth):YDWebViewControllerSelectorStringWechatSubscribeAuth,
            @(YDWebViewLocalActionIDOpenWechatMiniProgram):YDWebViewControllerSelectorStringOpenWechatMiniProgram,
            @(YDWebViewLocalActionIDYDAliToDetail):YDWebViewControllerSelectorStringYDAliToDetail,
            @(YDWebViewLocalActionIDYDAliOauth):YDWebViewControllerSelectorStringYDAliOauth,
            //special
            @(YDWebViewLocalActionIDQrCode):YDWebViewControllerSelectorStringQrCode,
        };
    });
    return sVCActionSelectorStringOfActionID;
}

#pragma mark ---------------------------

+ (YDWebViewLocalActionID)privateActionIDOfString:(NSString *)actionString {
    if (!actionString) {
        return YDWebViewLocalActionIDNone;
    }
    NSNumber *actionID = [self privateActionIDOfString][actionString];
    return (YDWebViewLocalActionID)actionID.unsignedIntegerValue;
}

+ (YDWebViewLocalAction *)privateActionOfActionID:(YDWebViewLocalActionID)actionID {
    NSString *action = self.privateActionOfActionID[@(actionID)];
    if (!action) {
        return nil;
    }
    Class actionClass = NSClassFromString(action);
    if (!actionClass) {
        return nil;
    }
    return (YDWebViewLocalAction *)[actionClass new];
}

+ (SEL)privateVCActionSelectorOfActionID:(YDWebViewLocalActionID)actionId {
    NSString *selectorString = self.privateVCActionSelectorStringOfActionID[@(actionId)];
    if (!selectorString) {
        return nil;
    }
    SEL selector = NSSelectorFromString(selectorString);
    if (!selector) {
        return nil;
    }
    return selector;
}

+ (SEL)allVCActionSelectorOfActionID:(YDWebViewLocalActionID)actionID {
    SEL selector = [self commonVCActionSelectorOfActionID:actionID];
    if (selector) {
        return selector;
    }
    selector = [self privateVCActionSelectorOfActionID:actionID];
    return selector;
}

- (void)setService:(YDWebService *)service {
    _service = service;
    _webViewController = service.webViewController;
    _store = service.store;
}


@end
