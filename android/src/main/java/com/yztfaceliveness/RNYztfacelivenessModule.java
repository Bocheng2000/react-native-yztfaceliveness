
package com.yztfaceliveness;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;

public class RNYztfacelivenessModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public RNYztfacelivenessModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNYztfaceliveness";
  }

  @ReactMethod
    public void beginFaceLive(String authToken) {
        SpiderIdSdkManager.openSdk(ctx.getCurrentActivity(), authToken);
  }
}