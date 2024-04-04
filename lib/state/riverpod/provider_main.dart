import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = Provider((ref) => ThemeMode.light);
void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        // Home uses the default behavior for all providers.
        home: HomePage(),
        routes: {
          // Overrides themeProvider for the /gallery route only
          '/gallery': (_) => ProviderScope(
                overrides: [
                  themeProvider.overrideWithValue(ThemeMode.dark),
                ],
                child: Text('scope'),
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
        body: Column(
      children: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/gallery');
            },
            child: Text('跳转'))
      ],
    ));
  }
}
