import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LogUtil.init(tag: 'Logger', isDebug: !const bool.fromEnvironment("dart.vm.product"));

  runApp(const MaterialApp(home: HomePage()));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 200),
          Center(
            child: Container(
              width: 300,
              // color: Colors.red,
              // height: 100,
              child: DropdownButton<String>(
                isExpanded: true,
                elevation: 0,
                underline: Container(height: 1, color: Colors.transparent),
                value: 'sdf',
                items: const <DropdownMenuItem<String>>[
                  DropdownMenuItem(child: Text('大陆'), value: 'da'),
                  DropdownMenuItem(child: Text('sdk'), value: 'sd'),
                  DropdownMenuItem(child: Text('大sd陆'), value: 'sdf'),
                  DropdownMenuItem(child: Text('大hg陆'), value: 'sdf1'),
                ],
                onChanged: (val) {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
