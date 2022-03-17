import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../screens/login/login_screen.dart';

class AuthGurd extends StatelessWidget {
  final bool _isAuthProtected;
  final Widget _widget;
  const AuthGurd(
      {Key? key, required bool isAuthProtected, required Widget widget})
      : _isAuthProtected = isAuthProtected,
        _widget = widget,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, child) => Container(
        child: auth.getIsLoggedIn == true ? _widget : LoginScreen(),
      ),
    );
  }
}
