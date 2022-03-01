import 'package:express/providers/auth_provider.dart';
import 'package:express/views/home/home_screen.dart';
import 'package:express/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthGurd extends StatelessWidget {
  const AuthGurd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
        builder: (context, auth, child) => Container(
              child: auth.getIsLoggedIn == true ? HomeScreen() : LoginScreen(),
            ));
  }
}
