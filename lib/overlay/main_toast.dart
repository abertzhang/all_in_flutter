import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // LogUtil.init(tag: 'Logger', isDebug: !const bool.fromEnvironment("dart.vm.product"));

  runApp(
    const MaterialApp(home: HomePage()),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final keyMenu = GlobalKey();
  final keyLike = GlobalKey();
  final keyScaffold = GlobalKey();
  final keyToast = GlobalKey();
  ValueNotifier<Alignment> alignment = ValueNotifier(Alignment.bottomCenter);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keyScaffold,
      appBar: AppBar(title: const Text('浮层菜单')),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTapDown: (details) {
          RenderBox renderBox = keyScaffold.currentContext?.findRenderObject() as RenderBox;
          Offset position = renderBox.globalToLocal(details.globalPosition);
          Toast.show(context: context, message: '自定的吐司', offset: position);
        },
        child: SizedBox(
          width: MediaQueryData.fromWindow(window).size.width,
          child: Column(
            children: [
              const SizedBox(height: 100),
              GestureDetector(
                key: keyToast,
                onTapDown: (details) {
                  RenderBox renderBox = keyToast.currentContext?.findRenderObject() as RenderBox;
                  Offset position = renderBox.globalToLocal(details.globalPosition);
                  Toast.show(context: context, message: '自定的吐司', offset: const Offset(150, 600));
                },
                child: const Text('Toast'),
              ),
              const SizedBox(height: 50),
              GestureDetector(
                  onTapDown: (details) {
                    int milliSeconds = 1000;
                    double dx = Random.secure().nextDouble() * 300;
                    double dy = Random.secure().nextDouble() * 300;
                    OverlayLike.addLike(context, Offset(dx, dy), alignment, milliSeconds);
                  },
                  onTapUp: (details) {
                    // alignment.value = Alignment.topCenter;
                  },
                  child: const Text('点赞')),
              const SizedBox(height: 50),
              Container(
                key: keyMenu,
                width: 100,
                height: 60,
                color: Colors.greenAccent.withOpacity(0.3),
                child: TextButton(
                    onPressed: () {
                      debugPrint('菜单');
                      RenderBox renderBox = keyMenu.currentContext?.findRenderObject() as RenderBox;
                      //菜单按钮相对Offset.zero的位置,菜单按钮的左上角
                      Offset offset = renderBox.localToGlobal(Offset.zero);
                      //菜单按钮大大小
                      double height = renderBox.paintBounds.height;
                      double width = renderBox.paintBounds.width;
                      // debugPrint(size.toString());
                      Offset newOffset = Offset(offset.dx, offset.dy + height);
                      Toast.show(context: context, message: '自定的吐司', offset: newOffset);
                    },
                    child: const Text('菜单')),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

/// 利用overlay实现Toast
class Toast {
  static void show({required BuildContext context, required String message, required Offset offset}) {
    //创建一个OverlayEntry对象
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      //外层使用Positioned进行定位，控制在Overlay中的位置
      return Positioned(
          top: offset.dy,
          left: offset.dx,
          child: Material(
            child: InkWell(
              onTap: () {},
              child: Center(
                child: Card(
                  color: Colors.grey,
                  child: Padding(padding: const EdgeInsets.all(8), child: Text(message)),
                ),
              ),
            ),
          ));
    });
    //往Overlay中插入插入OverlayEntry
    Overlay.of(context).insert(overlayEntry);
    //两秒后，移除Toast
    Future.delayed(const Duration(seconds: 2)).then((value) {
      overlayEntry.remove();
    });
  }
}

class OverlayLike {
  static void addLike(
    BuildContext context,
    Offset offset,
    ValueNotifier<Alignment> alignment,
    int milliSeconds,
  ) {
    // 新建
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        left: offset.dx,
        top: offset.dy,
        child: LikeAniWidget(milliSeconds: milliSeconds),
      );
    });
    // 插入
    Overlay.of(context).insert(overlayEntry);
    //自动删除
    Future.delayed(Duration(milliseconds: milliSeconds)).then((value) {
      overlayEntry.remove();
    });
  }
}

class LikeAniWidget extends StatefulWidget {
  const LikeAniWidget({
    super.key,
    this.milliSeconds = 3000,
    this.begin = Alignment.bottomCenter,
    this.end = Alignment.topCenter,
  });
  final int milliSeconds;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  @override
  State<LikeAniWidget> createState() => _LikeAniWidgetState();
}

class _LikeAniWidgetState extends State<LikeAniWidget> with SingleTickerProviderStateMixin {
  late AnimationController ctrlAnimation = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: widget.milliSeconds),
  );
  late AlignmentTween alignmentTween;
  late Tween<double> opacity = Tween<double>(begin: 1, end: 0);
  late CurvedAnimation curvedAnimation;
  late CurvedAnimation animationTa;

  @override
  void initState() {
    super.initState();
    alignmentTween = AlignmentTween(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    );
    //easeInQuint,
    animationTa = CurvedAnimation(parent: ctrlAnimation, curve: Curves.easeIn);
    curvedAnimation = CurvedAnimation(parent: ctrlAnimation, curve: Curves.easeInQuart);
    ctrlAnimation.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ctrlAnimation,
      builder: (BuildContext context, Widget? child) {
        return Container(
          width: 100,
          height: 200,
          alignment: alignmentTween.animate(animationTa).value,
          child: Opacity(
            opacity: opacity.animate(curvedAnimation).value,
            child: const Icon(Icons.ac_unit),
          ),
        );
      },
    );
  }
}
