## 插件android_intent

- 应用场景

用这种方式打开googleplay比较快一点

- 文档

```
https://pub.dev/packages/android_intent
```

- 依赖导包

```
android_intent: ^0.3.7+2
import 'package:android_intent/android_intent.dart';
```

- 代码示例

```
有关每个参数的详细信息，请参见AndroidIntent类的文档。
动作参数可以是任何动作，包括要调用的自定义类名称。如果需要标准的android操作，建议在插件中添加对此操作的支持，并使用操作常量来引用它。例如：
'action_view' 转换为 android.os.Intent.ACTION_VIEW
'action_location_source_settings' 转换为 android.settings.LOCATION_SOURCE_SETTINGS
'action_application_details_settings' 转换为 android.settings.ACTION_APPLICATION_DETAILS_SETTINGS
```

```
final AndroidIntent intent = AndroidIntent(
 action: 'action_view',
 data: Uri.encodeFull(_urlMap["market"]),
 package: 'com.android.vending');
intent.launch();
```

```
final AndroidIntent intent = AndroidIntent(
action: 'action_view',
data: Uri.encodeFull(_urlMap["googleplay"]),
package: 'com.android.chrome');
intent.launch();
```

```
if (platform.isAndroid) {
  final AndroidIntent intent = AndroidIntent(
    action: 'action_application_details_settings',
    data: 'package:com.example.app', // replace com.example.app with your applicationId
  );
  await intent.launch();
}
```

- 其他