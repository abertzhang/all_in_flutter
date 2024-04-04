import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('普通渐变边框')),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Column(
      children: [
        Container(
          height: 48,
          width: 280,
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), gradient: LinearGradient(colors: [Colors.blue, Colors.red])),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white),
            child: Text(
              '渐变色-1',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
