import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:stayegy/bloc/Repository/Hotels/HotelDetails.dart';

import 'User_Details.dart';

class UserRepository {
  final auth.FirebaseAuth _firebaseAuth;
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  UserRepository({auth.FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  Future<void> sendOTP(String phoneNumber, Duration timeOut, auth.PhoneVerificationCompleted phoneVerificationCompleted, auth.PhoneVerificationFailed phoneVerificationFailed, auth.PhoneCodeSent phoneCodeSent, auth.PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout) async {
    _firebaseAuth.verifyPhoneNumber(phoneNumber: phoneNumber, verificationCompleted: phoneVerificationCompleted, verificationFailed: phoneVerificationFailed, codeSent: phoneCodeSent, codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout);
  }

  Future<auth.UserCredential> verifyAndLogin(String verificationId, String smsCode) async {
    auth.AuthCredential authCredential = auth.PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

    return _firebaseAuth.signInWithCredential(authCredential);
  }

  Future<auth.User> getUser() async {
    auth.User user = _firebaseAuth.currentUser;

    return user;
  }

  Future<bool> checkForRegistration(UserDetails user, String userId) async {
    final String uid = userId;
    final documentReference = await db.collection("users").doc(userId).get();

    if (documentReference.exists) {
      return true;
    } else {
      user.uid = uid;
      await documentReference.reference.set(user.toJason());
      return false;
    }
  }

  Future<UserDetails> loadUserDetails(String uid) async {
    final documentReference = await db.collection("users").doc(uid).get();

    UserDetails userDetails = UserDetails.fromMap(documentReference.data());

    return userDetails;
  }

  Future<void> uploadUserDetails({UserDetails user, String name, String email, String phoneNumber, String gender, File image}) async {
    String picUrl;

    if (image != null) {
      picUrl = await uploadPictureAndGetUrl(image);
    } else {
      picUrl = "";
    }

    user.valueSetter(name: name, email: email, phoneNumber: phoneNumber, gender: gender, picUrl: picUrl);

    final documentReference = await db.collection("users").doc(user.uid).get();
    await documentReference.reference.set(user.toJason());
  }

  Future<String> uploadPictureAndGetUrl(File image) async {
    var snapshot = await storage.ref().child('userPhotos/${basename(image.path)}}').putFile(image);
    return await snapshot.ref.getDownloadURL();
  }

  Future<void> updateUserInfo({String name, String email, File imageFile, String currentImageURL, @required String operationType, @required String uid}) async {
    final documentReference = await db.collection("users").doc(uid).get();

    switch (operationType) {
      case 'name':
        await documentReference.reference.update({'name': name});
        break;
      case 'email':
        await documentReference.reference.update({'email': email});
        break;
      case 'photo':
        if (currentImageURL.isNotEmpty) {
          await storage.refFromURL(currentImageURL).delete();
        }
        String picURL = await uploadPictureAndGetUrl(imageFile);
        await documentReference.reference.update({'avatarPicURL': picURL});
        break;
    }
  }

  Future<List<Hotel>> getHomePageHotels() async {
    List<Hotel> searchedList = [];

    QuerySnapshot querySnapshot = await db.collection("hotels").limit(3).get();
    print(querySnapshot.docs.length);
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      searchedList.add(Hotel.fromMap(querySnapshot.docs[i].data()));
      print("${querySnapshot.docs.first.toString()} ++++ has been added to searched list!");
    }

    return searchedList;
  }

  Future<void> logOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
    ]);
  }
}
