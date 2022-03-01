import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth_gurd.dart';
import '../providers/theme_provider.dart';

class MaterialAppScreen extends StatelessWidget {
  const MaterialAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.getTheme(),
        // home: HomeScreen(),
        // home: LoginScreen(),
        home: AuthGurd(),
      ),
    );
  }
}
