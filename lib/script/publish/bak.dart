import 'dart:io';

main() async {
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
}
