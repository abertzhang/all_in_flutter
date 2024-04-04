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
          AsyncValue<int> future = ref.watch(numberProvider);
          return future.when(
            data: (val) => Text('total is $val'),
            error: (err, stack) => Text('$err'),
            loading: () => const CircularProgressIndicator(),
          );
        },
      ),
    ));
  }
}

final anotherNumberProvider = FutureProvider<int>((ref) async {
  int number = await Future.delayed(const Duration(seconds: 3), () => 200);
  return number;
});
final numberProvider = FutureProvider<int>((ref) async {
  int number = await Future.delayed(const Duration(seconds: 2), () => 100);
  int anotherNumber = await ref.watch(anotherNumberProvider.future);
  return number + anotherNumber;
});
