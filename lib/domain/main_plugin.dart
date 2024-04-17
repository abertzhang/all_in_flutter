import 'package:flutter/material.dart';
import 'package:util_plugin/util_plugin.dart';

void main() => runApp(const MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final plugin = UtilPlugin();
  String? proxyInfo;
  String? version;
  @override
  void initState() {
    super.initState();
    initData();
  }

  Future initData() async {
    version = await plugin.getPlatformVersion() ?? 'nothing';
    proxyInfo = await plugin.getProxyInfo();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('sdk版本号:$version '),
          Text('代理信息:$proxyInfo'),
        ],
      ),
    );
  }
}

/*
  String? proxyInfo = await DeviceProxy().getProxy();
  HttpOverrides.global =ProxyHttpOverrides(proxyInfo);

    String? proxyInfo;
    DeviceProxy().getProxy().then((value) => proxyInfo = value);
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      client.findProxy = (url) {
        if (proxyInfo == null || proxyInfo == '') return 'DIRECT';
        return "PROXY $proxyInfo";
      };
      //忽略证书
      client.badCertificateCallback = (cert, host, port) => true;
    };
*/
