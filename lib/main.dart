import 'package:flutter/material.dart';
import 'package:mangareader/views/home_page.dart';
import 'package:mangareader/settings/themes.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeNotifier();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeNotifier.useSystemTheme
              ? ThemeMode.light
              : themeNotifier.isDarkTheme
                  ? ThemeMode.dark
                  : ThemeMode.light,
          home: const HomePage(),
        );
      },
    );
  }
}
