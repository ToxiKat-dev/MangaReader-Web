import 'package:flutter/material.dart';
import 'package:mangareader/settings/themes.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return Scaffold(
          appBar: AppBar(title: const Text("Settings")),
          body: ListView(
            children: <Widget>[
              ListTile(
                title: const Text("Follow System Theme"),
                trailing: Switch(
                  value: themeNotifier.useSystemTheme,
                  onChanged: themeNotifier.setUseSystemTheme,
                ),
              ),
              ListTile(
                title: const Text("Dark Theme"),
                trailing: Switch(
                  value: themeNotifier.isDarkTheme,
                  onChanged: themeNotifier.setDarkTheme,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
