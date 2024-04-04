import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(
      const ProviderScope(child: MaterialApp(home: HomePage())),
    );

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            AsyncValue<Configuration> future = ref.watch(configProvider);
            return future.when(
              data: (data) => Text('json:${data.toMap()}'),
              error: (err, stack) => Text('$err'),
              loading: () => const CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

final configProvider = FutureProvider<Configuration>((ref) async {
  // var result = await rootBundle.loadString('../riverpod/configuration.json');
  ImmutableBuffer result = (await rootBundle.loadBuffer('../riverpod/configuration.json'));
  debugPrint('读取文件');
  debugPrint(result as String);

  final content = json.decode(result.toString()) as Map<String, Object?>;
  // return Configuration.fromMap({'name': 'zhang', 'age': 17});
  return Configuration.fromMap(content);
});

class Configuration {
  String? url;
  String? name;
  int? age;

  Configuration({
    this.url,
    this.name,
    this.age,
  });

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'name': name,
      'age': age,
    };
  }

  factory Configuration.fromMap(dynamic map) {
    if (null == map) return Configuration();
    var temp;
    return Configuration(
      url: map['url']?.toString(),
      name: map['name']?.toString(),
      age: null == (temp = map['age']) ? null : (temp is num ? temp.toInt() : int.tryParse(temp)),
    );
  }
}
