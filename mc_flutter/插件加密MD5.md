## MD5生成

- 应用场景
- 代码示例

```
String getSignUser(
    {String deviceId,
    int timeStamp,
    String versionNumber = '1',
    String apiKey}) {
  String stringTimeStamp = timeStamp.toString();

  Map md5Param = {
    'apiKey': apiKey,
    'platformImei': deviceId,
    'versionNumber': versionNumber,
    'timeStamp': stringTimeStamp,
  };
  List<String> allKeys = [];
  md5Param.forEach((key, value) {
    allKeys.add(value);
  });
  String pairsString = allKeys.join('|');
  String signString =
      md5.convert(utf8.encode(pairsString)).toString().toLowerCase();
  return signString;
}
```

- 其他