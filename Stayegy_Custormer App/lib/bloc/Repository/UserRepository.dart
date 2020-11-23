import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:stayegy/bloc/Repository/User_Details.dart';

class UserRepository {
  final auth.FirebaseAuth _firebaseAuth;
  FirebaseFirestore db = FirebaseFirestore.instance;

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

    return _firebaseAuth.signInWithCredential(authCredential);
  }

  Future<auth.User> getUser() async {
    auth.User user = await _firebaseAuth.currentUser;

    return user;
  }

  Future<bool> checkForRegistration(UserDetails user, String userId) async {
    final String uid = userId;
    final documentReference = await db.collection("users").doc(userId).get();

    if (documentReference.exists) {
      return true;
    } else {
      await documentReference.reference.set(user.toJason());
      return false;
    }
  }

  Future<void> logOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
    ]);
  }
}
