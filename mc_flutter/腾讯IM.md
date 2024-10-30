### <u>类TIMUIKitChat</u>

#### 用途用法

聊天的界面,包括单聊和群聊

```
TIMUIKitChat
```

#### 构造函数

```dart
class TIMUIKitChat extends StatefulWidget {
  int startTime = 0;
  int endTime = 0;
  final TIMUIKitChatController? controller;
  final V2TimConversation conversation;
  
  final String? groupID;

  final String? conversationID;

  final ConvType? conversationType;

  final Widget Function(BuildContext context, V2TimMessage message)? userAvatarBuilder;

  final String? conversationShowName;

  final void Function(String userID, TapDownDetails tapDetails)? onTapAvatar;

  @Deprecated(
      "Nickname will not shows in one-to-one chat, if you tend to control it in group chat, please use `isShowSelfNameInGroup` and `isShowOthersNameInGroup` from `config: TIMUIKitChatConfig` instead")
  final bool showNickName;

  final MessageItemBuilder? messageItemBuilder;
  final bool showTotalUnReadCount;
  /// The builder for extra tips action.
  final Widget? Function(V2TimMessage message, Function() closeTooltip, [Key? key, BuildContext? context])? extraTipsActionItemBuilder;

  /// [Recommend]: You can specify this field with the draftText from V2TimConversation.
  final String? draftText;

  /// The target message been jumped just after entering the chat page.
  final V2TimMessage? initFindingMsg;

  /// The hint text shows at input field.
  final String? textFieldHintText;

  /// The configuration for appbar.
  final AppBar? appBarConfig;

  /// The configuration for historical message list.
  final TIMUIKitHistoryMessageListConfig? mainHistoryListConfig;

  /// The configuration for more panel, can customize actions.
  final MorePanelConfig? morePanelConfig;

  /// The builder for the tongue on the right bottom.
  /// Used for back to bottom, shows the count of unread new messages,
  /// and prompts the messages that @ user.
  final TongueItemBuilder? tongueItemBuilder;

  /// The `groupAtInfoList` from `V2TimConversation`.
  /// This field is not necessary to be provided, when `conversation` is provided, unless you want to cover this field manually.
  final List<V2TimGroupAtInfo?>? groupAtInfoList;

  /// The configuration for the whole `TIMUIKitChat` widget.
  final TIMUIKitChatConfig? config;

  /// The callback for jumping to the page for `TIMUIKitGroupApplicationList` or other pages to deal with enter group application for group administrator manually, in the case of [public group].
  /// The parameter here is `String groupID`
  final ValueChanged<String>? onDealWithGroupApplication;

  /// The builder for abstract messages, normally used in replied message and forward message.
  final String Function(V2TimMessage message)? abstractMessageBuilder;

  /// The configuration for tool tips panel, long press messages will show this panel.
  final ToolTipsConfig? toolTipsConfig;

  /// The life cycle for chat business logic.
  final ChatLifeCycle? lifeCycle;

  /// The top fixed widget.
  final Widget? topFixWidget;

  final List customEmojiStickerList;

  final Widget? customAppBar;

  /// Custom emoji panel.
  final CustomStickerPanel? customStickerPanel;

  /// Custom text field
  final Widget Function(BuildContext context)? textFieldBuilder;
  final int tag;
  ...
}
```

### 类TIMUIKitConfig

#### 用途用法

```

```

#### 源码

```dart
class TIMUIKitConfig {  
/// Control if show online status of friends or contacts.
  /// This only works with [Ultimate Edition].
  /// [Default]: true.
  final bool isShowOnlineStatus;

  /// Controls if allows to check the disk memory after login.
  /// If the storage space is less than 1GB,
  /// an callback from `onTUIKitCallbackListener` will be invoked,
  /// type is `INFO`, while code is 6661403.
  final bool isCheckDiskStorageSpace;
  /// The asset path of the default avatar image.
  final String? defaultAvatarAssetPath;
  /// The configuration of border radius for all the avatar shows in TUIKit.
  final BorderRadius? defaultAvatarBorderRadius;
  ...
}
```

### 类TIMUIKitChatConfig

#### 用途用法

TIMUIKitChat类的入参config是这个类

#### 源码

```dart
class TIMUIKitChatConfig {
  /// Customize the time divider among the two messages.
  final TimeDividerConfig? timeDividerConfig;

  /// control if allowed to show reading status.
  /// [Default]: true.
  final bool isShowReadingStatus;

  /// Control if allowed to show reading status for group.
  /// [Default]: true.
  final bool isShowGroupReadingStatus;

  /// Control if allowed to report reading status for group.
  /// [Default]: true.
  final bool isReportGroupReadingStatus;

  /// Control if allowed to show the message operation menu after long pressing message.
  /// [Default]: true.
  final bool isAllowLongPressMessage;

  /// Control if allowed to callback after clicking the avatar.
  /// [Default]: true.
  final bool isAllowClickAvatar;

  /// Control if allowed to show emoji face message panel.
  /// [Default]: true.
  final bool isAllowEmojiPanel;

  /// Control if allowed to show more plus panel.
  /// [Default]: true.
  final bool isAllowShowMorePanel;

  /// Control if allowed to send voice sound message.
  /// [Default]: true.
  final bool isAllowSoundMessage;

  /// Control if allowed to at when reply automatically.
  /// [Default]: true.
  final bool isAtWhenReply;

  /// The main switch of the group read receipt.
  final bool isShowGroupMessageReadReceipt;

  /// [Deprecated: ] Please use [groupReadReceiptPermissionList] instead.
  final List<GroupReceptAllowType>? groupReadReceiptPermisionList;

  /// Control which group can send message read receipt.
  final List<GroupReceiptAllowType>? groupReadReceiptPermissionList;

  /// Control if show self name in group chat.
  /// [Default]: false.
  final bool isShowSelfNameInGroup;

  /// Control if others name in group chat.
  /// [Default]: true.
  final bool isShowOthersNameInGroup;

  /// Configuration for offline push.
  /// If this field is specified, `notificationTitle`, `notificationOPPOChannelID`, `notificationIOSSound`, `notificationAndroidSound`, `notificationBody` and `notificationExt` will not work.
  final OfflinePushInfo? Function(
      V2TimMessage message, String convID, ConvType convType)? offlinePushInfo;

  /// The title shows in push notification
  final String notificationTitle;

  /// The channel ID for OPPO in push notification.
  final String notificationOPPOChannelID;

  /// The notification sound in iOS devices.
  /// When `iOSSound` = `kIOSOfflinePushNoSound`, the sound will not play when message received. When `iOSSound` = `kIOSOfflinePushDefaultSound`, the system sound is played when message received. If you want to customize `iOSSound`, you need to link the voice file into the Xcode project, and then set the voice file name (with a suffix) to iOSSound.
  final String notificationIOSSound;

  /// The notification sound in Android devices.
  final String notificationAndroidSound;

  ///Used to set the line height of text messages
  final double textHeight;

  /// The body content shows in push notification.
  /// Returning `null` means using default body in this case.
  final String? Function(
      V2TimMessage message, String convID, ConvType convType)? notificationBody;

  /// External information (String) for notification message, recommend used for jumping to target conversation with JSON format,
  /// Returning `null` means using default ext in this case.
  final String? Function(
      V2TimMessage message, String convID, ConvType convType)? notificationExt;

  /// The type of URL preview level, none preview, only hyperlink in text, or shows a preview card for website.
  /// [Default]: UrlPreviewType.previewCardAndHyperlink.
  final UrlPreviewType urlPreviewType;

  /// Whether to display the sending status of c2c messages
  /// [Default]: true.
  final bool showC2cMessageEditStatus;

  /// Control if take emoji stickers as message reaction.
  /// [Default]: true.
  final bool isUseMessageReaction;

  /// Determine how long a message is allowed to be recalled after it is sent.
  /// You must modify the configuration on control dashboard synchronized at: https://console.cloud.tencent.com/im/login-message.
  /// [Unit]: second.
  /// [Default]: 120.
  final int upperRecallTime;

  /// The prefix of face sticker URI.
  final String Function(String data)? faceURIPrefix;

  /// The suffix of face sticker URI.
  final String Function(String data)? faceURISuffix;

  /// Controls whether text and replied messages can be displayed with Markdown formatting.
  /// When enabled, small image stickers, including QQ stickers, will not work in message items.
  /// Also, when enabled, `isEnableTextSelection` will not works.
  /// [Default]: false.
  final bool isSupportMarkdownForTextMessage;

  /// The callback after user clicking the URL link in text messages.
  /// The default action is opening the link with the default browser of system.
  final void Function(String url)? onTapLink;

  /// Whether to use the default emoji
  final bool isUseDefaultEmoji;

  /// Is show avatar on history message list.
  /// [Default]: true.
  final bool isShowAvatar;
  /// This list contains additional operation items that are displayed on the hover bar
  /// of a message on desktop (macOS, Windows, and desktop version of Web). These items
  /// are in addition to the default ones and do not affect them.
  final List<MessageHoverControlItem>? additionalDesktopMessageHoverBarItem;

  /// This list contains additional items that are displayed
  /// on the control bar on desktop (macOS, Windows, and desktop version of Web).
  /// Use `desktopControlBarConfig` to configure whether or not to show the default control items.
  final List<DesktopControlBarItem>? additionalDesktopControlBarItems;

  /// This configuration is used for the control bar
  /// on desktop (macOS, Windows, and desktop version of Web).
  /// Use `desktopControlBarConfig` to add additional items to the desktop control bar, in addition to the default ones.
  final DesktopControlBarConfig? desktopControlBarConfig;

  /// Controls whether users are allowed to mention another user in the group by long-pressing on their avatar.
  /// [Default]: true.
  final bool isAllowLongPressAvatarToAt;

  /// Controls whether auto report message read status when new messages come.
  /// [Default]: true.
  final bool isAutoReportRead;

  /// Controls whether enable text selection.
  /// [Default]: true on Desktop while false on Mobile.
  final bool? isEnableTextSelection;
  ...
}
```

### 类TIMUIKitConversation

#### 用途用法



#### 源码

```dart
class TIMUIKitConversation extends StatefulWidget {
  /// the callback after clicking conversation item
  final ValueChanged<V2TimConversation>? onTapItem;
  /// conversation controller
  final TIMUIKitConversationController? controller;
  /// the builder for conversation item
  final ConversationItemBuilder? itemBuilder;
  /// the builder for Slidable item for each conversation item, shows on narrow screens.
  final ConversationItemSlideBuilder? itemSlideBuilder;
  /// the widget of secondary tap menu for each conversation item, shows on wide screens.
  final ConversationItemSecondaryMenuBuilder? itemSecondaryMenuBuilder;
  /// the widget shows when no conversation exists
  final Widget Function()? emptyBuilder;
  /// the filter for conversation
  final bool Function(V2TimConversation? conversation)? conversationCollector;
  /// the builder for the second line in each conservation item,
  /// usually shows the summary of the last message
  final LastMessageBuilder? lastMessageBuilder;

  /// The life cycle hooks for `TIMUIKitConversation`
  final ConversationLifeCycle? lifeCycle;
  /// Control if shows the online status for each user on its avatar.
  final bool isShowOnlineStatus;
  /// Control if shows the identifier that the conversation has a draft text, inputted in previous.
  /// Also, you have better specifying the `draftText` field for `TIMUIKitChat`, from the `draftText` in `V2TimConversation`,
  /// to meet the identifier shows here.
  final bool isShowDraft;
  TIMUIKitConversation(
      {Key? key,
      this.lifeCycle,
      this.onTapItem,
      this.controller,
      this.itemSecondaryMenuBuilder,
      this.itemBuilder,
      this.isShowDraft = true,
      this.itemSlideBuilder,
      this.conversationCollector,
      this.emptyBuilder,
      this.lastMessageBuilder,
      this.isShowOnlineStatus = true})
    ...
}
```

### 类V2TimConversation

#### 用途用法

联系人信息

#### 构造函数

```dart
class V2TimConversation {
  late String conversationID;
  int? type;
  String? userID;
  String? groupID;
  String? showName;
  String? faceUrl;
  String? groupType;
  int? unreadCount;
  V2TimMessage? lastMessage;
  String? draftText;
  int? draftTimestamp;
  bool? isPinned;
  int? recvOpt;
  List<V2TimGroupAtInfo?>? groupAtInfoList = List.empty(growable: true);
  int? orderkey;
  List<int?>? markList;
  String? customData;
  List<String?>? conversationGroupList;
  ...
}  
```

### 类V2TimMessage

#### 用途用法

#### 构造函数

```dart
class V2TimMessage {
  /// 消息ID
  late String? msgID;
  /// 消息时间戳
  late int? timestamp;
  /// 消息发送进度，只有多媒体消息才会有，其余消息为100
  late int? progress;
  /// 消息发送者
  late String? sender;
  /// 消息发送者昵称
  late String? nickName;
  /// 消息发送者好友备注，只有当与消息发送者有好友关系，且给好友设置过备注，才会有值
  late String? friendRemark;
  /// 发送者头像
  late String? faceUrl;
  /// 发送者备注
  late String? nameCard;
  /// 群ID，只有群消息才会有
  late String? groupID;
  /// 消息接受者用户ID
  late String? userID;
  /// 消息状态 发送中 成功 失败等
  late int? status;
  /// 消息类型 文本消息 图片消息等
  late int elemType;
  /// 文本消息
  V2TimTextElem? textElem;
  /// 文本消息
  V2TimCustomElem? customElem;

  /// 文本消息
  V2TimImageElem? imageElem;

  /// 录音消息
  V2TimSoundElem? soundElem;

  /// 视频消息
  V2TimVideoElem? videoElem;

  /// 文件消息
  V2TimFileElem? fileElem;

  /// 位置消息
  V2TimLocationElem? locationElem;

  /// 表情消息
  V2TimFaceElem? faceElem;

  /// 群提示消息
  V2TimGroupTipsElem? groupTipsElem;

  /// 合并消息
  V2TimMergerElem? mergerElem;

  /// 消息的本地自定义字段（string类型），只存在于本地，删除应用后丢失
  late String? localCustomData;

  /// 消息的本地自定义字段（int 类型），只存在于本地，删除应用后丢失
  late int? localCustomInt;

  /// 消息的云端自定义字段（string类型）
  late String? cloudCustomData;

  /// 是否是当前登录用户的消息
  late bool? isSelf;

  /// 消息是否自己已读
  late bool? isRead;

  /// 消息是否接收方已读，仅c2c消息有效
  late bool? isPeerRead;

  /// 消息优先级
  late int? priority;
  /// 离线推送相关配置
  OfflinePushInfo? offlinePushInfo;
  /// 群@消息@数组
  List<String>? groupAtUserList = List.empty(growable: true);
  /// 消息序列号
  late String? seq;
  /// 合并消息
  late int? random;
  /// 消息是否计入会话未读数
  late bool? isExcludedFromUnreadCount;
  /// 消息是否计入会话lastmessage
  late bool? isExcludedFromLastMessage;
  /// 消息是否支持消息扩展
  late bool? isSupportMessageExtension;
  /// 来自web的消息，仅在flutter for web时有用
  late String? messageFromWeb;
  /// 消息id，仅在 createXXXMessage后sendMessage调用异步返回后有小
  late String? id; // plugin自己维护的id，在onProgressListener的监听中才返回
  /// 是否要群消息已读回执
  late bool? needReadReceipt;
  ...
}  
```

