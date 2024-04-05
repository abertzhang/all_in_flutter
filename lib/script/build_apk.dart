import 'dart:io';

import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:yaml/yaml.dart';

import 'pgy_tool.dart'; //蒲公英发布脚本，下面会给出

void main(List<String> args) async {
  //是否上传蒲公英
  bool uploadPGY = true;

  // 获取项目根目录
  final projectPath0 = await Process.run(
    'pwd',
    [],
  );
  final projectPath = (projectPath0.stdout as String).replaceAll(
    '\n',
    '',
  );
  // 控制台打印项目目录
  stdout.write('项目目录：$projectPath 开始编译\n');
  final process = await Process.start(
    'flutter',
    [
      'build',
      'apk',
      '--verbose',
    ],
    workingDirectory: projectPath,
    mode: ProcessStartMode.inheritStdio,
  );
  final buildResult = await process.exitCode;
  if (buildResult != 0) {
    stdout.write('打包失败，请查看日志');
    return;
  }
  process.kill();

  //开始重命名
  final file = File('$projectPath/pubspec.yaml');
  final fileContent = file.readAsStringSync();
  final yamlMap = loadYaml(fileContent) as YamlMap;

  //获取当前版本号
  final version = (yamlMap['version'].toString()).replaceAll(
    '+',
    '_',
  );
  final appName = yamlMap['name'].toString();

  // apk 的输出目录
  final apkDirectory = '$projectPath/build/app/outputs/flutter-apk/';
  const buildAppName = 'app-release.apk';
  // final timeStr = DateFormat('yyyyMMddHHmm').format(DateTime.now());
  final timeStr = DateUtil.formatDate(DateTime.now(), format: DateFormats.y_mo_d_h_m);
  final resultNameList = [
    appName,
    version,
    timeStr,
  ].where((element) => element != null).toList();

  final resultAppName = '${resultNameList.join('_')}.apk';
  final appPath = apkDirectory + resultAppName;

  //重命名apk文件
  final apkFile = File(apkDirectory + buildAppName);
  await apkFile.rename(appPath);
  stdout.write('apk 打包成功 >>>>> $appPath \n');

  if (uploadPGY) {
    // 上传蒲公英
    final pgyPublisher = PGYTool(
      apiKey: '蒲公英控制台内你的应用的apiKey',
      buildType: 'android',
    );
    final uploadSuccess = await pgyPublisher.publish(appPath);
    if (uploadSuccess) {
      File(appPath).delete();
    }
  } else {
    // 直接打开文件
    await Process.run(
      'open',
      [apkDirectory],
    );
  }
}
