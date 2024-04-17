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
  int? sum = 0;
  String? version;
  @override
  void initState() {
    super.initState();
    initData();
  }

  Future initData() async {
    version = await plugin.getPlatformVersion() ?? 'nothing';
    // sum = await plugin.add();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('$version ,$sum'),
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
