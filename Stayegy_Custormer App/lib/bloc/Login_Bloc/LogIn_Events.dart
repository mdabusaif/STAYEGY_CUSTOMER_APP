import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class LogInEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SendOtpEvent extends LogInEvent {
  String phoNo;

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
