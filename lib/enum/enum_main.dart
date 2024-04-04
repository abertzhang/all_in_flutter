/*
 * create by abert.zhang
 */

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

//dart 2.17之后加强了枚举
enum PortType {
  usbA('USB-A', true),
  usbC('USB-C', false),
  lightning('LIGHTNING', false),
  unknown('unknown', false);

  final String name;
  final bool isUsbA;
  const PortType(this.name, [this.isUsbA = true]);
  static PortType fromString(String str) {
    return values.firstWhereOrNull((item) => item.name == str.toUpperCase()) ?? PortType.unknown;
  }

  static bool isUsb(PortType type) {
    return type == PortType.usbA || type == PortType.usbC;
  }
}

extension on PortType {
  bool get isUsb => name.startsWith('USB');
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PortType a = PortType.usbC;
  PortType b = PortType.fromString('LIGHTNING');

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('枚举新功能')),
        body: const Demo(),
      ),
    ),
  );
}

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('87');
  }
}
