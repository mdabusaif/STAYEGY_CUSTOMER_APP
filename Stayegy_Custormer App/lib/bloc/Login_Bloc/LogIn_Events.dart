import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';

abstract class LogInEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SendOtpEvent extends LogInEvent {
  final String phoNo;

  SendOtpEvent({this.phoNo});
}

class AppStartEvent extends LogInEvent {}

class VerifyOtpEvent extends LogInEvent {
  final String otp;

  VerifyOtpEvent({this.otp});
}

class OtpSentEvent extends LogInEvent {}

class LogInCompleteEvent extends LogInEvent {
  final auth.User firebaseUser;
  LogInCompleteEvent(this.firebaseUser);
}

class LogInExceptionEvent extends LogInEvent {
  final String message;

  LogInExceptionEvent(this.message);
}

class UploadDetailsEvent extends LogInEvent {
  final String name;
  final String email;
  final String gender;
  final File image;

  UploadDetailsEvent({this.name, this.email, this.gender, this.image});
}

class UpdateUserDetailsEvent extends LogInEvent {
  final String name;
  final String email;
  final File image;
  final String operationType;

  UpdateUserDetailsEvent({this.name, this.email, this.image, @required this.operationType});
}
