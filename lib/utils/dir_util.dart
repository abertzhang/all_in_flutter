import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

/// 文件目录扩展工具

class DirUtil {
  ///获取缓存目录路径 设备上未备份的临时目录的路径，适用于存储下载文件的缓存。
  static Future<String> getCacheDirPath() async {
    Directory directory = await getTemporaryDirectory();
    return directory.path;
  }

  ///获取文件缓存目录路径 将此文件用于您不想向用户公开的文件。 您的应用不应将此目录用于用户数据文件
  static Future<String> getFilesDirPath() async {
    Directory directory = await getApplicationSupportDirectory();
    return directory.path;
  }

  ///获取文档存储目录路径 应用程序可能在其中放置用户生成的数据或应用程序无法重新创建的数据的目录路径。
  static Future<String> getDocumentsDirPath() async {
    Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // 获取本地临时目录容量
  static Future<String> getLocalCache() async {
    try {
      Directory tempDir = await getTemporaryDirectory();
      double value = await _getTotalSizeOfFilesInDir(tempDir);
      return _renderSize(value);
    } catch (err) {
      print(err);
    }
    return "0.00B";
  }

  // 清空缓存
  static clearCache() async {
    try {
      Directory tempDir = await getTemporaryDirectory();
      await _delDir(tempDir);
      debugPrint('清除缓存成功');
    } catch (e) {
      debugPrint('清除缓存失败');
    } finally {
      //此处隐藏加载loading
    }
  }

  /// 递归方式 计算文件的大小
  static Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    try {
      if (file is File) {
        int length = await file.length();
        return double.parse(length.toString());
      }
      if (file is Directory) {
        final List<FileSystemEntity> children = file.listSync();
        double total = 0;

        for (final FileSystemEntity child in children) total += await _getTotalSizeOfFilesInDir(child);
        return total;
      }
      return 0;
    } catch (e) {
      print(e);
      return 0;
    }
  }

  // 格式化字符串
  static String _renderSize(double? value) {
    if (null == value) {
      return "0.00B";
    }
    List<String> unitArr = ['B', 'K', 'M', 'G'];
    int index = 0;
    while (value! > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }

  static Future<Null> _delDir(FileSystemEntity file) async {
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      for (final FileSystemEntity child in children) {
        await _delDir(child);
      }
    }
    await file.delete();
  }

  // 格式化字符串
  static String renderSizeMinK(double? value) {
    if (null == value) {
      return "0.00K";
    }
    List<String> unitArr = ['K', 'M', 'G'];
    int index = 0;
    while (value! > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }
}
