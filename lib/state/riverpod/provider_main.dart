import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = Provider((ref) => ThemeMode.light);
void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        // Home uses the default behavior for all providers.
        home: const HomePage(),
        routes: {
          // Overrides themeProvider for the /gallery route only
          '/gallery': (_) => ProviderScope(
                overrides: [
                  themeProvider.overrideWithValue(ThemeMode.dark),
                ],
                child: const MaterialApp(
                    home: Scaffold(
                  body: Center(child: Text('第二页')),
                )),
              ),
        },
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/gallery');
          },
          child: const Text('跳转')),
    ));
  }
}
