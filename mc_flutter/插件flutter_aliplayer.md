### 文档资料

[flutter_aliplayer插件到底怎么用](https://developer.aliyun.com/ask/493607)

### <u>类AliPlayerView</u>

```
class AliPlayerView extends StatefulWidget {
  final AliPlayerViewCreatedCallback? onCreated;
  final x;
  final y;
  final width;
  final height;
  AliPlayerViewTypeForAndroid aliPlayerViewType;
  ...
  }
  AliPlayerViewTypeForAndroid
```

### 类FlutterAliplayer

```dart
class FlutterAliplayer {
  OnLoadingBegin? onLoadingBegin;
  OnLoadingProgress? onLoadingProgress;
  OnLoadingEnd? onLoadingEnd;
  OnPrepared? onPrepared;
  OnRenderingStart? onRenderingStart;
  OnVideoSizeChanged? onVideoSizeChanged;
  OnSeekComplete? onSeekComplete;
  OnStateChanged? onStateChanged;
  OnInfo? onInfo;
  OnCompletion? onCompletion;
  OnTrackReady? onTrackReady;
  OnError? onError;
  OnSeiData? onSeiData;
  OnSnapShot? onSnapShot;
  OnTrackChanged? onTrackChanged;
  OnThumbnailPreparedSuccess? onThumbnailPreparedSuccess;
  OnThumbnailPreparedFail? onThumbnailPreparedFail;

  OnThumbnailGetSuccess? onThumbnailGetSuccess;
  OnThumbnailGetFail? onThumbnailGetFail;

  //外挂字幕
  OnSubtitleExtAdded? onSubtitleExtAdded;
  OnSubtitleHide? onSubtitleHide;
  OnSubtitleShow? onSubtitleShow;
  OnSubtitleHeader? onSubtitleHeader;

  //直播时移
  OnSeekLiveCompletion? onSeekLiveCompletion;
  OnTimeShiftUpdater? onTimeShiftUpdater;

  //埋点
  OnEventReportParams? onEventReportParams;

  // static MethodChannel channel = new MethodChannel('flutter_aliplayer');
  EventChannel eventChannel = EventChannel("flutter_aliplayer_event");

  String playerId = 'default';
  ...
  //对设置set有更多看源码
  /// 播放器事件回调，准备完成事件	
	typedef OnPrepared = void Function(String playerId);    
  void setOnPrepared(OnPrepared prepared) {
    this.onPrepared = prepared;
   }    
  }
```

### 类FlutterAvpdef

```dart
class FlutterAvpdef {
  /**@brief 不保持比例平铺*/
  /// **@brief Auto stretch to fit.*/
  static const int AVP_SCALINGMODE_SCALETOFILL = 0;
  /**@brief 保持比例，黑边*/
  /// **@brief Keep aspect ratio and add black borders.*/
  static const int AVP_SCALINGMODE_SCALEASPECTFIT = 1;
  /**@brief 保持比例填充，需裁剪*/
  /// **@brief Keep aspect ratio and crop.*/
  static const int AVP_SCALINGMODE_SCALEASPECTFILL = 2;
  /**@brief 旋转模式*/
  /// **@brief Rotate mode*/
  static const int AVP_ROTATE_0 = 0;
  static const int AVP_ROTATE_90 = 90;
  static const int AVP_ROTATE_180 = 180;
  static const int AVP_ROTATE_270 = 270;
  /**@brief 镜像模式*/
  /// **@brief Mirroring mode*/
  static const int AVP_MIRRORMODE_NONE = 0;
  static const int AVP_MIRRORMODE_HORIZONTAL = 1;
  static const int AVP_MIRRORMODE_VERTICAL = 2;
  /// Log 日志级别
  static const int AF_LOG_LEVEL_NONE = 0;
  static const int AF_LOG_LEVEL_FATAL = 8;
  static const int AF_LOG_LEVEL_ERROR = 16;
  static const int AF_LOG_LEVEL_WARNING = 24;
  static const int AF_LOG_LEVEL_INFO = 32;
  static const int AF_LOG_LEVEL_DEBUG = 48;
  static const int AF_LOG_LEVEL_TRACE = 56;
  ///infoCode
  static const int UNKNOWN = -1;
  static const int LOOPINGSTART = 0;
  static const int BUFFEREDPOSITION = 1;
  static const int CURRENTPOSITION = 2;
  static const int AUTOPLAYSTART = 3;
  static const int SWITCHTOSOFTWAREVIDEODECODER = 100;
  static const int AUDIOCODECNOTSUPPORT = 101;
  static const int AUDIODECODERDEVICEERROR = 102;
  static const int VIDEOCODECNOTSUPPORT = 103;
  static const int VIDEODECODERDEVICEERROR = 104;
  static const int VIDEORENDERINITERROR = 105;
  static const int DEMUXERTRACEID = 106;
  static const int NETWORKRETRY = 108;
  static const int CACHESUCCESS = 109;
  static const int CACHEERROR = 110;
  static const int LOWMEMORY = 111;
  static const int NETWORKRETRYSUCCESS = 113;
  static const int SUBTITLESELECTERROR = 114;
  static const int DIRECTCOMPONENTMSG = 116;
  static const int RTSSERVERMAYBEDISCONNECT = 805371905;
  static const int RTSSERVERRECOVER = 805371906;

  ///点播服务器返回的码率清晰度类型
  static const String FD = "FD";
  static const String LD = "LD";
  static const String SD = "SD";
  static const String HD = "HD";
  static const String OD = "OD";
  static const String K2 = "2K";
  static const String K4 = "4K";
  static const String SQ = "SQ";
  static const String HQ = "HQ";
  static const String AUTO = "AUTO";
  ///播放器状态
  static const int unknow = -1;
  static const int idle = 0;
  static const int initalized = 1;
  static const int prepared = 2;
  static const int started = 3;
  static const int paused = 4;
  static const int stopped = 5;
  static const int completion = 6;
  static const int error = 7;

  ///精准seek
  static const int ACCURATE = 1;
  static const int INACCURATE = 16;

  ///下载方式
  static const String DOWNLOADTYPE_STS = "download_sts";
  static const String DOWNLOADTYPE_AUTH = "download_auth";

  ///黑名单
  static const String BLACK_DEVICES_H264 = "HW_Decode_H264";
  static const String BLACK_DEVICES_HEVC = "HW_Decode_HEVC";

  static const int AVPTRACK_TYPE_VIDEO = 0;
  static const int AVPTRACK_TYPE_AUDIO = 1;
  static const int AVPTRACK_TYPE_SUBTITLE = 2;
  static const int AVPTRACK_TYPE_SAAS_VOD = 3;

  //  空转，闲时，静态
  static const int AVPStatus_AVPStatusIdle = 0;
  // /** @brief 初始化完成 */
  static const int AVPStatus_AVPStatusInitialzed = 1;
  // /** @brief 准备完成 */
  static const int AVPStatus_AVPStatusPrepared = 2;
  // /** @brief 正在播放 */
  static const int AVPStatus_AVPStatusStarted = 3;
  // /** @brief 播放暂停 */
  static const int AVPStatus_AVPStatusPaused = 4;
  // /** @brief 播放停止 */
  static const int AVPStatus_AVPStatusStopped = 5;
  // /** @brief 播放完成 */
  static const int AVPStatus_AVPStatusCompletion = 6;
  // /** @brief 播放错误
  static const int AVPStatus_AVPStatusError = 7;
}
```



### 枚举AliPlayerViewTypeForAndroid

```dart
///Android 渲染 View 类型
enum AliPlayerViewTypeForAndroid {
  surfaceview,
  textureview,
}
DocTypeForIOS
```

### 枚举DocTypeForIOS

```dart
/// iOS 沙盒目录类型
enum DocTypeForIOS {
  // Documents
  documents,
  // Llibrary
  library,
  // Caches
  caches,
}
```

### 方法setConfig

```dart
//需要在 prepare 之前设置给播放器
var configMap = {
  'mStartBufferDuration':_mStartBufferDurationController.text,///起播缓冲区时长
  'mHighBufferDuratio':_mHighBufferDurationController.text,///高缓冲时长
  'mMaxBufferDuration':_mMaxBufferDurationController.text,///最大缓冲区时长
  'mMaxDelayTime': _mMaxDelayTimeController.text,///最大延迟。注意：直播有效
  'mNetworkTimeout': _mNetworkTimeoutController.text,///网络超时时间
  'mNetworkRetryCount':_mNetworkRetryCountController.text,///网络重试次数
  'mMaxProbeSize': _mMaxProbeSizeController.text,///最大probe大小
  'mReferrer': _mReferrerController.text,///referrer
  'mHttpProxy': _mHttpProxyController.text,///http代理
  'mEnableSEI': mEnableSEI,///是否启用SEI
  'mClearFrameWhenStop': !mShowFrameWhenStop,///停止后是否清空画面
  'mDisableVideo': mDisableVideo,///禁用Video
  'mDisableAudio': mDisableAudio///禁用Audio
};
widget.fAliplayer.setConfig(configMap);
```

### 方法setCacheConfig

```dart
//边播边缓存--需要在 prepare 之前设置给播放器
var map = {
  "mMaxSizeMB": _mMaxSizeMBController.text,///缓存目录的最大占用空间
  "mMaxDurationS": _mMaxDurationSController.text,///设置能够缓存的单个文件的最大时长
  "mDir": _mDirController.text,///缓存目录
  "mEnable": mEnableCacheConfig,///是否开启缓存功能
};
fAliplayer.setCacheConfig(map);
```

### 其他

```dart
//1.创建列表播放器
FlutterAliListPlayer fAliListPlayer = FlutterAliPlayerFactory.createAliListPlayer();

//2.添加资源、移除资源。列表播放器目前只支持两种播放方式，URL 和 STS    
///uid是视频的唯一标志。用于区分视频是否一样。如果uid一样，则认为是一样的
fAliListPlayer.addUrlSource(url,uid);
fAliListPlayer.addVidSource(vid,uid);
fAliListPlayer.removeSource(uid);

//设置预加载个数
fAliListPlayer.setPreloadCount(count);

//播放视频源
///uid 为必填项，如果是 URL 播放方式，只需要 uid 即可，如果是 STS 方式，则需要填写 STS 信息
fAliListPlayer.moveTo();
```

