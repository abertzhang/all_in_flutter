## 插件android_play_install_referrer

- 应用场景

安装google的归因文档

- 依赖导包

```
android_play_install_referrer: ^0.0.1

```



- 代码示例

```
String referrerDetailsString;
  try {
    ReferrerDetails referrerDetails =
        await AndroidPlayInstallReferrer.installReferrer;
    referrerDetailsString =
        (referrerDetails.toString().split('{')[1]).split('}')[0];
  } catch (e) {
    referrerDetailsString = 'Failed referrer: $e';
}
```



- 其他

- 