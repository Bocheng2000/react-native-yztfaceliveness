#import "RNYztfaceliveness.h"
#import "AppDelegate.h"
#import "SVProgressHUD.h"

@implementation RNYztfaceliveness
{
  BOOL hasListeners;
}

RCT_EXPORT_MODULE();

- (NSArray<NSString *> *)supportedEvents
{
  return @[@"beginFaceLiveResult"];
}

RCT_EXPORT_METHOD(beginFaceLive:(NSString *)authToken)
{
  LivingConfigModel *model = [LivingConfigModel sharedInstance];
  
  model.isByOrder = YES;
  
  model.liveActionArray = [NSMutableArray arrayWithArray:@[@1,@2]];
  
  model.numOfLiveness = 2;
  
  model.token = authToken;
  
  dispatch_async(dispatch_get_main_queue(), ^{
    dispatch_async(dispatch_get_main_queue(), ^{
      AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
      UnitidVerificatedViewController *vertificateVC = [[UnitidVerificatedViewController alloc] init];
      vertificateVC.delegate = self;
      [app.nav.viewControllers[0].navigationController setNavigationBarHidden:NO animated:NO];
      [app.nav pushViewController:vertificateVC animated:YES];
    });
  });
}

#pragma mark - 活体检测代理方法
/*
 * 认证结果返回
 */
- (void)hyLivenessDetectionControllerDidGetResult:(SpiderIDResultCode)result{
  if (hasListeners) {
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [app.nav.viewControllers[0].navigationController setNavigationBarHidden:YES animated:NO];
    [self sendEventWithName:@"beginFaceLiveResult" body:@{@"code":@(result)}];
  }
  //    if (result == SpiderIDCodeOK) {
  //        [SVProgressHUD showSuccessWithStatus:@"核验成功"];
  //
  //    }else if (result == SpiderIDCodeMANUAL_AUDIT){
  //        [SVProgressHUD showSuccessWithStatus:@"人工申请提交成功"];
  //
  //    }else if (result == SpiderIDCodeCANCEL){
  //        [SVProgressHUD showInfoWithStatus:@"用户取消操作"];
  //
  //    }else if (result == SpiderIDCodeINVAILD_TOKEN){
  //        [SVProgressHUD showInfoWithStatus:@"无效的token"];
  //
  //    }else if (result == SpiderIDCodeINVAILD_TPAGETOKEN){
  //        [SVProgressHUD showInfoWithStatus:@"获取页面会话token失败"];
  //
  //    }else if (result == SpiderIDCodeINVAILD_FAILURE){
  //        [SVProgressHUD showErrorWithStatus:@"其他请求失败！"];
  //
  //    }
}

- (void)beginFaceLiveResult:(NSDictionary *)body
{
  if (hasListeners) {
    [self sendEventWithName:@"beginFaceLiveResult" body:body];
  }
}

- (void)startObserving
{
  hasListeners = YES;
}

- (void)stopObserving
{
  hasListeners = NO;
}

@end
