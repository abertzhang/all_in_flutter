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
      appBar: AppBar(title: const Text('交叉轴分组')),
      body: CustomScrollView(
        slivers: [
          SliverCrossAxisGroup(
            slivers: [
              DecoratedSliver(
                decoration: BoxDecoration(color: Colors.blueGrey),
                sliver: SliverConstrainedCrossAxis(
                  maxExtent: 100,
                  sliver: SliverColorList(
                    height: 100.0,
                    fontSize: 24,
                    count: 8,
                    color1: Colors.amber[300],
                    color2: Colors.blue[300],
                  ),
                ),
              ),
              SliverCrossAxisExpanded(
                flex: 2, // tag1
                sliver: SliverColorList(
                  height: 80.0,
                  fontSize: 18,
                  count: 15,
                  color1: Colors.green[300],
                  color2: Colors.red[300],
                ),
              ),
              SliverCrossAxisExpanded(
                  flex: 2, // tag2
                  sliver: SliverColorList(
                    height: 50.0,
                    fontSize: 20,
                    count: 6,
                    color1: Colors.purple[300],
                    color2: Colors.orange[300],
                  )),
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

class SliverColorList extends StatelessWidget {
  final double height;
  final double fontSize;
  final Color? color1;
  final Color? color2;
  final int count;
  const SliverColorList({super.key, required this.height, required this.fontSize, required this.count, this.color1, this.color2});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: index.isEven ? color1 : color2,
          height: height,
          child: Center(
            child: Text(
              'Item ${index}',
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        );
      },
      itemCount: count,
    );
  }
}
