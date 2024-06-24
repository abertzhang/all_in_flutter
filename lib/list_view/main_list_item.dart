import 'package:flutter/material.dart';
import 'package:scrollview_observer/scrollview_observer.dart';

/*
scrollview_observer: ^1.20.0
*/

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
  ScrollController ctrlScroll = ScrollController();
  late ListObserverController ctrlObserver;
  @override
  void initState() {
    super.initState();
    ctrlObserver = ListObserverController(controller: ctrlScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('跳转到指定item'),
        actions: [
          TextButton(
              onPressed: () {
                // ctrlObserver.jumpTo(index: 40);
                ctrlObserver.animateTo(
                  offset: (offset) {
                    return 900;
                  },
                  index: 0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceIn,
                );
              },
              child: const Text(
                '跳转',
                style: TextStyle(color: Colors.black38),
              )),
        ],
      ),
      body: ListViewObserver(
        controller: ctrlObserver,
        child: ListView.builder(
          controller: ctrlScroll,
          itemBuilder: (ctx, idx) {
            return Card(
              child: ListTile(
                title: Text(idx.toString()),
              ),
            );
          },
          itemCount: 50,
          itemExtent: 70,
        ),
        onObserve: (resultMode) {
          print('fist-index--${resultMode.firstChild?.index}');
          //
          print('displaying--${resultMode.displayingChildIndexList}');
        },
      ),
    );
  }
}
