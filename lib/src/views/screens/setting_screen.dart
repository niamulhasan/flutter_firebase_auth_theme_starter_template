import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ternav_icons/ternav_icons.dart';

import '../../config/colors_themes.dart';
import '../../providers/theme_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        child: ListView(
          children: [ThemeToggleTile()],
        ),
      ),
    );
  }
}

class ThemeToggleTile extends StatelessWidget {
  const ThemeToggleTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, theme, child) {
      return ListTile(
        leading: Icon(TernavIcons.bold.sun),
        title: Text("Theme"),
        subtitle:
            theme.getThemeName() == "Light" ? Text("Light") : Text("Dark"),
        trailing: ElevatedButton(
          onPressed: () {
            if (theme.getThemeName() == "Light") {
              theme.setTheme("Dark");
            } else {
              theme.setTheme("Light");
            }
          },
          child: Text(
            'Change',
            // style: TextStyle(color: Colors.black),
          ),
        ),
      );
    });
  }
}
