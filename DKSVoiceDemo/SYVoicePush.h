//
//  SYVoicePush.h
//  DKSVoiceDemo
//
//  Created by aDu on 2017/6/30.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <iflyMSC/iflyMSC.h>

@interface SYVoicePush : NSObject<IFlySpeechSynthesizerDelegate>

/**
 初始化讯飞语音
 */
+ (SYVoicePush *)shareVoice;

/**
 初始化讯飞语音
 */
- (void)initVoicePush;

/**
 开始合成语音
 @param textStr 需要合成的语音文案
 */
- (void)speedVoiceWithTextStr:(NSString *)textStr;

@end
