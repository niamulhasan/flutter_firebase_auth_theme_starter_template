import 'package:express/config/colors_themes.dart';
import 'package:express/providers/auth_provider.dart';
import 'package:express/providers/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'views/material_app_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Color(0xffbb00),
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(
            AppTheme.darkYellow,
            themes: [
              {AppTheme.darkYellow: MyThemeData.lightYellowTheme()},
              {AppTheme.lightYellow: MyThemeData.darkYellowTheme()}
            ],
          ),
        ),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MaterialAppScreen(),
    ),
  );
}
