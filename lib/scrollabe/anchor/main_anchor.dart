import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(home: AnchorHomePage()));
}

class AnchorHomePage extends StatefulWidget {
  const AnchorHomePage({super.key});

  @override
  State<AnchorHomePage> createState() => _AnchorHomePageState();
}

class _AnchorHomePageState extends State<AnchorHomePage> {
  List<AnchorProperty> anchorProperties = [];
  ScrollController ctrlScroll = ScrollController();
  @override
  void initState() {
    super.initState();
    anchorProperties.add(AnchorProperty(id: '1', label: '新闻', key: GlobalKey()));
    anchorProperties.add(AnchorProperty(id: '2', label: '体育', key: GlobalKey()));
    anchorProperties.add(AnchorProperty(id: '3', label: '汽车', key: GlobalKey()));
    anchorProperties.add(AnchorProperty(id: '4', label: '国外', key: GlobalKey()));
  }

  // final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _key,
      appBar: AppBar(title: const Text('锚点跳转')),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Scrollable.ensureVisible(anchorProperties[0].key!.currentContext!);
              },
              child: Text('新闻'),
            ),
            GestureDetector(
              onTap: () {
                RenderObject object = anchorProperties[1].key!.currentContext!.findRenderObject()!;
                final RenderAbstractViewport viewport = RenderAbstractViewport.of(object);
                double target = clampDouble(viewport.getOffsetToReveal(object, 0.0).offset, 1, 2);
                ctrlScroll.animateTo(target - 100, duration: Duration(seconds: 3), curve: Curves.bounceIn);
                // Scrollable.ensureVisible(anchorProperties[1].key!.currentContext!);
              },
              child: Text('体育'),
            ),
            GestureDetector(
              onTap: () {
                Scrollable.ensureVisible(anchorProperties[2].key!.currentContext!);
              },
              child: Text('汽车'),
            ),
            GestureDetector(
              onTap: () {
                Scrollable.ensureVisible(anchorProperties[3].key!.currentContext!);
              },
              child: Text('国外'),
            ),
          ],
        ),
        Expanded(child: Scrollable(
          // controller: ctrlScroll,
          viewportBuilder: (BuildContext context, ViewportOffset position) {
            return SingleChildScrollView(
              controller: ctrlScroll,
              child: Column(
                children: [
                  SizedBox(
                    key: anchorProperties[0].key,
                    height: 500,
                    child: Container(
                      color: Colors.greenAccent,
                    ),
                  ),
                  SizedBox(
                    key: anchorProperties[1].key,
                    height: 600,
                    child: Container(
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(
                    key: anchorProperties[2].key,
                    height: 300,
                    child: Container(
                      color: Colors.amberAccent,
                    ),
                  ),
                  SizedBox(
                    key: anchorProperties[3].key,
                    height: 1600,
                    child: Container(
                      color: Colors.cyanAccent,
                    ),
                  ),
                ],
              ),
            );
          },
        ))
      ],
    );
  }
}

class AnchorProperty {
  GlobalKey? key;
  String id;
  String label;

  AnchorProperty({this.key, required this.id, required this.label});
}
