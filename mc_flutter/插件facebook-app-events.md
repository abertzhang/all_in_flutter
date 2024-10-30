## 插件facebook_app_events

- 应用场景
- 依赖导包

```
facebook_app_events: 0.5.2
import 'package:facebook_app_events/facebook_app_events.dart';
```

- 代码示例

```
final facebookAppEvents = FacebookAppEvents();//全局
//上传到facebook
  facebookAppEvents.logEvent(
    name: 'event_submit_mobile',
    parameters: {
      'U_mobile_00': stringUserMobilePhone,
      'U_code_00': intVerify.toString(),
      'U_type_00': 'submit'
    },
  );
```



- 其他