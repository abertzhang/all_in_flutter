import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../progress/line_gradient_progress.dart';
import '../provider/upgrade_provider.dart';

class UpgradeDialog extends Dialog {
  const UpgradeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UpgradeProvider()),
      ],
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: SizedBox(
            width: 0.85.sw,
            child: Consumer<UpgradeProvider>(builder: (context, model, child) {
              return (Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 870 / 423,
                    child: Image.asset('assets/images/bg_update_top.png', fit: BoxFit.fill),
                  ),
                  model.download ? _buildProgressView(model) : _buildContentView(context, model),
                ],
              ));
            }),
          ),
        ),
      ),
    );
  }

  _buildContentView(BuildContext context, UpgradeProvider model) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            constraints: const BoxConstraints(minHeight: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '是否升级到${model.bean?.versionName ?? '0.0.0'}版本？',
                  style: const TextStyle(fontSize: 15, color: Color(0xFF333333), fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                Text(
                  // '新版本大小：${DirectoryUtils.renderSizeMinK(model.appSize)}',
                  '新版本大小：${model.appSize / 1024}k',
                  style: const TextStyle(fontSize: 14, color: Color(0xFF333333), height: 2.0, letterSpacing: 0.4),
                ),
                Text(
                  model.bean?.modifyContent ?? "",
                  style: const TextStyle(fontSize: 14, color: Color(0xFF333333), height: 1.5, letterSpacing: 0.4),
                ),
              ],
            )),
        Divider(
          color: Colors.grey[300],
          thickness: 1,
          height: 0,
        ),
        Container(
          width: double.infinity,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
          ),
          child: _buildButton(context),
        ),
      ],
    );
  }

  // 进度条样式
  _buildProgressView(UpgradeProvider model) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(5)),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LineGradientProgress(
            width: 1.sw,
            height: 50,
            bgColor: const Color(0xFFE8E8E8),
            colors: const [Color(0xFFFECE75), Color(0xFFFAA23D)],
            progress: model.progress,
            fontColor: Colors.white,
            fontSize: 12,
            content: '%',
            inside: true,
            animation: false,
          ),
          const SizedBox(height: 10),
          const Text(
            '版本正在努力更新中，请稍后',
            style: TextStyle(color: Color(0xFF666666), fontSize: 13),
          ),
        ],
      ),
    );
  }

  // 底部按钮
  _buildButton(BuildContext context) {
    // 强制升级
    if (context.read<UpgradeProvider>().bean?.updateStatus == 2) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: TextButton(
          onPressed: () => context.read<UpgradeProvider>().downLoadApp(context),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFFFFAC5D)),
            overlayColor: MaterialStateProperty.all(const Color(0xFFE78A30)),
          ),
          child: const Text(
            '我要升级',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextButton(
            onPressed: () => context.read<UpgradeProvider>().ignorePop(context),
            child: const Text(
              '忽略此版本',
              style: TextStyle(color: Color(0xFF666666), fontSize: 15),
            ),
          ),
        ),
        VerticalDivider(
          width: 1,
          color: Colors.grey[300],
          thickness: 1,
        ),
        Expanded(
          child: TextButton(
            onPressed: () => context.read<UpgradeProvider>().downLoadApp(context),
            child: const Text(
              '我要升级',
              style: TextStyle(color: Color(0xFFFFAC5D), fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
