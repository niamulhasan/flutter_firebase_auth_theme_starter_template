import 'package:express/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  final AuthService _authService = AuthService(FirebaseAuth.instance);

  AuthProvider() {
    if (_authService.getCurrentUser != null) {
      _isLoggedIn = true;
    } else {
      _isLoggedIn = false;
    }
    notifyListeners();
  }

  bool get getIsLoggedIn => _isLoggedIn;

  void setIsLoggedIn(bool isLoggedIn) => _isLoggedIn = isLoggedIn;

  void verifyNumber(phoneNumber) {
    _authService.verifyPhoneNumber(phoneNumber: phoneNumber);
  }

  Future<bool> login(smsCode) async {
    return await _authService.loginWithPhoneNumber(smsCode: smsCode);
  }

  logout() async {
    await _authService.logout();
    _isLoggedIn = false;
    notifyListeners();
  }
}
