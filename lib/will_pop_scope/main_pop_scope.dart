import 'package:flutter/material.dart';

import '../will_pop_scope/first_page.dart';
import '../will_pop_scope/second_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLock = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('返回WillPopScope'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => const FirstPage()),
                );
              },
              child: const Text('FirstPage'),
            ),
            const SizedBox(height: 100),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => const SecondPage()),
                );
              },
              child: Text('SecondPage'),
            )
          ],
        ),
      ),
    );
  }
}
