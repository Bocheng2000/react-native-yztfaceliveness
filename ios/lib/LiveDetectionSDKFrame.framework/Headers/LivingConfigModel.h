//
//  LivingConfigModel.h
//  IDLFaceSDKDemoOC
//
//  Created by 张鹤 on 2018/6/3.
//  Copyright © 2018年 张鹤. All rights reserved.
//
//  此类为了存储用户选择活体检测命令而设置的单例类
//

#import <Foundation/Foundation.h>

@interface LivingConfigModel : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, readwrite, assign) BOOL isByOrder;
@property (nonatomic, readwrite, assign) NSInteger numOfLiveness;
@property (nonatomic, readwrite, retain) NSMutableArray *liveActionArray;

/*
 * Token 必填
 */
@property (nonatomic, readwrite, copy) NSString *token;



- (void)resetState;

@end
