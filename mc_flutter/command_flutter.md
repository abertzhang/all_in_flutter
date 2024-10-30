### import使用

```dart
//别名
import 'package:socket_io_client/socket_io_client.dart' as IO;
//只引用foo
import 'package:lib1/lib1.dart' show foo;
//隐藏foo
import 'package:lib2/lib2.dart' hide foo;
//延迟加载
import 'package:greetings/hello.dart' deferred as hello;
```

```dart
//part
//  定义库的名字
library global;
//指明与其关联的父库
part of global;
```

```dart
export 'dart:io' show Platform;
export 'package:flustars_flutter3/flustars_flutter3.dart' hide ScreenUtil, SpUtil;
export 'package:flutter/material.dart';
```

```
文件导入顺序（从上到下依次）
dart sdk 内的库
flutter内的库
第三方库
自己的库（文件）
相对路径引用
e.g.
```



### 常用常量

```dart
//是否生产环境
bool.fromEnvironment('dart.vm.product')
const bool kReleaseMode = bool.fromEnvironment('dart.vm.product');
const bool kProfileMode = bool.fromEnvironment('dart.vm.profile');
const bool kDebugMode = !kReleaseMode && !kProfileMode;
const double precisionErrorTolerance = 1e-10;
const bool kIsWeb = bool.fromEnvironment('dart.library.js_util');
const Duration kThemeAnimationDuration = Duration(milliseconds: 200);  
```



### 常用

```dart
flutter --version
flutter doctor
//查看日志
flutter logs
//查看命令的帮助信息
flutter help  
//默认语言 iOS Swift，Android kotlin
flutter create flutter_app
 //使用语言 iOS Swift，Android kotlin
flutter create -i swift -a kotlin flutter_app
//使用语言iOS Objective-C，Android java
flutter create -i objc -a java flutter_app 
//升级flutter版本
flutter upgrade
```

### 依赖

```dart
//获取flutter项目中以来的包，不包括flutter sdk
flutter packages get
//更新flutter项目所有依赖包，不包括flutter sdk
flutter packages upgrade
```

### 打包

```dart
//Android 打包
flutter build apk
//iOS 打包
flutter build ios --debug
flutter build ios --release  
```



### 运行

```dart
//列出所有连接的设备
flutter devices
//运行指定模拟器或者真机
flutter run -d deviceId
//运行所有模拟器
flutter run -d all
//查看可用模拟器
flutter emulators
//启动iOS模拟器
flutter emulators --launch apple_ios_simulator
//启动Android 模拟器-只有启动模拟器才可以运行
flutter emulators --launch XXX  
//运行IOS真机
flutter run -d 00008030-0012215C3C3A802E  
```

### 插件

```dart
//-a选android语言java或kotlin(默认),-i选iso语言objc或swift(默认)
//--template为plugin或package或module
//--org表示你的组织
flutter create --org com.example --template=plugin --platforms=android,ios -i objc -a java plugin 'plugin_name'
//创建模块
flutter create -t module flutter_module
```

### Dart

```
dart run
```

```
List<DeviceRentInfoModel> list = _sameFromList(supplyDeviceList:
```

```
{
	"code": "0",
	"msg": null,
	"data": {
		"supplyOrderId": "1779839901966258178",
		"supplyOrderNo": "DD2404080001-005",
		"orderId": "1777260879197396993",
		"orderNo": "DD2404080001",
		"orderStatus": 50,
		"statusDesc": "已通过",
		"supplyOrderStatus": 10,
		"supplyOrderStatusDesc": "审批中",
		"contractNo": "HMYZL2404080002",
		"opportunityId": null,
		"opportunityNo": "SJ2403300000",
		"opportunityName": null,
		"saleManagerId": "1746696769900883970",
		"saleManagerDepartId": "902490504",
		"saleManagerName": "杨肖宇asdf",
		"customerId": "1747113369107918850",
		"customerName": "徐34asdf",
		"customerNo": null,
		"customerType": "0",
		"customerTypeAlias": null,
		"customerCredit": null,
		"customerContactorId": "1747113369128890370",
		"customerContactorName": "徐",
		"customerContactorPhone": "13851990503",
		"customerContactorWeChatNumber": "0009",
		"customerAddress": "河南",
		"customerContactorIdCardNumber": "410225199011175814",
		"projectId": "1737039900047478785",
		"projectName": "黑",
		"projectContent": "消防,安装",
		"projectAddress": "黑",
		"initialEntryFreight": 1.000,
		"guaranteeDeposit": 1.000,
		"estimatedRent": 3.000,
		"estimatedTotalAmount": 4.000,
		"paymentMethodType": 10,
		"paymentMethodDesc": "月结",
		"paymentPeriodType": 2,
		"paymentPeriodDesc": "后付",
		"paymentPeriodCycle": 7,
		"transportationMethodType": 10,
		"processInstanceId": "793293",
		"comment": null,
		"approvalComments": null,
		"contractFileUrl": null,
		"contractSignFileUrl": null,
		"contractSignTaskUrl": null,
		"contractStatus": null,
		"contractStatusDesc": null,
		"contractType": null,
		"contractTypeDesc": null,
		"orderDeviceDetails": [{
			"deviceModel": "RS1012HD",
			"deviceType": "FORK",
			"deviceTypeAlias": "剪叉车",
			"deviceNum": 13,
			"deviceHeight": "10",
			"rentalType": 1,
			"rentalTypeDesc": null,
			"shortestRentalPeriod": 3,
			"estimatedRentalPeriod": 3,
			"handoverTime": "2024-03-30 13:15:00",
			"dailyRent": 3,
			"monthlyRent": 3,
			"deviceRent": 3.000
		}],
		"orderInitialDeviceDetails": [{
			"deviceModel": "RS1012HD",
			"deviceType": "FORK",
			"deviceTypeAlias": "剪叉车",
			"deviceNum": 2,
			"deviceHeight": "10"
		}],
		"orderTransportationDetails": [{
			"transportationAgreementType": 99,
			"transportationAgreementDesc": "无",
			"transportationAgreementConstraints": null
		}],
		"authorizerDetails": [{
			"authorizerName": null,
			"authorizerPhone": null,
			"authorizerIdCardNumber": null
		}, {
			"authorizerName": null,
			"authorizerPhone": null,
			"authorizerIdCardNumber": null
		}],
		"supplyOrderDeviceDetails": [{
			"id": "1779839907129446401",
			"deviceModel": "RS1012HD",
			"deviceType": "FORK",
			"deviceNum": 12,
			"rentalType": 1,
			"shortestRentalPeriod": 22,
			"estimatedRentalPeriod": 32,
			"handoverTime": "2024-04-15 19:50:00",
			"dailyRent": 154.000,
			"monthlyRent": 163.000,
			"deviceRent": 2086.400,
			"extendedFields": "{\"deviceHeight\": \"10\", \"deviceTypeAlias\": \"剪叉车\"}",
			"modifyPrice": 1,
			"dailyModifyPrice": 1,
			"monthlyModifyPrice": 1,
			"deviceHeight": "10",
			"deviceTypeAlias": "剪叉车",
			"isExistSourceRecord": true
		}, {
			"id": "1779839907129446402",
			"deviceModel": "RST20E",
			"deviceType": "ARM",
			"deviceNum": 12,
			"rentalType": 1,
			"shortestRentalPeriod": 25,
			"estimatedRentalPeriod": 36,
			"handoverTime": "2024-04-15 19:50:00",
			"dailyRent": 1254.000,
			"monthlyRent": 3652.000,
			"deviceRent": 52588.800,
			"extendedFields": "{\"deviceHeight\": \"18\", \"deviceTypeAlias\": \"直臂车\"}",
			"modifyPrice": 0,
			"dailyModifyPrice": 0,
			"monthlyModifyPrice": 0,
			"deviceHeight": "18",
			"deviceTypeAlias": "直臂车",
			"isExistSourceRecord": false
		}],
		"allOrderDeviceDetails": [{
			"deviceModel": "RS0407DC",
			"deviceType": "FORK",
			"deviceTypeAlias": "剪叉车",
			"deviceNum": 1,
			"deviceHeight": "4",
			"rentalType": 1,
			"rentalTypeDesc": "日租",
			"shortestRentalPeriod": 1,
			"estimatedRentalPeriod": 2,
			"handoverTime": "2024-04-10 10:08:00",
			"dailyRent": 2,
			"monthlyRent": 3,
			"deviceRent": 3.000
		}, {
			"deviceModel": "RS1012HD",
			"deviceType": "FORK",
			"deviceTypeAlias": "剪叉车",
			"deviceNum": 12,
			"deviceHeight": "10",
			"rentalType": 1,
			"rentalTypeDesc": "日租",
			"shortestRentalPeriod": 12,
			"estimatedRentalPeriod": 15,
			"handoverTime": "2024-04-15 17:18:00",
			"dailyRent": 123,
			"monthlyRent": 366,
			"deviceRent": 366.000
		}, {
			"deviceModel": "RST20E",
			"deviceType": "ARM",
			"deviceTypeAlias": "直臂车",
			"deviceNum": 11,
			"deviceHeight": "18",
			"rentalType": 1,
			"rentalTypeDesc": "日租",
			"shortestRentalPeriod": 14,
			"estimatedRentalPeriod": 25,
			"handoverTime": "2024-04-15 17:26:00",
			"dailyRent": 1236,
			"monthlyRent": 5555,
			"deviceRent": 5555.000
		}]
	},
	"defaultData": {}
}
```



### 文档资料

[Flutter-最主要的常用快捷键](https://juejin.cn/post/7037394075967815710)