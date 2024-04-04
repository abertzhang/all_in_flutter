import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('点赞特效')),
        body: const TikTokVideoGesture(
          child: Center(child: Text('点赞')),
        ),
      ),
    ),
  );
}

//
class TikTokVideoGesture extends StatefulWidget {
  const TikTokVideoGesture({
    Key? key,
    required this.child,
    this.onAddFavorite,
    this.onSingleTap,
  }) : super(key: key);

  final Function? onAddFavorite;
  final Function? onSingleTap;
  final Widget child;

  @override
  _TikTokVideoGestureState createState() => _TikTokVideoGestureState();
}

class _TikTokVideoGestureState extends State<TikTokVideoGesture> {
  final GlobalKey _globalKey = GlobalKey();

  // 内部转换坐标点
  Offset _p(Offset p) {
    RenderBox getBox = _globalKey.currentContext?.findRenderObject() as RenderBox;
    return getBox.globalToLocal(p);
  }

  List<Offset> icons = [];
  //是否可以增加爱心
  bool canAddFavorite = false;
  //
  bool justAddFavorite = false;
  late Timer? timer;

  @override
  Widget build(BuildContext context) {
    //所有爱心层
    var iconStack = AbsorbPointer(
      absorbing: true,
      child: Container(
        color: Colors.red.withOpacity(0.3),
        child: Stack(
          children: icons
              .map<Widget>(
                (p) => TikTokFavoriteAnimationIcon(
                  key: Key(p.toString()),
                  position: p,
                  onAnimationComplete: () {
                    icons.remove(p);
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
    return GestureDetector(
      key: _globalKey,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      child: Stack(
        children: <Widget>[widget.child, iconStack],
      ),
    );
  }

  //点击--按下状态
  void onTapDown(TapDownDetails details) {
    if (canAddFavorite) {
      debugPrint('添加爱心，当前爱心数量:${icons.length}');
      icons.add(_p(details.globalPosition));
      widget.onAddFavorite?.call();
      justAddFavorite = true;
    } else {
      justAddFavorite = false;
    }
    setState(() {});
  }

  //单击--提起状态
  void onTapUp(TapUpDetails details) {
    // if (timer == null) return;
    // timer?.cancel();
    var delay = canAddFavorite ? 120 : 60;
    timer = Timer(Duration(milliseconds: delay), () {
      canAddFavorite = false;
      timer = null;
      if (!justAddFavorite) {
        widget.onSingleTap?.call();
      }
    });
    canAddFavorite = true;
  }
}

//
class TikTokFavoriteAnimationIcon extends StatefulWidget {
  final Offset? position;
  final double size;
  final Function? onAnimationComplete;

  const TikTokFavoriteAnimationIcon({
    Key? key,
    this.onAnimationComplete,
    this.position,
    this.size = 100,
  }) : super(key: key);

  @override
  _TikTokFavoriteAnimationIconState createState() => _TikTokFavoriteAnimationIconState();
}

class _TikTokFavoriteAnimationIconState extends State<TikTokFavoriteAnimationIcon> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _animationController = AnimationController(
      lowerBound: 0,
      upperBound: 1,
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animationController.addListener(() {
      setState(() {});
    });
    startAnimation();
    super.initState();
  }

  startAnimation() async {
    await _animationController.forward();
    widget.onAnimationComplete?.call();
  }

  double rotate = pi / 10.0 * (2 * Random().nextDouble() - 1);

  double get value => _animationController.value;

  double appearDuration = 0.1;
  double dismissDuration = 0.8;

  double get opa {
    if (value < appearDuration) {
      return 0.99 / appearDuration * value;
    }
    if (value < dismissDuration) {
      return 0.99;
    }
    var res = 0.99 - (value - dismissDuration) / (1 - dismissDuration);
    return res < 0 ? 0 : res;
  }

  double get scale {
    if (value < appearDuration) {
      return 1 + appearDuration - value;
    }
    if (value < dismissDuration) {
      return 1;
    }
    return (value - dismissDuration) / (1 - dismissDuration) + 1;
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Icon(
      Icons.favorite,
      size: widget.size,
      color: Colors.redAccent,
    );
    content = ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (Rect bounds) => RadialGradient(
        center: Alignment.topLeft.add(const Alignment(0.66, 0.66)),
        colors: const [Color(0xffEF6F6F), Color(0xffF03E3E)],
      ).createShader(bounds),
      child: content,
    );
    Widget body = Transform.rotate(
      angle: rotate,
      child: Opacity(
        opacity: opa,
        child: Transform.scale(
          alignment: Alignment.bottomCenter,
          scale: scale,
          child: content,
        ),
      ),
    );
    return widget.position == null
        ? Container()
        : Positioned(
            left: (widget.position?.dx ?? 0) - widget.size / 2,
            top: (widget.position?.dy ?? 0) - widget.size / 2,
            child: body,
          );
  }
}
