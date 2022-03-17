import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth;
  late String _verificationID;
  User? _user;
  String? _errors;

  AuthService(this._auth);

  User? get getUser => _user;
  User? get getCurrentUser => FirebaseAuth.instance.currentUser;
  String? get getError => _errors;

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
          _errors = "${authException.code}";
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
      _errors = "Express Error: $e";
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
    } on FirebaseAuthException catch (e) {
      // _errors = "SutarHut Express:${e.code}";
      if (e.code == "invalid-verification-code") {
        _errors = "Wrong Verification Code";
      } else if (e.code == "account-exists-with-different-credential") {
        _errors = "Phone number already exists";
      } else if (e.code == "invalid-credential") {
        _errors = "Invalid Credential";
      } else if (e.code == "operation-not-allowed") {
        _errors = "Permission Denied";
      } else if (e.code == "user-disabled") {
        _errors = "Your account has been blocked";
      } else if (e.code == "user-not-found") {
        _errors = "No account found";
      } else if (e.code == "wrong-password") {
        _errors = "Wrong Password";
      } else if (e.code == "invalid-verification-id") {
        _errors = "Verification ID is not valid";
      }
      print("Failed to sign in: " + e.code.toString());
      return false;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
