//
//  SYVoicePush.m
//  DKSVoiceDemo
//
//  Created by aDu on 2017/6/30.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import "SYVoicePush.h"

@interface SYVoicePush ()

/**语音合成*/
//@property (nonatomic, strong) IFlySpeechSynthesizer *speech;

@end

@implementation SYVoicePush

+ (SYVoicePush *)shareVoice
{
    static SYVoicePush *voicePush = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        voicePush = [[SYVoicePush alloc] init];
    });
    return voicePush;
}

- (void)initVoicePush
{
    //讯飞
    //日志设置
    [IFlySetting showLogcat:NO];
    NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@", @"5950e44c"];
    [IFlySpeechUtility createUtility:initString];
}

- (void)speedVoiceWithTextStr:(NSString *)textStr
{
    IFlySpeechSynthesizer *speech = [IFlySpeechSynthesizer sharedInstance];
    speech.delegate = self;
    //设置合成参数
    //设置在线工作方式
    [speech setParameter:[IFlySpeechConstant TYPE_CLOUD]
                   forKey:[IFlySpeechConstant ENGINE_TYPE]];
    //设置音量，取值范围 0~100
    [speech setParameter:@"50" forKey: [IFlySpeechConstant VOLUME]];
    //发音人，默认为”xiaoyan”，可以设置的参数列表可参考“合成发音人列表”
    [speech setParameter:@"xiaoyan" forKey: [IFlySpeechConstant VOICE_NAME]];
    //保存合成文件名，如不再需要，设置为 nil 或者为空表示取消，默认目录位于 library/cache下
    [speech setParameter:nil forKey: [IFlySpeechConstant TTS_AUDIO_PATH]];
    if (speech.isSpeaking) {
        
    } else {
        [speech startSpeaking:textStr];
    }
}

#pragma mark ========== 语音合成 ==========
//合成结束
- (void)onCompleted:(IFlySpeechError*)error {
    
}

//合成开始
- (void)onSpeakBegin {
    
}

//合成缓冲进度
- (void)onBufferProgress:(int)progress message:(NSString *)msg {
    
}

//合成播放进度
- (void)onSpeakProgress:(int)progress beginPos:(int)beginPos endPos:(int)endPos {
    
}

@end
