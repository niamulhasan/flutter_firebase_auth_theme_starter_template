import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth;
  late String _verificationID;
  User? _user;

  AuthService(this._auth);

  User? get getUser => _user;
  User? get getCurrentUser => FirebaseAuth.instance.currentUser;

  void verifyPhoneNumber({required String phoneNumber}) async {
    try {
      await _auth.verifyPhoneNumber(
        // phoneNumber: _phoneNumberTextController.text,
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await _auth.signInWithCredential(phoneAuthCredential);
          print(
              "Phone Number automatically verified and user loggedin: ${_auth.currentUser!.uid}");
        },
        verificationFailed: (FirebaseAuthException authException) {
          print(
              'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
        },
        codeSent: (String verificationID, [int? forceResendingToken]) {
          print('Please check your phone for the verification code.');
          _verificationID = verificationID;
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          print("verification code: " + verificationID);
          _verificationID = verificationID;
        },
      );
    } catch (e) {
      print("Failed to Verify Phone Number: $e");
    }
  }

  Future<bool> loginWithPhoneNumber({required String smsCode}) async {
    try {
      final AuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: _verificationID,
        smsCode: smsCode,
      );
      _user = (await _auth.signInWithCredential(authCredential)).user!;

      print("Successfully signed in UID: ${_user!.uid}");
      return true;
    } catch (e) {
      print("Failed to sign in: " + e.toString());
      return false;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
