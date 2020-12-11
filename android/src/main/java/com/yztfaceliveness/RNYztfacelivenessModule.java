
package com.yztfaceliveness;

import android.app.Activity;
import android.content.Intent;
import com.facebook.react.bridge.ActivityEventListener;
import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.modules.core.DeviceEventManagerModule;

import cn.unitid.liveness.ActionConfig;
import cn.unitid.liveness.IdentityVerificationSdk;
import cn.unitid.liveness.LivenessTypeEnum;
import cn.unitid.liveness.SpiderIdSdkManager;
import cn.unitid.liveness.constant.CmConstants;

public class RNYztfacelivenessModule extends ReactContextBaseJavaModule implements ActivityEventListener{
  private final ReactApplicationContext ctx;
  //  private final ReactApplicationContext reactContext;
  public RNYztfacelivenessModule(ReactApplicationContext reactContext) {
    super(reactContext);
    ctx = reactContext;
    ctx.addActivityEventListener(this);
    initLib();
  }

  /**
   * 初始化活体检测SDK
   */
  private void initLib() {
    String serverUrl = "https://eh5.spiderid.cn";
    // SDK初始化
    IdentityVerificationSdk.initializeSDK(this.ctx, "disanji-face-android",
            "idl-license.face-android",serverUrl);
    // 配置活体采集的动作，默认动作是眨眼
    ActionConfig.setAction(LivenessTypeEnum.Eye);
    ActionConfig.setAction(LivenessTypeEnum.HeadDown);
    ActionConfig.setAction(LivenessTypeEnum.HeadLeftOrRight);
  }

  @Override
  public String getName() {
    return "RNYztfaceliveness";
  }

  @ReactMethod
  public void beginFaceLive(String authToken) {
    SpiderIdSdkManager.openSdk(ctx.getCurrentActivity(), authToken);
  }

  @Override
  public void onActivityResult(Activity activity, int requestCode, int resultCode, Intent data) {
    if (SpiderIdSdkManager.SDK_REQUEST_CODE == requestCode) {
      int code = data.getIntExtra(CmConstants.CODE, -1);
      String message = data.getStringExtra(CmConstants.MESSAGE);
      WritableMap result = Arguments.createMap();
      result.putInt("code", code);
      result.putString("message", message);
      // 将检测数据回传给 RN
      ctx.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit("beginFaceLiveResult",result);
    }
  }

  @Override
  public void onNewIntent(Intent intent) {

  }
}