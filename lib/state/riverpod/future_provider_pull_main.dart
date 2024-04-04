//下拉更新
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(const ProviderScope(
      child: MaterialApp(home: HomePage()),
    ));

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: Center(
      child: Consumer(
        builder: (context, ref, child) {
          AsyncValue<int> future = ref.watch(randomNumberProvider);
          return future.when(
              error: (err, stack) => Text('$err'),
              loading: () => const CircularProgressIndicator(),
              data: (val) {
                return RefreshIndicator(child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Container(
                        width: double.infinity,
                        height: constraints.maxHeight,
                        alignment: Alignment.center,
                        color: Colors.lightBlue,
                        child: Text('$val'),
                      ),
                    );
                  },
                ), onRefresh: () async {
                  return ref.refresh(randomNumberProvider);
                });
              });
        },
      ),
    ));
  }
}

Random random = Random();
final randomNumberProvider = FutureProvider((ref) async {
  int number = await Future.delayed(const Duration(seconds: 3), () {
    return random.nextInt(100);
  });
  return number;
});
