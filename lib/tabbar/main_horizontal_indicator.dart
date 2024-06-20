import 'package:flutter/material.dart';
import 'package:flutter_util/delegate/custom_tab_indicator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(home: TabPage()));
}

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  late final TabController _ctrlTab = TabController(vsync: this, length: 3);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('特效演示'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: TabBar(
            controller: _ctrlTab,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: const CustomTabIndicator(
              color: Colors.red,
              paddingBottom: 9,
              width: 30,
              height: 4,
              gradient: LinearGradient(
                colors: [Colors.brown, Colors.amberAccent, Colors.red],
              ),
            ),
            tabs: const [
              Tab(text: '服装泗安'),
              Tab(text: '鞋帽空'),
              Tab(text: '童装'),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _ctrlTab,
        children: const [
          Text('112'),
          Text('112'),
          Text('112'),
        ],
      ),
    );
  }
}
