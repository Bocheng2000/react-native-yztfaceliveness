//
//  UnitidVerificatedViewController.h
//  LiveDetectionSDKFrame
//
//  Created by 张鹤 on 2020/6/28.
//  Copyright © 2020 张鹤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UnitidLiveSDKManager.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UnitidLiveSDKDelegate <NSObject>

@optional

/*
 * 认证结果返回
 */
- (void)hyLivenessDetectionControllerDidGetResult:(SpiderIDResultCode)result;


@end

@interface UnitidVerificatedViewController : UIViewController


@property (nonatomic, weak) id<UnitidLiveSDKDelegate> delegate;
/***/

@end

NS_ASSUME_NONNULL_END
