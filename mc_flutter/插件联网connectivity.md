## 插件connectivity

- 应用场景

判断以哪种方式上网的:手机,局域网或没有网络

- 依赖导包

```
connectivity: 0.4.8+2
import 'package:connectivity/connectivity.dart';
```

- 代码示例

```
bool isOn = true;  Connectivity().checkConnectivity().then((connectivityResult) {
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      isOn = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      isOn = true;
    } else {
      isOn = false;
    }
  });
```

- 其他