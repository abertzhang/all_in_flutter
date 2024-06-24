import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliver主轴分类'),
      ),
      body: CustomScrollView(
        anchor: 0.2,
        scrollDirection: Axis.vertical,
        slivers: [
          //标签-1
          SliverMainAxisGroup(
            slivers: [
              const SliverPersistentHeader(
                pinned: true,
                delegate: HeaderDelegate('标签-1'),
              ),
              //装饰器
              DecoratedSliver(
                decoration: BoxDecoration(color: Colors.blueGrey),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (ctx, idx) => Text('$idx'),
                    childCount: 50,
                  ),
                ),
              ),
            ],
          ),
          //标签-2
          SliverMainAxisGroup(
            slivers: [
              const SliverPersistentHeader(
                pinned: true,
                delegate: HeaderDelegate('标签-2'),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (ctx, idx) => Text('$idx'),
                  childCount: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  const HeaderDelegate(this.title);
  final String title;
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      alignment: Alignment.centerLeft,
      color: const Color(0xffF6F6F6),
      padding: const EdgeInsets.only(left: 20),
      height: 40,
      child: Text(title),
    );
  }

  @override
  double get maxExtent => minExtent;
  @override
  double get minExtent => 40;
  @override
  bool shouldRebuild(covariant HeaderDelegate oldDelegate) => title != oldDelegate.title;
}
