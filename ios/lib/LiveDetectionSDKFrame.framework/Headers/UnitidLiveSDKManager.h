//
//  UnitidLiveSDKManager.h
//  LiveDetectionSDKFrame
//
//  Created by 张鹤 on 2020/6/30.
//  Copyright © 2020 张鹤. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, SpiderIDResultCode) {
    SpiderIDCodeOK = 0,   //成功
    SpiderIDCodeMANUAL_AUDIT = 1,    //提交人工审核
    SpiderIDCodeCANCEL = 2,  //取消
    SpiderIDCodeINVAILD_TOKEN = 3,  // Token校验失败，请检查Bundle ID!
    SpiderIDCodeINVAILD_TPAGETOKEN = 4,  //获取页面会话token失败
    SpiderIDCodeINVAILD_FAILURE = 5,  //其他失败

};





@interface UnitidLiveSDKManager : NSObject

+ (instancetype)sharedInstance;

+ (NSString *)getVersion;
/*
 * 配置活体认证License
 */
+ (void)setLicenseID:(NSString *)licenseID andLocalLicenceFile:(NSString *)localLicencePath;


/*
 * 活体功能是否配置成功
 */
+ (BOOL)canWork;



@end

NS_ASSUME_NONNULL_END
