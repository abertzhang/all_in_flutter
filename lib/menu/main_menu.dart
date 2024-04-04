import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LogUtil.init(tag: 'Logger', isDebug: !const bool.fromEnvironment("dart.vm.product"));

  runApp(MaterialApp(
    theme: ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.green,
    ),
    home: const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MenuController ctrlMenu = MenuController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              // if (ctrlMenu.isOpen) {
              //   ctrlMenu.open();
              // } else {
              //   ctrlMenu.close();
              // }
            },
            child: const Center(
              child: Text('MenuAnchor'),
            ),
          ),
          Container(
            color: Colors.amber,
            margin: const EdgeInsets.only(top: 20),
            child: MenuAnchor(
              controller: ctrlMenu,
              anchorTapClosesMenu: true,
              menuChildren: const [
                Text('1'),
                Text('2'),
                Text('3'),
              ],
              child: const Text('menu'),
            ),
          ),
          MenuBar(controller: ctrlMenu, children: [
            Text('11'),
            Text('21'),
            Text('31'),
          ])
        ],
      ),
    );
  }
}
