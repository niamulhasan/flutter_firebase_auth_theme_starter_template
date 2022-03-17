import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'src/config/colors_themes.dart';
import 'src/providers/auth_provider.dart';
import 'src/providers/theme_provider.dart';
import 'src/views/layouts/material_app.dart';

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
            defaultThemeName: "Light",
            themes: [
              {"Light": MyThemeData.lightYellowTheme()},
              {"Dark": MyThemeData.darkYellowTheme()}
            ],
          ),
        ),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: const MaterialAppScreen(),
    ),
  );
}
