import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'service.dart';
import 'theme.dart';

void main() {
  Get.putAsync(() async => AppService());
  runApp(DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<AppService>(
      builder: (logic) {
        return GetMaterialApp(
          theme: themeLight,
          darkTheme: themeDark,
          themeMode: logic.themeMode.value,
          home: HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('GetService'),
          GetX<AppService>(
            builder: (logic) {
              return Radio<ThemeMode>(
                value: logic.themeMode.value,
                groupValue: ThemeMode.dark,
                onChanged: (v) {
                  debugPrint((v as ThemeMode).toString());
                  if (v == ThemeMode.light) {
                    logic.modifyThemeMode(ThemeMode.dark);
                  } else {
                    logic.modifyThemeMode(ThemeMode.light);
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}
