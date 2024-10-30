### 插件package_info

#### 应用场景

```
获取app的packageName,appName,version,buildNumber
```

#### 依赖导包

```
package_info: ^0.4.1
import 'package:package_info/package_info.dart';
```

#### 类静态函数

```
fromPlatform() → Future<PackageInfo>

```

#### 代码示例

```
PackageInfo packageInfo = await PackageInfo.fromPlatform();
String appName = packageInfo.appName;
String packageName = packageInfo.packageName;
String version = packageInfo.version;
String buildNumber = packageInfo.buildNumber;
```
