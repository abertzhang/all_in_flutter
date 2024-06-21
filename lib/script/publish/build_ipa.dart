import 'dart:io';

import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:yaml/yaml.dart';

import 'pgy_tool.dart';

void main() async {
  const originIpaName = '你的应用名称';
  //是否上传蒲公英
  bool uploadPGY = true;

  // 获取项目根目录
  final _projectPath = await Process.run(
    'pwd',
    [],
  );
  final projectPath = (_projectPath.stdout as String).replaceAll(
    '\n',
    '',
  );
  // 控制台打印项目目录
  stdout.write('项目目录：$projectPath 开始编译\n');

  // 编译目录
  final buildPath = '$projectPath/build/ios';

  // 切换到项目目录
  Directory.current = projectPath;

  // 删除之前的构建文件
  if (Directory(buildPath).existsSync()) {
    Directory(buildPath).deleteSync(
      recursive: true,
    );
  }

  final process = await Process.start(
    'flutter',
    [
      'build',
      'ipa',
      '--target=$projectPath/lib/main.dart',
      '--verbose',
    ],
    workingDirectory: projectPath,
    mode: ProcessStartMode.inheritStdio,
  );

  final buildResult = await process.exitCode;
  if (buildResult != 0) {
    stdout.write('ipa 编译失败，请查看日志');
    return;
  }

  process.kill();
  stdout.write('ipa 编译成功！\n');

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

  // ipa 的输出目录
  final ipaDirectory = '$projectPath/build/ios/ipa/';
  const buildAppName = '$originIpaName.ipa';
  // final timeStr = DateFormat('yyyyMMddHHmm').format(DateTime.now());
  final timeStr = DateUtil.formatDate(DateTime.now(), format: DateFormats.y_mo_d_h_m);

  final resultNameList = [
    appName,
    version,
    timeStr,
  ].where((element) => element != null).toList();

  final resultAppName = '${resultNameList.join('_')}.ipa';
  final appPath = ipaDirectory + resultAppName;

  //重命名ipa文件
  final ipaFile = File(ipaDirectory + buildAppName);
  await ipaFile.rename(appPath);
  stdout.write('ipa 打包成功 >>>>> $appPath \n');

  if (uploadPGY) {
    // 上传蒲公英
    final pgyPublisher = PGYTool(
      apiKey: '蒲公英控制台内你的应用的apiKey',
      buildType: 'ios',
    );
    pgyPublisher.publish(appPath);
  } else {
    // 直接打开文件
    await Process.run(
      'open',
      [ipaDirectory],
    );
  }
}
