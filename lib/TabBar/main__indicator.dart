import 'package:flutter/material.dart';
import 'package:flutter_util/delegate/animation_tab_indicator.dart';

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
            indicator: AnimationTabIndicator(
              tabController: _ctrlTab,
              borderSide: BorderSide(width: 10),
              indicatorWidth: 4,
              indicatorBottom: 4,
            ),
            tabs: const [
              Tab(text: '服装'),
              Tab(text: '鞋帽'),
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
