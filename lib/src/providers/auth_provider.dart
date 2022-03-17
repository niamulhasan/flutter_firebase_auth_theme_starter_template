import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  final AuthService _authService = AuthService(FirebaseAuth.instance);
  String? _error;
  String? _messege;

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
    _messege = "Check your phone for verification code";
    notifyListeners();
  }

  Future<bool> login(smsCode) async {
    if (await _authService.loginWithPhoneNumber(smsCode: smsCode)) {
      _isLoggedIn = true;
      return true;
    } else {
      _error = _authService.getError;
      notifyListeners();
    }
    return false;
  }

  logout() async {
    await _authService.logout();
    _isLoggedIn = false;
    notifyListeners();
  }

  String? getError() => "$_error";

  String? getMessege() => "$_messege";
}
