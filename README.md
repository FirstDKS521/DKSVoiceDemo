#iOS开发：收到极光推送，后台播报语音功能

####收到推送以后，当APP在后台时，可以进行语音播报，就像支付宝（支付宝到账，1000000元）这种功能
如果使用讯飞语音播报功能或者是系统自带功能语音播报功能，很容易就接入到工程中了，此时APP在前台，顺利的就播报语音了；不过，如果APP退到后台，此时结合极光推送，在后台也可以播报语音，功能如何实现

工程中配置如下：
![image.png](http://upload-images.jianshu.io/upload_images/1840399-e9e0b8550dd660b1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

以下代码都在APPDelegate中实现；极光推送收到推送时的方法，在此处处理语音播报：

```
//iOS 7 Remote Notification
- (void)application:(UIApplication *)application didReceiveRemoteNotification:  (NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
	//播报语音
}
```
如果实现后台语音播报，需要配置程序进入后台时处于活跃状态

```
//后台语音播报
- (void)applicationDidEnterBackground:(UIApplication *)application {
    UIApplication*   app = [UIApplication sharedApplication];
    __block    UIBackgroundTaskIdentifier bgTask;
    bgTask = [app beginBackgroundTaskWithExpirationHandler:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (bgTask != UIBackgroundTaskInvalid)
            {
                bgTask = UIBackgroundTaskInvalid;
            }
        });
    }];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (bgTask != UIBackgroundTaskInvalid)
            {
                bgTask = UIBackgroundTaskInvalid;
            }
        });
    });
}
```
在didFinishLaunchingWithOptions方法中实现：

```
//后台语音播报
[[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: nil];
[[AVAudioSession sharedInstance] setActive:YES error:nil];
```

详细的一些问题参考：[链接1](http://www.jianshu.com/p/c06133d576e4)
[链接2](http://www.jianshu.com/p/9662a04b24ae)
