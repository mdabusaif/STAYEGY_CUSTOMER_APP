import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class LogInState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialLogInState extends LogInState {
  @override
  List<Object> get props => [];
}

class OtpSentState extends LogInState {
  @override
  List<Object> get props => [];
}

class LoadingState extends LogInState {
  @override
  List<Object> get props => [];
}

class OtpVerifiedState extends LogInState {
  @override
  List<Object> get props => [];
}

class LogInCompleteState extends LogInState {
  final auth.User _fireBaseUser;

  LogInCompleteState(this._fireBaseUser);

  auth.User getUser() {
    return _fireBaseUser;
  }

  @override
  List<Object> get props => [_fireBaseUser];
}

class RegistrationNeededState extends LogInState {
  final auth.User _firebaseUser;

  RegistrationNeededState(this._firebaseUser);

  auth.User gerUser() {
    return _firebaseUser;
  }

  @override
  List<Object> get props => [_firebaseUser];
}

class ExceptionState extends LogInState {
  final String message;

  ExceptionState({this.message});

  @override
  List<Object> get props => [message];
}

class OtpExceptionState extends LogInState {
  final String message;

  OtpExceptionState({this.message});

  @override
  List<Object> get props => [message];
}
