//
//  YztFaceLiveModule.h
//  babel
//
//  Created by ccb on 2020/11/30.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
#import <LiveDetectionSDKFrame/LiveDetectionSDKFrame.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNYztfaceliveness : RCTEventEmitter<RCTBridgeModule, UnitidLiveSDKDelegate>

- (void)beginFaceLive:(NSString *)authToken;
@end

NS_ASSUME_NONNULL_END