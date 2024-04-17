import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:util_plugin/util_plugin.dart';
import 'package:util_plugin/util_plugin_method_channel.dart';
import 'package:util_plugin/util_plugin_platform_interface.dart';

class MockUtilPluginPlatform with MockPlatformInterfaceMixin implements UtilPluginPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> getProxyInfo() async => 'proxyInfo';
}

void main() {
  final UtilPluginPlatform initialPlatform = UtilPluginPlatform.instance;

  test('$MethodChannelUtilPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelUtilPlugin>());
  });

  test('getPlatformVersion', () async {
    UtilPlugin utilPlugin = UtilPlugin();
    MockUtilPluginPlatform fakePlatform = MockUtilPluginPlatform();
    UtilPluginPlatform.instance = fakePlatform;

    expect(await utilPlugin.getPlatformVersion(), '42');
  });
}
