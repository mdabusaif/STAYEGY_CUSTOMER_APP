import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:stayegy/bloc/Repository/User_Details.dart';

class UserRepository {
  final auth.FirebaseAuth _firebaseAuth;

  UserRepository({auth.FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  Future<void> sendOTP(
      String phoneNumber,
      Duration timeOut,
      auth.PhoneVerificationCompleted phoneVerificationCompleted,
      auth.PhoneVerificationFailed phoneVerificationFailed,
      auth.PhoneCodeSent phoneCodeSent,
      auth.PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout) async {
    _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout);
  }

  Future<auth.UserCredential> verifyAndLogin(
      String verificationId, String smsCode) async {
    auth.AuthCredential authCredential =
        await auth.PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);

    UserDetails _userDetails;

    /// TODO: repair this part or remove then part
    _firebaseAuth.signInWithCredential(authCredential).then((authResult) {
      _userDetails = UserDetails(name: authResult.user.displayName);
    });
  }

  Future<auth.User> getUser() async {
    auth.User user = await _firebaseAuth.currentUser;

    return user;
  }

  Future<void> logOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
    ]);
  }
}
