## 广告advertising_id

- 应用场景
- 依赖导包

```
advertising_id: ^0.9.2

```



- 代码示例

```
String advertisingId;
  try {
    advertisingId = await AdvertisingId.id;
  } on PlatformException {
    advertisingId = 'Failed to get platform version.';
  }
```

- 其他